FROM nicolaka/netshoot:v0.11

RUN \
  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
  \
  && curl -L https://github.com/pete911/certinfo/releases/download/v1.0.21/certinfo_1.0.21_linux_amd64.tar.gz | tar -zx -C /usr/local/bin/ certinfo \
  && chmod +x  /usr/local/bin/certinfo \
  \
  && curl -L https://github.com/goss-org/goss/releases/download/v0.4.2/goss-linux-amd64 -o /usr/local/bin/goss \
  && chmod +x  /usr/local/bin/goss \
  \
  && curl -L https://github.com/google/go-containerregistry/releases/download/v0.16.1/go-containerregistry_Linux_x86_64.tar.gz | tar -xz -C /usr/local/bin/ crane \
  && chmod +x  /usr/local/bin/crane \
  \
  && curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.1.1/kustomize_v5.1.1_linux_amd64.tar.gz  | tar -xz -C /usr/local/bin/ kustomize \
  && chmod +x  /usr/local/bin/kubectl \
  && apk add --update coreutils envsubst && rm -rf /var/cache/apk/*
