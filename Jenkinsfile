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
            def curlCommand = "curl -v -w 'status:%{http_code}' -d '${payload}' -H 'Content-Type: application/json' -X POST http://192.168.56.1:8090/test"
            def response = sh(
              script: curlCommand,
              returnStdout: true
            )

            echo "${response}"

            // def status = response.trim()
            // echo "HTTP status code: ${status}"

            def json = readJSON(text: response)
            echo "${json}"

          } catch(Exception ex) {
            error "Error: ${ex.toString()}"
          }
        }
      }
    }
  }
}
