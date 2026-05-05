pipeline {
    agent {
        label 'agent-1'
    }
    environment {
        appVersion = ''
        region = 'us-east-1'
        accountId = '781195020338'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    // Build
    stages {
        stage ('Read package.json') {
            steps {
                script {
                    def packageJson = readJSON file: 'package.json'
                    appVersion = packageJson.version
                    echo "Package version: ${env.appVersion}"
                }
            }
        }

        stage ('Install Dependencies') {
            steps {
                script {
                    sh """
                        npm install

                        """
                }
            }
        }

        stage ('Docker Build') {
            steps {
                script {
                    withAWS(credentials: 'aws-auth', region: 'us-east-1') {
                        sh """
                            aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${accountId}.dkr.ecr.${region}.amazonaws.com
                            docker build -t ${accountId}.dkr.ecr.${region}.amazonaws.com/electronic-shop/catalogue:${appVersion} .
                            docker push ${accountId}.dkr.ecr.${region}.amazonaws.com/electronic-shop/catalogue:${appVersion}
                            """
                    }
                
                }
            }
        }
        
        
        stage('Test') {
            steps {
                script {
                    echo 'Testing...'
                }
            }
        }
    }

    post {
        always {
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success {
            echo 'Hello Success'
        }
        failure {
            echo 'Hello Failure'
        }
    }
}