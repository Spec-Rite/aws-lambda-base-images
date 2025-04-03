FROM scratch

ADD 0bfefa44004483b59791a74d1b6bd28d5a2c580329cb293f96b64149681b247a.tar.xz /
ADD 0c99838d30621931bf30002407304a8f6d5a3177dca178e7b832dd786f45aa1e.tar.xz /
ADD 4911044538e75a3bcb259895c9b1e253e1d55f415b71d40fbdc197707631c29d.tar.xz /
ADD 5fbabeac7a6872ba51da0917ef778f4f7423031d9272ab6c6754c01ed724958d.tar.xz /
ADD c663c1b7ca2824ccd9683fe27a04f4166c193b5864dbbafcf93b0f1404244ae9.tar.xz /
ADD db7388287afe14a10c7e7b718b5f5d37c5a3b2543865fddde4225a00e3889bde.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
