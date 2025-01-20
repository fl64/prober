FROM nicolaka/netshoot:v0.13

# https://github.com/pete911/certinfo
ARG CERT_INFO_VER=1.0.31

# https://github.com/goss-org/goss
ARG GOSS_VER=0.4.9

# https://github.com/google/go-containerregistry
ARG CRAIN_VER=0.20.3

# https://github.com/kubernetes-sigs/kustomize
ARG KUSTOMIZE_VER=5.6.0

RUN \
  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
  \
  && curl -L https://github.com/pete911/certinfo/releases/download/v${CERT_INFO_VER}/certinfo_${CERT_INFO_VER}_linux_amd64.tar.gz | tar -zx -C /usr/local/bin/ certinfo \
  && chmod +x  /usr/local/bin/certinfo \
  \
  && curl -L https://github.com/goss-org/goss/releases/download/v${GOSS_VER}/goss-linux-amd64 -o /usr/local/bin/goss \
  && chmod +x  /usr/local/bin/goss \
  \
  && curl -L https://github.com/google/go-containerregistry/releases/download/v${CRAIN_VER}/go-containerregistry_Linux_x86_64.tar.gz | tar -xz -C /usr/local/bin/ crane \
  && chmod +x  /usr/local/bin/crane \
  \
  && curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz  | tar -xz -C /usr/local/bin/ kustomize \
  && chmod +x  /usr/local/bin/kubectl \
  && apk add --update coreutils envsubst iperf3 && rm -rf /var/cache/apk/*
