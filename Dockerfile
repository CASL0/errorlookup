FROM dart:3.0.7

RUN dart pub global activate fvm
ENV PATH /root/.pub-cache/bin:$PATH

RUN apt-get update -qqy && \
    apt-get install -qqy lcov

WORKDIR /opt/app
