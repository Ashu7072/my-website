pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-website"
        CONTAINER_NAME = "website-container"
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo "Cloning source code..."
                // git url: 'https://github.com/Ashu7072/my-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Stop Existing Container') {
            steps {
                script {
                    // Stop and remove the container if it already exists
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} -p 8081:80 ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo "Website deployed at http://localhost:8081"
        }
        failure {
            echo "Build or deployment failed."
        }
    }
}

