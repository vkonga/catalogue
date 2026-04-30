pipleline {
    agent {
        label 'AGENT-1'
    }
    // environment {
    //     appVersion: ''
    // }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }

    stages {
        // stage ('Read package.json') {
        //     steps {
        //         script {
        //             def packagejson = readJSON file: 'package.json'
        //             appVersion = packageJson.version
        //             echo "Package version: ${appVersion}"
        //         }
        //     }
        // }

        // stage ('Install Dependencies') {
        //     steps {
        //         script {
        //             sh """
        //                 npm install

        //                 """
        //         }
        //     }
        // }
        
        stage('Build') {
            steps {
                script {
                    sh """
                        echo "Hello Build"
                        sleep 10
                       """
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