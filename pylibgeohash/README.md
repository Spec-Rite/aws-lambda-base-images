## Pylibgeohash

This layer uses a build from source.
Repository: https://github.com/Spec-Rite/libgeohash, the repository includes a bugfix with the python binding. The source is included as a submodule and needs to be pulled from git.

### Requirements

The docker file had to be update to be able to build this package from source. Basic build tools are not installed on the lambda image by default.

``` bash
RUN dnf install -y freetype-devel gcc g++ cmake
RUN pip3 install setuptools
```

### Building the layer

1. Create new directory **pylibgeohash/python**.
2. Clone the source directory into **pylibgeohash**.
3. Run the docker container
4. Build the package from source
5. Install to the python directory
6. Cleanup
7. Package

``` bash
# Create directory
mkdir -p pylibgeohash/python
# Pull down the submodule
git submodule update --recursive --remote
# Run the container
docker run --name lambdalayer --rm --env HTTP_PROXY --env HTTPS_PROXY --env NO_PROXY --mount type=bind,source="$(pwd)"/pylibgeohash,target=/var/task/lambdalayer -it aws-lambda-python3.19:local bash
# Change to the repository directory
cd lambdalayer/libgeohash
# Run Cmake and Build
cmake .
make
python3 setup.py bdist_wheel
# Install to the python directory
pip3 install --target=../python dist/pylibgeohash*
# Cleanup - note these commands assume we are in python directory
cd ../python
rm -rf *.dist-info
exit	# Exit container
# Package
cd pylibgeohash
zip -r pylibgeohash.zip python
```
