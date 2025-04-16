step1:

by using the files in s3bucket folder I provisioned the s3bucket and dynamoDB.

These s3bucket and dynamodb can be used for next terraform configurations (eks and ec2-instence)

step2: 

Created ec2-instence with terraform code available in ec2-instence folder

This terraform configurations also has the code to deploy all the required packages including jenkins.

step3: 

used jenkins for CI part build and push the docker image.

step4: 

Created eks cluster using terraform files.

step5:

deployed argocd and exposed it as a Loadbalancer

URL: https://aac2991ff9cb7452e992cc6370822f9c-1754243818.us-east-1.elb.amazonaws.com/applications/argocd/hcl?view=tree&resource=

username: admin
password: J69UvKqCA2heUR9D

step6:

Connect my repository with argocd and deployed docker images (available in ecr) with the help of manifest files available in kubernetes folder