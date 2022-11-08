FROM nicolaka/netshoot:v0.8

RUN \
  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
  && curl -L https://github.com/pete911/certinfo/releases/download/v1.0.7/certinfo_1.0.7_linux_amd64.tar.gz | tar -zx -C /usr/local/bin/ \
  && apk add --update coreutils && rm -rf /var/cache/apk/*
