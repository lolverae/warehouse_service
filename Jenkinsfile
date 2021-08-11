pipeline{
  agent {label 'master'}
  stages{
    // stage('Checkout'){
    //   steps{git branch: 'deploy', url: 'https://github.com/lolverae/spring-petclinic.git'}
    // }

    stage('Build') {
      steps{sh 'mvn clean compile'}
    }

    stage('Test') {
      steps {sh 'mvn test'}
    }

    stage('Package') {
      steps {sh 'mvn package' archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false}}
}
}
