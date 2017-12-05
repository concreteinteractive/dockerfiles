FROM docker:latest

ENV LFS_VERSION 2.1.0

ENV PACKAGES "git curl openssh openssl ca-certificates groff less python py-pip"

RUN set -x \
  && apk add --no-cache $PACKAGES \
  && curl -fLO https://github.com/github/git-lfs/releases/download/v${LFS_VERSION}/git-lfs-linux-amd64-${LFS_VERSION}.tar.gz \
  && tar xf git-lfs-linux-amd64-${LFS_VERSION}.tar.gz \
  && mv git-lfs-${LFS_VERSION}/git-lfs /usr/local/bin/ \
  && rm -rf git-lfs-linux-amd64-${LFS_VERSION}.tar.gz git-lfs-${LFS_VERSION} \
  && git lfs install \
  && git lfs version

RUN pip install awscli
