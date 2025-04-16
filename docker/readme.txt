Docker image creation and pushing it to ECR.

Step 1: Tag Your Image

bash
docker build -t patient-service patient-service/
docker build -t appointment-service appointment-service/

bash
docker tag patient-service:latest 539935451710.dkr.ecr.us-east-1.amazonaws.com/patient-service:latest
docker tag appointment-service:latest 539935451710.dkr.ecr.us-east-1.amazonaws.com/appointment-service:latest


Step 2: Push Your Image

bash
docker push 539935451710.dkr.ecr.us-east-1.amazonaws.com/patient-service:latest
docker push 539935451710.dkr.ecr.us-east-1.amazonaws.com/appointment-service:latest


Make sure you've already logged in to ECR using the command:


bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 539935451710.dkr.ecr.us-east-1.amazonaws.com

