pipeline {
    agent any
    environment {
        TESTE_DEV = "${env.TESTE_ALEX}"
        URL_TEST = ''
    }
    stages {
        stage('Set Environment Variables') {
            steps {
                script {
                    echo "${TESTE_DEV}"

                    def envs = withEnv(readFile('${WORKSPACE}/.env').split('\n') as List)

                    for (Object o : envs) {
                        echo "${o}"
                    }

                    // Set URL_TEST based on the current branch
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
