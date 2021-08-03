#! /bin/bash

echo $1
if [ $1 = 'apply' ] ; then
	terraform apply
	terraform state rm module.ami.aws_instance.web
	instance_id=$(aws ec2 describe-instances --filters Name=tag-key,Values=ami-instance --region=us-east-1 --query "Reservations[*].Instances[*].InstanceId" --output text)
	echo $instance_id
	aws ec2 terminate-instances --instance-ids $instance_id --region=us-east-1
elif [ $1 = 'plan' ] ; then
	terraform plan
elif [ $1 = 'destroy' ] ; then
	terraform destroy
elif [ $1 = 'init' ] ; then
	terraform init
else
	echo "error"
fi
