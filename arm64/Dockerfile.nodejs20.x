FROM scratch

ADD 4b231d2a7a595efdc892602f686c4022c49fe156872119d7a175ae04a08ba065.tar.xz /
ADD 4c13d4a6ee98b2e5e4b6c4f0ebacc270ff894f9f33057bc5c81917f85fce6089.tar.xz /
ADD 7156234e42cd0d734f5c9ec619e452ffae4abd432698f45d385eb6b25a97d57b.tar.xz /
ADD 721103de2f614415e61b4fac8175f1733086c2e319105928fdbed496855b5a14.tar.xz /
ADD dbcb738d5514e0c77cd61130893b798518d89f594a70fbd97c7a875d66422166.tar.xz /
ADD eec1e6e0f0702e0950e2610e5344168ac049e886359d7f9a3db95ec190596550.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
