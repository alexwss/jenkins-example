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
                    def payload = '{"teste": "teste"}'
                    def response = sh(
                            script: "curl -v -w 'Status:%{http_code}' -d '${payload}' -H 'Content-Type: application/json' -X POST http://192.168.56.1:8090/test",
                            returnStdout: true
                        )
                    def status = sh(returnStatus: true, script: "echo \$?")
                    echo "teste ${status}"
                    
                }
            }
        }
  }
}
