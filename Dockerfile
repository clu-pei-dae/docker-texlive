FROM ubuntu:18.04

LABEL author="Mirko Hering <mirko@jmhering.net>" \
      ubuntu="18.04"

# Install required packages and cleanup
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update && apt-get install -y \
    texlive \
    texlive-lang-german \
    texlive-latex-extra \
    texlive-fonts-extra \
    latexmk \
    git \
    curl \
 && rm -rf /var/lib/apt/lists/*

# Setup timezone
RUN ln -fs /usr/share/zoneinfo/Europ/Berlin /etc/localtime \
  && dpkg-reconfigure --frontend noninteractive tzdata

