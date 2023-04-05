pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        // Checkout Mule app code from version control
        checkout scm

        // Build Mule app using Maven
        bat "mvn clean package"

        // Copy Mule app to Docker build directory
        //bat "copy C:\\Users\\admin\\.jenkins\\workspace\\Dockerdemo-pipeline\\target\\*.jar .\\docker\\*.jar"
        bat "xcopy C:\\Users\\admin\\.jenkins\\workspace\\Dockerdemo-pipeline\\target\\*.jar .\\docker\\ /s /Y"


      }
    }

    stage('Build Docker image') {
      steps {
        // Build Docker image using Dockerfile
        bat "docker build -t my-mule-app:latest .\\docker"
      }
    }

    stage('Run Docker container') {
      steps {
        // Run Docker container using built image
        bat "docker run -d -p 8081:8081 -p 8091:8091 my-mule-app:latest"
      }
    }
  }
}
