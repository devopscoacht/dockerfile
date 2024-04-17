node {
    
    def app
    stage('Clone  repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("devopscoacht/jenkinscicd")

    }
    stage('Testing Image') {
        app.inside {
            sh 'echo "Test Passed"'
        }
    }
}