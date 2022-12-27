FROM nicolaka/netshoot:v0.8

RUN \
  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
  && curl -L https://github.com/pete911/certinfo/releases/download/v1.0.7/certinfo_1.0.7_linux_amd64.tar.gz | tar -zx -C /usr/local/bin/ \
  && chmod +x  /usr/local/bin/certinfo \
  && curl -L https://github.com/goss-org/goss/releases/download/v0.3.20/goss-linux-amd64 -o /usr/local/bin/goss \
  && chmod +x  /usr/local/bin/goss \
  && curl -L https://github.com/fullstorydev/grpcurl/releases/download/v1.8.7/grpcurl_1.8.7_linux_x86_64.tar.gz | tar -xz -C /usr/local/bin/ \
  && chmod +x  /usr/local/bin/grpcurl \
  && curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.5.7/kustomize_v4.5.7_linux_amd64.tar.gz  | tar -xz -C /usr/local/bin/ \
  && chmod +x  /usr/local/bin/kubectl \
  && apk add --update coreutils && rm -rf /var/cache/apk/*
