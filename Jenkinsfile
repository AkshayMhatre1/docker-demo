pipeline {
    agent any
    
    environment {
        DOCKER_HOME = 'C:\\Program Files\\Docker'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                bat "${DOCKER_HOME}\\docker.exe build -t my-mule-app:latest ."
            }
        }
        
        stage('Deploy to Docker Desktop') {
            steps {
                bat "${DOCKER_HOME}\\docker.exe run -p 8081:8081 --name my-mule-app -d my-mule-app:latest"
            }
        }
    }
}
