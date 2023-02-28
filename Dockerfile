FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base

FROM base AS final
RUN apt-get update

# INSTALL NPM
RUN apt-get install -y npm

# INSTALL PIP
RUN apt install -y python3-pip

# INSTALL AWS CLI
RUN pip install awscli==1.27.80
# UPDATE NODE JSRUN npm cache clean -f
RUN npm install -g n
RUN n stable

# INSTALL LOCALSTACK CDK + AWS CDK
RUN npm install -g aws-cdk@2.66.1

RUN npm install -g aws-cdk-local@2.17.0