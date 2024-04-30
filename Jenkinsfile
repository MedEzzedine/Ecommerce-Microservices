pipeline {
    agent any

// tools {
//     maven 'Maven3'
//     jdk 'Java17'
// }

    stages {
        stage('Feature PR to test') {
            when {
                changeRequest target: 'test'
                branch pattern: "feature/[a-zA-Z_0-9]+", comparator: "REGEXP"
                beforeAgent true
            }

            stages {

                stage('Git checkout') {
                        steps {
                            git changelog: false, poll: false, url: 'https://github.com/MedEzzedine/Ecommerce-Microservices'
                        }
                    }
                    
                stage('Compile') {
                    steps {
                        echo "Compile"
                    }
                }
                stage('Unit testing') {
                    steps {
                        echo "Unit testing"
                    }
                }
                stage('Build Stage') {
                    steps {
                        echo "Building"
                    }
                }
                stage('SonarQube SAST') {
                    steps {
                        echo "SonarQube SAST"
                    }
                }
                stage('Quality Gates') {
                    steps {
                        echo "Quality "
                    }
                }
            }
        }
    }
}