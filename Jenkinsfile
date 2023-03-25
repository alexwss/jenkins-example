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
                    sh "curl -v -d '${payload}' -H 'Content-Type: application/json' -X POST http://192.168.56.1:8090/test"
                }
            }
        }
  }
}
