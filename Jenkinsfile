node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("devopscoacht/jenkinscicd:${env.BUILD_NUMBER}")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        withCredentials([usernamePassword(credentialsId: '5becc967-5f2e-4d5d-a5bd-a8a99713a6aa', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            docker.withRegistry('https://registry.hub.docker.com', '5becc967-5f2e-4d5d-a5bd-a8a99713a6aa') {
                // Tag the image with the desired tag before pushing
                sh "docker tag devopscoacht/jenkinscicd:${env.BUILD_NUMBER} devopscoacht/jenkinscicd:classApp"
                // Push the image with the new tag
                app.push("classApp")
            }
        }
    }
}
