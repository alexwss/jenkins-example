pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh('echo "teste"')
      }
    }

    stage('Curl Test Endpoint') {
            steps {
                script {
                    def payload = '{"name":"alex", "surname":"silva"}'
                    sh "curl -s -d '${payload}' -H 'Content-Type: application/json' -X POST http://localhost:8090/test"
                }
            }
        }
  }
}
