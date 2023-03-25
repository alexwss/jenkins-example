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
                script  {

                    try {
                        
                        def payload = '{"teste": "teste"}'
                        def response = sh(
                                script: "curl -v -d '${payload}' -H 'Content-Type: application/json' -X POST http://192.168.56.1:8090/test",
                                returnStdout: true
                            )
                        def status = sh(returnStatus: true, script: "echo \$?")
                        echo "teste ${status} ..."

                        def json = readJSON(text: response)
                        echo "${json}"

                    } catch(Exception ex) {
                        error "Deu ruim markinhos ${ex.toString()}"
                    }

                    
                }
            }
        }
  }
}
