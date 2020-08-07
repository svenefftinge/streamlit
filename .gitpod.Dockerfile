FROM gitpod/workspace-full

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update

# Install Pyenv for testing multiple Python versions
RUN sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl mysql-client libmysqlclient-dev unixodbc-dev
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Install some other deps
RUN sudo apt install graphviz python3-distutils

# Install Yarn, pip, Protobuf, npm
RUN sudo apt install yarn npm python-pip protobuf-compiler libgconf-2-4
# (libgconf is for our e2e tests in Cypress)

RUN pip install pipenv
