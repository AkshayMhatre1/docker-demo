pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-mule-app .'
            }
        }
        stage('Run Docker Container') {
            steps {
                bat 'docker run -p 8080:8080 my-mule-app'
            }
        }
    }
}
