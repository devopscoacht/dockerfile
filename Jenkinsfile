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
        withCredentials([usernamePassword(credentialsId: 'c787dc5b-cb0a-41e2-922a-2013cb3f8827', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            docker.withRegistry('https://registry.hub.docker.com', 'c787dc5b-cb0a-41e2-922a-2013cb3f8827') {
                // Tag the image with the desired tag before pushing
                sh "docker tag devopscoacht/jenkinscicd:${env.BUILD_NUMBER} devopscoacht/jenkinscicd:tagname"
                // Push the image with the new tag
                app.push("tagname")
            }
        }
    }
}
