FROM scratch
ADD x86_64/42043ad0278369152f0832fd3d4e8f1227c26832ce42d48defb0c3e032c9060b.tar.xz /
ADD x86_64/566d15d9074f39b9d1d637f742c9678d18e17fb8fb0893f362f85d015a808f7e.tar.xz /
ADD x86_64/8b87dfec469b2d348ddf8060fc06647f2100c900aef6fb3ebdc96a38c4cfe348.tar.xz /
ADD x86_64/8efe3eeeaab099c3ae1a237c86e53eef88c4edcd83006ff778ac0697b1f26b33.tar.xz /
ADD x86_64/a401f2d011f837c8c4d441b9fd65e8908a68377139a014acc030acac39a71072.tar.xz /
ADD x86_64/ce94230c73bde4db4f73658548090739029d6a3645e2b02665f958d9d361e032.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
