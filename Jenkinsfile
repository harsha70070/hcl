pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REGISTRY = '539935451710.dkr.ecr.us-east-1.amazonaws.com'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Appointment Service') {
            steps {
                dir('docker/appointment-service') {
                    script {
                        def imageName = 'appointment-service'
                        def imageTag = 'latest'
                        def fullImageName = "${ECR_REGISTRY}/${imageName}:${imageTag}"

                        sh """
                            echo "Logging in to Amazon ECR..."
                            aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}

                            echo "Building Docker image for ${imageName}..."
                            docker build -t ${imageName} .

                            echo "Tagging Docker image..."
                            docker tag ${imageName}:latest ${fullImageName}

                            echo "Pushing Docker image to ECR..."
                            docker push ${fullImageName}
                        """
                    }
                }
            }
        }

        stage('Build and Push Patient Service') {
            steps {
                dir('patient-service') {
                    script {
                        def imageName = 'patient-service'
                        def imageTag = 'latest'
                        def fullImageName = "${ECR_REGISTRY}/${imageName}:${imageTag}"

                        sh """
                            echo "Logging in to Amazon ECR..."
                            aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}

                            echo "Building Docker image for ${imageName}..."
                            docker build -t ${imageName} .

                            echo "Tagging Docker image..."
                            docker tag ${imageName}:latest ${fullImageName}

                            echo "Pushing Docker image to ECR..."
                            docker push ${fullImageName}
                        """
                    }
                }
            }
        }
    }
}
