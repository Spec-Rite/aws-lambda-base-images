FROM scratch

ADD 3505a17f1bb44dd667436973127a56024e6c0712581c26e5aeb4c3bb32091d47.tar.xz /
ADD 4c13d4a6ee98b2e5e4b6c4f0ebacc270ff894f9f33057bc5c81917f85fce6089.tar.xz /
ADD 566b36ae85091b82ad012b46c140ac36f33f6e16533db567995d894d997bf5e9.tar.xz /
ADD a8ea9149500418b343dc9487f4ea3be566f01b083be195f46256637691cc01c4.tar.xz /
ADD bd28d78d43d9e67d97eb650106fae51021f093506c2665811d6fb58b1e5da8ab.tar.xz /
ADD eb7d6c43a1276839d1eb3ca1b713bd3b71fcc9c20d6b6375104b68d4dec79864.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
