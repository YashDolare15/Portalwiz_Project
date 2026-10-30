pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCOUNT_ID = '170010887450'
        ECR_REPOSITORY = 'portalwiz'
        IMAGE_URI = '170010887450.dkr.ecr.us-east-1.amazonaws.com/portalwiz'
        CONTAINER_NAME = 'portalwiz'
        ENV_FILE = '/home/ubuntu/portalwiz/.env'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Code Validation') {
            steps {
                sh 'npm run lint'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_URI:$BUILD_NUMBER .'
            }
        }

        stage('Login to AWS ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION |
                docker login --username AWS --password-stdin \
                $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                '''
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                docker push $IMAGE_URI:$BUILD_NUMBER
                docker tag $IMAGE_URI:$BUILD_NUMBER $IMAGE_URI:latest
                docker push $IMAGE_URI:latest
                '''
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                test -r $ENV_FILE

                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true

                docker run -d \
                  --name $CONTAINER_NAME \
                  --restart unless-stopped \
                  --env-file $ENV_FILE \
                  -p 3000:3000 \
                  $IMAGE_URI:$BUILD_NUMBER
                '''
            }
        }

        stage('Health Check') {
            steps {
                sh '''
                sleep 5
                curl --fail http://localhost:3000/health
                '''
            }
        }
    }
}
