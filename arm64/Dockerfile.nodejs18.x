FROM scratch

ADD 19c6db8143e6ab00366cb3ff6a1a3b2dd9d41bc46935d86cdc2555485bb30808.tar.xz /
ADD 1aa5cbc6c4c628ee116ecc9b9f91bdcec7c0dd5c6ad53d760faf00e7ca2d5633.tar.xz /
ADD 3ab2c7b1a4327c91c44ec0f8751e2096e8927433c8ab12516ce43f2cc7c1ba45.tar.xz /
ADD 937c4dd89f54b734aa90839593829f3293ff2c14144f60d6418004ca87a16425.tar.xz /
ADD d98b47ba71ceedfc08b971f12f53955ce5dc3ac00419cded08338ed51212704f.tar.xz /
ADD f9f2917d9767aa0d125387920820d6060235feae1eeaf78263f5879364b108c4.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
