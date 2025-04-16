import jwt
from jwt import PyJWKClient
from bson import ObjectId

def process_token_auth_header(auth=None):
    """Obtains the access token from the Authorization Header
    """
    if not auth:
        print("authorization_header_missing")
        return False

    parts = auth.split()

    if parts[0].lower() != "bearer":
        print("authorization_header must start with bearer")
        return False

    elif len(parts) == 1:
        print("token not found")
        return False

    elif len(parts) > 2:
        print("authorization_header must be bearer token")
        return False

    token = parts[1]
    return token

def verify_token(authorization: str, secrets: dict):
    token = process_token_auth_header(authorization)

    if token == False:
        return False

    url =f"https://{secrets['AUTH0_DOMAIN']}/.well-known/jwks.json"
    client = PyJWKClient(url)
    signing_key = client.get_signing_key_from_jwt(token).key
    if signing_key:
        try:
            payload = jwt.decode(
                token,
                signing_key,
                algorithms=secrets['ALGORITHMS'],
                audience=secrets['API_AUDIENCE'],
                issuer="https://"+secrets['AUTH0_DOMAIN']+"/"
            )
        except jwt.ExpiredSignatureError:
            print("auth token expired")
            return False
        except Exception as e:
            print(f"unable to parse auth token ::::{e}")
            return False

        return token, payload

    print("unable to find key")
    return False

def verify(token, secrets):
    # Get credentials out of secrets manager (attempting to handle in lambda)
    # secret_name = "stage/auth0"
    # region_name = "us-east-2"

    # session = boto3.session.Session()
    # client = session.client(
    #     service_name='secretsmanager',
    #     region_name=region_name
    # )

    # get_secret_value_response = client.get_secret_value(
    #     SecretId=secret_name
    # )
        
    # secret = get_secret_value_response['SecretString']
    # secrets = json.loads(secret)

    for k in ['ALGORITHMS', 'API_AUDIENCE', 'AUTH0_DOMAIN']:
        if k not in secrets:
            print("Auth Layer Error: AWS Secrets incomplete")
            return False

    token_info = verify_token(token, secrets)

    if token_info == False:
        print("Auth Layer Error: token_info false")
        return False

    token, payload = token_info
    sub = payload.get('sub')
    sub_parts = sub.split('|')
    if len(sub_parts) == 2:
        uid = sub_parts[1]
    else:
        uid = sub

    try:
        if isinstance(uid, str):
            uid = ObjectId(uid)
        elif not isinstance(uid, ObjectId):
            print("Auth Layer Error: uid not instance of ObjectId")
            return False
    except Exception as e:
        print(f"Error: {e}")
        return False

    return str(uid)

