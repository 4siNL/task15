pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "4sinl/ansible-task:${env.BUILD_ID}"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t ${DOCKER_IMAGE} red/'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'cat ~/dockerpass | docker login --username 4sinl --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push ${DOCKER_IMAGE}'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook playbook.yaml --extra-vars "BUILD_ID=${BUILD_ID}"'
            }
        }

        stage('Clean Up Docker') {
            steps {
                sh 'docker system prune -fa'
            }
        }
    }
}
