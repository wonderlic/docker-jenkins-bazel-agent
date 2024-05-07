FROM jenkins/inbound-agent:latest
LABEL maintainer="Wonderlic DevOps <DevOps@wonderlic.com>"

USER root

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends zstd g++ build-essential libsecret-1-0 python3-minimal psmisc uuid-runtime && \
	rm -rf /var/lib/apt/lists/*

RUN \
	curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64 --output /usr/bin/bazel && \
	chmod +x /usr/bin/bazel

USER jenkins
