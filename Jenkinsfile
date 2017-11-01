#!/usr/bin/env groovy

node {

    def buildHost = 'tcp://172.20.10.2:2376'

    stages {
        stage('Checkout') {
            steps {
                echo 'SCM checkout...'
            }
        }
        stage('Build') {
            steps {
                docker.withServer(buildHost){
                    sh 'eval $(docker-machine env ExternalHost)'
                    sh 'docker pull docker.elastic.co/elasticsearch/elasticsearch:5.3.6'
                    sh 'docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:5.3.6'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
        stage('Configure') {
            steps {
                echo 'Configuring...'
            }
        }
    }
}