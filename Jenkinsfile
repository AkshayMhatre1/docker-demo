pipeline {
    agent any
    
    environment {
        DOCKER_HOME = 'C:\\Docker'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                bat "docker build -t my-mule-app:latest C:\\Docker"
            }
        }
        
        stage('Deploy to Docker Desktop') {
            steps {
                bat "${DOCKER_HOME}\\docker.exe run -p 8081:8081 --name my-mule-app -d my-mule-app:latest"
            }
        }
    }
}
