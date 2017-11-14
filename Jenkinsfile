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
    def BUILD_IMAGE_TAG = "headwfd-otap-" + commitId.toLowerCase()
    stage('Package') {
        dir('Spring-starter/complete/') {
            sh "mvn package -DskipTests -Dbuild.number=${BUILD_IMAGE_TAG}"
        }
    }


    stage('Build') {
        withEnv(["BUILD_TAG=${BUILD_IMAGE_TAG}"]) {
            def buildHost = 'tcp://172.20.10.2:2376'
            sh 'docker build -t ${BUILD_TAG} .'
        }
    }
    stage('IntegrationTest') {
        echo 'Testing...'
        withEnv(["BUILD_IMAGE_TAG=${BUILD_IMAGE_TAG}",
                 "TARGET_ENV=local"]) {
            try {
                echo "IMAGE_BUILD_TAG=${BUILD_IMAGE_TAG}"
                sh './pipeline-it.sh'
            } finally {
                sh './pipeline-it-down.sh'
            }
        }

    }
    stage('Deploy') {
        echo 'Deploying...'
    }
    stage('Configure') {
        echo 'Configuring...'
    }

}