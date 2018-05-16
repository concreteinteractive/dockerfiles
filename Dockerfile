FROM blitznote/debase:18.04

RUN apt-get update && \
	apt-get install -y --no-install-recommends git openssh-client make python3 python3-pip python3-setuptools && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/download && \
	curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
	mv /tmp/download/docker/docker /usr/bin/ && \
	curl -L https://github.com/git-lfs/git-lfs/releases/download/v2.3.4/git-lfs-linux-amd64-2.3.4.tar.gz | tar -xz -C /tmp/download && \
	mv /tmp/download/git-lfs-2.3.4/git-lfs /usr/bin && \
	git lfs install && \
	rm -rf /tmp/download && \
	curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose && \
	chmod +x /usr/bin/docker-compose

RUN python3 -m pip install --upgrade pip && pip3 install awscli virtualenv
