pipeline{
  agent {label 'master'}
  stages{

    stage('Build') {
      steps{sh 'sudo docker run lolverae/warehouse_service:latest'}
    }

    stage('Test') {
      steps {sh 'echo "henlo"'}
    }

    stage('Package') {
      steps {sh ''}}
  }
}
