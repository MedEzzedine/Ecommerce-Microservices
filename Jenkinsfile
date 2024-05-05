pipeline {
    agent any

// tools {
//     maven 'Maven3'
//     jdk 'Java17'
// }


    options {
        skipDefaultCheckout()
    }


    stages {

         ///////////////////////Main branch pipeline///////////////////////////////

        stage('Main branch pipeline') {

        when {
            branch 'main'
            beforeAgent true
        }
        stages {

            stage('Git from source checkout') {
                    steps {
                        checkout changelog: false, poll: false, scm: scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_credentials', url: 'https://github.com/MedEzzedine/Ecommerce-Microservices']])
                    }
                }
            stage('Compilation') {
                steps {
                    echo "Hello from main"
                }
            }
            
    }
    }

    ///////////////////////Test branch pipeline///////////////////////////////

        stage('Test branch pipeline') {

            when {
                branch 'test'
                beforeAgent true
            }

            stages {
                stage('Git checkout') {
                    steps {
                        checkout changelog: false, poll: false, scm: scmGit(branches: [[name: 'test']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_credentials', url: 'https://github.com/MedEzzedine/Ecommerce-Microservices']])
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


    ///////////////////////PR pipeline///////////////////////////////


        stage('Feature PR to test') {
            when {
                changeRequest target: 'test'
                branch pattern: "feature/[a-zA-Z_0-9]+", comparator: "REGEXP"
                beforeAgent true
            }

            stages {

                stage('Git checkout') {
                        steps {
                            checkout changelog: false, poll: false, scm: scmGit(branches: [[name: env.BRANCH_NAME]], extensions: [], userRemoteConfigs: [[credentialsId: 'github_credentials', url: 'https://github.com/MedEzzedine/Ecommerce-Microservices']])
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