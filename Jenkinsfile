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
      sh 'sudo pip3 install -r /var/lib/jenkins/workspace/warehouse-service/integration/app/requirements.txt'    
      sh 'cd /var/lib/jenkins/workspace/warehouse-service/integration/app && uvicorn main:app --host 0.0.0.0 --port 8000'
    }
	}
    stage ('Package') {
      steps {
        echo 'hello lol'
      }
    }
    stage('Component Test') {
      steps {
        sh '/var/lib/jenkins/workspace/warehouse-service/integration/start.sh'
      }
    }

    stage('Pushing Image') {
      steps {
        withEnv(['ansible-playbook=/home/alberto/.local/bin/ansible-playbook']) 
          {sh '/var/lib/jenkins/workspace/warehouse-service/integration/tag-push.sh'}
      }
    }
    stage('Clean Up') {
      steps {
        echo 'cleaning :)'
      }
    }
  }
}