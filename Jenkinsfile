pipeline {
    agent any
    stages {
        stage('Build Mule App') {
            steps {
                bat 'mvn clean install'
                bat 'copy target/*.jar C:/opt/my-mule-app/'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-mule-app .'
            }
        }
        stage('Deploy to Docker Desktop') {
            steps {
                bat 'docker run -d -p 8081:8081 my-mule-app'
            }
        }
    }
}
