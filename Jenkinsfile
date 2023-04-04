pipeline {
    agent any
    stages {
        stage('Build Mule App') {
            steps {
                // Execute commands to build your Mule application
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t docker-demo .'
            }
        }
        stage('Deploy to Docker Desktop') {
            steps {
                sh 'docker run -d -p 8081:8081 docker-demo'
            }
        }
        stage('Test Deployment') {
            steps {
                // Execute commands to test the deployment
            }
        }
    }
}
