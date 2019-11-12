pipeline {
  environment {
    registry = "shaker242/dlogo"
    registryCredential = "dockerhub"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/dglib/dlogo.git'
      }
    }
    stage('Building image') {
      steps{
        script {
             dir("/var/jenkins_home/workspace/dlogo-pipeline/dlogo"){
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
        }
      }
    }
    stage('Pushing Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Clean Up Builds') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
    stage('Deploy') {
      steps {
        sh "kubectl set image deployment/dlogo-deploy dlogo=$registry:$BUILD_NUMBER"
      }
    }
  }
}