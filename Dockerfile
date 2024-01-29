FROM ghcr.io/cargo-lambda/cargo-lambda:1.0.1

ENV NODE_VERSION=20.11.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN npm install -g esbuild 
RUN npm install -g yarn 
RUN npm install -g typescript 
RUN npm install -g newman
RUN npm install -g aws-cdk
RUN npm cache clean --force
