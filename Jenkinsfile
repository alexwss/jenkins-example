pipeline {
    agent any

    environment {
        TESTE_ALEX = ''
        URL_TEST = ''
    }

    stages {

        stage('Set Environment Variables') {
            steps {
                script  {
                    def envFileContent = readFile('.env').split('\n') as List

                    def envMap = envFileContent.collectEntries { envVar ->
                        def key = envVar.substring(0, envVar.indexOf('='))
                        def value = envVar.substring(envVar.indexOf('=') + 1)
                        [(key): value]
                    }

                    TESTE_ALEX = envMap.get('TESTE_ALEX')
                    echo "${TESTE_ALEX}"

                    switch (env.BRANCH_NAME) {
                    case 'develop':
                        URL_TEST = 'http://dev'
                        break
                    case 'staging':
                        URL_TEST = 'http://cert'
                        break
                    case 'master':
                        URL_TEST = 'http://prod'
                        break
                    default:
                        error "Unsupported branch: ${env.BRANCH_NAME}"
                    }

                    echo "${URL_TEST}"
                }
            }
        }

        stage('Build') {
            steps {
                echo "${env.BRANCH_NAME}"
                sh('echo "teste"')
            }
        }

        stage('Curl Test Endpoint') {
            steps {
                script  {
                    try {
                        def payload = '{"teste": "teste"}'
                        def curlCommand = "curl -v -w '&%{http_code}' -d '${payload}' -H 'Content-Type: application/json' -X POST http://192.168.56.1:8090/test"
                        def response = sh(
                            script: curlCommand,
                            returnStdout: true
                        )

                        def statusCode = response.substring(response.lastIndexOf('&') + 1, response.length())
                        echo "statusCode: ${statusCode}"

                        def rawJson = response.substring(0, response.lastIndexOf('&'))
                        def json = readJSON(text: rawJson)
                        echo "${json}"
                    } catch (Exception ex) {
                        error "Error: ${ex}"
                    }
                }
            }
        }
    }
}