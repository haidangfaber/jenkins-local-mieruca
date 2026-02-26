pipeline {
    agent any

    stages {

        stage("Clean Up") {
            steps {
                deleteDir()
            }
        }

        stage("Checkout pre-sandbox") {
            steps {
                git branch: 'pre-sandbox',
                    url: 'https://github.com/FaberTechnology/local-mieruca.git',
                    credentialsId: 'github-credentials'
            }
        }

        stage("Build & Test") {
            steps {
                dir("local-mieruca-app") {
                    sh "mvn clean verify"
                }
            }
        }

        stage("Confirm Merge") {
            steps {
                input message: "Build & Test thành công. Bạn có muốn merge pre-sandbox vào sandbox không?",
                      ok: "Merge Now"
            }
        }

        stage("Merge pre-sandbox -> sandbox") {
            steps {
                script {
                    sh """
                        git config user.name "haidangfaber"
                        git config user.email "nguyenlehaidang@fabercompany.co.jp"

                        git fetch origin

                        git checkout sandbox
                        git pull origin sandbox

                        git merge origin/pre-sandbox --no-ff -m "Auto merge pre-sandbox into sandbox"

                        git push origin sandbox
                    """
                }
            }
        }
    }
}