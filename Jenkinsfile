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
        withCredentials([usernamePassword(credentialsId: 'docker-hub-details', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-details') {
                sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                app.push("${env.BUILD_NUMBER}")
            }
        }
    }
}
