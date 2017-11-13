#!/usr/bin/env groovy

node {
//    def mvnHome = tool 'Maven 3.3.9'

    stage('Checkout') {
        echo 'SCM checkout...'
        checkout scm
    }
    stage('Check user') {
        sh 'whoami'
    }
    stage('Check docker') {
        sh 'which docker'
    }
//    stage('Docker ps') {
//        sh 'docker ps'
//        sh 'docker ps -a'
//    }
    stage('Compile'){
        sh 'mvn -B clean test-compile'
    }
    stage('UnitTest'){
        echo 'UnitTests...'
    }
    stage('Package'){
        sh 'mvn package -DskipTests -Dbuild.number=${BUILD_TAG}'
    }

    sh 'git rev-parse --short HEAD > .git/commit-id'
    String commitId = readfile('.git/commit-id').trim()
    def BUILD_TAG = "headwfd-otap-"+commitId.toLowerCase()

    stage('Build') {
        def buildHost = 'tcp://172.20.10.2:2376'
        sh "docker built -t ${BUILD_TAG} ."
    }
    stage('IntegrationTest') {
        echo 'Testing...'

    }
    stage('Deploy') {
        echo 'Deploying...'
    }
    stage('Configure') {
        echo 'Configuring...'
    }

}