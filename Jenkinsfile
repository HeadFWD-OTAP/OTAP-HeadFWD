#!/usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Checkout') {
            checkout([$class: 'GitSCM', branches: [[name: '**']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'f07ec6eb-8055-455e-b9f6-e47471efc3dd', url: 'https://github.com/NathanvanDalen/OTAP-HeadFWD.git']]])

        }
        stage('Build') {
            steps {
                echo 'Building...'
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