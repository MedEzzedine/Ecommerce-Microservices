pipeline {
    agent any

// tools {
//     maven 'Maven3'
//     jdk 'Java17'
// }

    stages {
        stage('Main branch pipeline') {

        when {
            branch 'main'
        }
        stages {

            stage('Git checkout') {
                    steps {
                        checkout changelog: false, poll: false, scm: scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_credentials', url: 'https://github.com/MedEzzedine/Ecommerce-Microservices']])
                    }
                }
            stage('Compile') {
                steps {
                    echo "Hello from main"
                }
            }
            
    }
    }
    }

}