node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("https://hub.docker.com/repository/docker/devopscoacht/jenkinscicd/:${env.BUILD_NUMBER}")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-details') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
}  
    
    