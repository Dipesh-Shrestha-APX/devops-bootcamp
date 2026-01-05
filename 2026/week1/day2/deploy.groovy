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
          touch myKey.pem 
          echo $SSH_KEY64 | base64 -d> myKey.pem 
          chmod 400 myKey.pem
          ssh-keygen -R ${params.SERVER_IP}
        '''
      }
    }
    stage('Deploy Code to Server'){
      steps{
        sh '''
          ssh -t ec2-user@${params.SERVER_IP} -i myKey.pem 'cd /usr/share/n ginx/html && git pull origin main'
        '''
      }
    }
  }
}