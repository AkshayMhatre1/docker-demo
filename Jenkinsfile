pipeline {
    agent any
    stages {
        stage('Build Mule App') {
            steps {
                sh 'mvn clean install'
                sh 'cp target/my-mule-app.jar /opt/my-mule-app/'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-mule-app .'
            }
        }
        stage('Deploy to Docker Desktop') {
            steps {
                sh 'docker run -d -p 8081:8081 my-mule-app'
            }
        }
        
    }
}
