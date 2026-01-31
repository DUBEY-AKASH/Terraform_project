FROM jenkins/jenkins:lts

# Switch to root to install packages
USER root

# Install dependencies and Terraform
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip && \
    unzip terraform_1.6.3_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.6.3_linux_amd64.zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jenkins user
USER jenkins
