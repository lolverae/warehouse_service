// 1. Build  -> uvicorn ... (using nohup and checking the Output)
// 2. package -> Build docker image
// 3. component test -> docker compose up and running check-health script
// 4. Push image -> push docker image, using image tag and image build 
// 5. clean up
pipeline{
  agent {label 'build-agent'}
  environment{
    CC = """${sh(
        returnStdout: true,
        script: 'echo "clang"'
    )}""" 
  }
  stages{
	stage('Build'){
	  steps{
        git branch: 'master', url: 'https://github.com/lolverae/warehouse_service.git'
        script {
            sh '''#!/bin/bash
            
            sudo python3 -m venv venv
            source venv/bin/activate
            sudo pip3 install -r ./app/requirements.txt
            cd ./app && nohup uvicorn main:app --host 0.0.0.0 --port 9090 & sleep 5 &&source ./scripts/test.sh
            echo $FIRST_TEST
            if [ $FIRST_TEST == false ]; then
                echo 'BUILD FAILED, CHECK THE APP ❌❌ ╰（‵□′）╯'
                exit 1
            fi
            '''
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

        script {

          sh '''#!/bin/bash
            ./start.sh
            sleep 10
            ./scripts/check_health.sh
            if [ $SECOND_TEST == false ]; then
                echo 'BUILD FAILED, COMPONENT TEST FAILED❌❌ ╰（‵□′）╯'
                exit 1
            fi
          '''
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
        sh '''#!/bin/bash
        docker stop $(docker ps -q)
        docker rm $(docker ps -a -q)
        echo y | docker system prune -a
        echo y | docker volume prune
        '''
      }
    }
  }
  // post {
  //   always {
  //     echo 'One way or another, I have finished'
  //     deleteDir() /* clean up our workspace */
  //   }
  //   success {
  //     echo 'I succeeded! ✔✔'
  //   }
  //   unstable {
  //     echo 'I am unstable :/'
  //   }
  //   failure {
  //     echo 'I failed :('
  //   }
  // }
}