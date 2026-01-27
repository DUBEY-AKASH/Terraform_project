pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_cred').accessKey
        AWS_SECRET_ACCESS_KEY = credentials('aws_cred').secretKey
        AWS_DEFAULT_REGION    = "eu-north-1"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-ssh-creds',
                    url: 'git@github.com:DUBEY-AKASH/Terraform_project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply Terraform changes?'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo 'Terraform infrastructure provisioned successfully'
        }
        failure {
            echo 'Terraform pipeline failed'
        }
    }
}
