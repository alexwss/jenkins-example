pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Lint') {
      steps {
        sh 'npm run lint'
      }
    }
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          docker.build("my-node-app")
        }
      }
    }
    stage('Run Docker container') {
      steps {
        script {
          docker.run("my-node-app", "-p 8090:8090")
        }
      }
    }
  }
}
