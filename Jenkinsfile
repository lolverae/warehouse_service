pipeline{
  agent {label 'master'}
  stages{

    stage('Build') {
      steps{sh 'uvicorn main:app --host 0.0.0.0 --port 8000'}
    }

    stage('Test') {
      steps {sh 'echo "henlo"'}
    }

    stage('Package') {
      steps {sh ''}}
  }
}
