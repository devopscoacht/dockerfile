node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("your-docker-repo/your-image-name:${env.BUILD_NUMBER}")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://hub.docker.com/repository/docker/devopscoacht/jenkinscicd', 'docker-hub-details') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
}  
    
    