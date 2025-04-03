FROM scratch

ADD 0bfefa44004483b59791a74d1b6bd28d5a2c580329cb293f96b64149681b247a.tar.xz /
ADD 280da0360515e7617a346ef1f58be76fc684510f36aeefae38a83ad5d2b8ae53.tar.xz /
ADD 3e30d40b30a0ce751d2085024dd92a21a75ea9239cfe01b9faf5b1fd6888714e.tar.xz /
ADD adf515243a4fae8abb4d2cf0ac6a0df2fcc1ad32aafd8bb26e04e8dfd916d88a.tar.xz /
ADD eea99930528d636abdde1b39cb13df670aebf24e7a3bbe675667248684ebdbd5.tar.xz /
ADD f7ded83166883f0214239831865fb79a8a264420a15334a00dee116a7b856834.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
