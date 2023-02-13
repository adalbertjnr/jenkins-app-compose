pipeline {
  agent any
  
  stages {
    stage ('Building dockerfile') {
      steps {
        script {
          dockerapp = docker.build ("szadhub/conv:${env.BUILD_ID}", "-f Dockerfile ./")
        }
      }
    }
    stage ('Pushing image to dockerhub') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-creds') {
            dockerapp.push("${env.BUILD_ID}")
            dockerapp.push('latest')
          }
        }
      }
    }
    stage ('Removing current docker container') {
      steps {
      sh 'chmod +x rm.sh'
      sh './rm.sh'
      }
    }
    stage ('Downloading and updating docker compose with new image') {
      environment {
        tag = "${env.BUILD_ID}"
      }
      steps {
        sh 'sed -i "s/{{TAG}}/$tag/g" ./conv/docker-compose.yaml'
        dir('./conv') {
          sh 'docker compose up -d'
        }
      }
    }
    stage ('Cleaning images') {
      steps {
          sh 'docker image prune -a --force'
      }
    }
    stage ('Validating app removal') {
      input {
        message "Do you want to delete?"
        ok "ok"
      }
      steps {
        echo "Removing..."
      }
    }
    stage ('Removing the app') {
      steps {
        sh './rm.sh'
      }
    }
  } 
}