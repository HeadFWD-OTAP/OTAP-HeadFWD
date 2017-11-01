#!/usr/bin/env groovy

node {

    stage('Checkout') {
        echo 'SCM checkout...'
        checkout scm
    }
    stage('Build') {
        sh 'eval $(docker-machine env ExternalHost)'
        def buildHost = 'tcp://172.20.10.2:2376'
        docker.withServer(buildHost) {

            sh 'docker pull docker.elastic.co/elasticsearch/elasticsearch:5.3.6'
            sh 'docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:5.3.6'
        }
    }
    stage('Test') {
        echo 'Testing...'
    }
    stage('Deploy') {
        echo 'Deploying...'
    }
    stage('Configure') {
        echo 'Configuring...'
    }

}