pipeline {
    agent any
    stages {
        stage('Build Mule App') {
            steps {
                 sh 'mvn clean install'
                
                 sh 'mvn package'
        
            
                 sh 'cp target/my-mule-app.jar /opt/my-mule-app/'
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
