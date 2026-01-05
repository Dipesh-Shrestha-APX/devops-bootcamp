pipeline{
  // agent{
  //   docker{
  //     image "yamshakya/ssh-client:latest"
  //     args "-u 0:0"
  //   }
  // }
  agent any

  environment{
    SSH_KEY64= credentials('SSH_KEY64')
  }
  parameters {
      string(
          name: 'SERVER_IP',
          defaultValue: '100.31.95.2',
          description: "Enter the server IP ADDRESS"
      )
  }

  stages{
    stage('Configure SSH'){
      steps{
        sh '''
          mkdir -p ~/.ssh
          chmod 700 ~/.ssh
          echo -e "Host *\\n\\tStrictHostKeyChecking no\\n\\n" > ~/.ssh/config
          cat ~/.ssh/config
          touch ~/.ssh/known_hosts
          chmod 600 ~/.ssh/known_hosts
        '''
      }
    }
    stage('SSH Key Access'){
      steps{
        sh '''
          mkdir -p /tmp/jenkins_keys
          echo $SSH_KEY64 | base64 -d > /tmp/jenkins_keys/myKey.pem
          chmod 600 /tmp/jenkins_keys/myKey.pem
          ssh-keygen -R ${params.SERVER_IP}
        '''
      }
    }
    stage('Deploy Code to Server'){
      steps{
        // sh '''
        //   ssh -t ec2-user@${params.SERVER_IP} -i myKey.pem 'cd /usr/share/n ginx/html && git pull origin main'
        // '''
        sh """
          ssh -i /tmp/jenkins_keys/myKey.pem ec2-user@${params.SERVER_IP} "cd /var/www/html && git pull"
        """
      }
    }
  }
}