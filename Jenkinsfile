// 1. Build  -> uvicorn ... (using nohup and checking the Output)
// 2. package -> Build docker image
// 3. component test -> docker compose up and running check-health script
// 4. Push image -> push docker image, using image tag and image build 
// 5. clean up

pipeline{
  agent {label 'ansible-agent'}
  stages{
	stage('Build'){
	  steps{
        git branch: 'master', url: 'https://github.com/lolverae/warehouse_service.git'
        sh 'virtualenv -p /usr/bin/python3 venv'
        sh 'source venv/bin/activate'
        sh 'sudo pip3 install -r ./app/requirements.txt'    
        sh 'cd ./app && nohup uvicorn main:app --host 0.0.0.0 --port 9090 & sleep 5 &&source ./scripts/test.sh'
        sh '''#!/bin/bash
        echo $FIRST_TEST
        '''
        script {
            if (!'{$FIRST_TEST}') {
                echo 'angy ╰（‵□′）╯'
                currentBuild.result = 'FAILURE'
            }
        }
	  }
	}
    stage ('Package') {
      steps {
        sh './package.sh'
      }
    }
    stage('Component Test') {
      steps {
        sh './start.sh'
        sleep 10
        sh './scripts/check_health.sh'
        script {
            if (!'{$SECOND_TEST}') {
                echo 'angy ╰（‵□′）╯'
                currentBuild.result = 'FAILURE'
            }
        }        
      }
    }

    stage('Pushing Image') {
      steps {
          sh './tag-push.sh'
      }
    }
    stage('Clean Up') {
      steps {
        sh 'docker stop $(docker ps -q)'
        sh 'docker rm $(docker ps -a -q)'
        sh 'echo y | docker system prune -a'
        sh 'echo y | docker volume prune'
      }
    }
  }
//   post {
//     always {
//       echo 'One way or another, I have finished'
//       deleteDir() /* clean up our workspace */
//     }
//     success {
//       echo 'I succeeded!'
//     }
//     unstable {
//       echo 'I am unstable :/'
//     }
//     failure {
//       echo 'I failed :('
//     }
//   }
}