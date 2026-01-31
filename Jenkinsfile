pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    environment {
        AWS_DEFAULT_REGION = "eu-north-1"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github_token_classic',
                    url: 'https://github.com/DUBEY-AKASH/Terraform_project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_cred']
                ]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_cred']
                ]) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply Terraform changes?'

                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_cred']
                ]) {
                    sh 'terraform apply tfplan'
                }
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
