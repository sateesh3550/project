pipeline {
    agent any

    node {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage "initial script" {
            sh "/root/test1.sh testfile"
            }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
