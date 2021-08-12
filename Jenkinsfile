pipeline{
  agent {label 'master'}
  stages{

    stage('Build') {
      steps{sh 'docker run lolverae/warehouse_service:latest'}
    }

    stage('Test') {
      steps {sh 'echo "henlo"'}
    }

    stage('Package') {
      steps {
        withEnv(['ansible-playbook=/home/alberto/.local/bin/ansible-playbook']) {
            sh '/home/alberto/warehouse_service/ci-start.sh'
        }
    }}
  }
}
