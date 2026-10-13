FROM ubuntu:latest

ARG USER_ID=1001
ARG GROUP_ID=1001
ENV USER=ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    xz-utils \
    sudo \
    && rm -rf /var/lib/apt/lists/*

#RUN groupadd -g ${GROUP_ID} ${USER} && \
#    useradd -l -u ${USER_ID} -g user -m -s /bin/bash user && \
#    usermod -aG sudo ${USER} && \
#    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN usermod -aG sudo ${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/${USER}
#RUN chown -R ${USER}:${USER} /app

USER ${USER}

RUN curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --no-daemon

ENV PATH="/home/${USER}/.nix-profile/bin:${PATH}"

RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
    #    echo "ssl-cert-file = /usr/local/share/ca-certificates/root_ca.crt" >> ~/.config/nix/nix.conf

CMD ["bash"]
