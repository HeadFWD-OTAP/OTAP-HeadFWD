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
    stage('Docker ps') {
        sh 'docker ps'
        sh 'docker ps -a'
    }
    stage('Compile') {
        dir('Spring-starter/complete/') {
            sh 'mvn -B clean test-compile'
        }
    }
    stage('UnitTest') {
        dir('Spring-starter/complete/') {
            sh 'mvn test'
        }
    }
    sh 'git rev-parse --short HEAD > .git/commit-id'
    String commitId = readFile('.git/commit-id').trim()
    def BUILD_TAG = "headwfd-otap-" + commitId.toLowerCase()
    stage('Package'){
        dir('Spring-starter/complete/') {
            sh "mvn package -DskipTests -Dbuild.number=${BUILD_TAG}"
        }
    }


    stage('Build') {
        def buildHost = 'tcp://172.20.10.2:2376'
        sh "docker build -t tstApp${BUILD_TAG} ."
    }
    stage('IntegrationTest') {
        echo 'Testing...'
        sh './pipeline-it-setup.sh'

    }
    stage('Deploy') {
        echo 'Deploying...'
    }
    stage('Configure') {
        echo 'Configuring...'
    }

}