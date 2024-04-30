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
                        git changelog: false, poll: false, url: 'https://github.com/MedEzzedine/Ecommerce-Microservices'
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