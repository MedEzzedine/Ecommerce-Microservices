pipeline {
    agent any

// tools {
//     maven 'Maven3'
//     jdk 'Java17'
// }

    stage('Feature PR to test') {

        when {
            changeRequest target: 'test'
            branch pattern: "feature/[a-zA-Z_0-9]+", comparator: "REGEXP"
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

    //////////////////////////////////////////////////


    stage('Test branch pipeline') {

        when {
            branch 'test'
        }
        stages {

            stage('Git checkout') {
                    steps {
                        git changelog: false, poll: false, url: 'https://github.com/MedEzzedine/Ecommerce-Microservices'
                    }
                }
            stage('Build docker image') {
                steps {
                    echo "Build docker image"
                }
            }

            stage('Vulnerability scan') {
                steps {
                    echo "Vulnerability scan"
                }
            }

            stage('Push to Dockerhub') {
                steps {
                    echo "Push to Dockerhub"
                }
            }

            stage('Kubectl apply new deployment') {
                steps {
                    echo "Kubectl apply new deployment"
                }
            }

            stage('Integration testing') {
                steps {
                    echo "Integration testing"
                }
            }
            
    }
    }


    //////////////////////////////////////////////////


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