
BUCKET_NAME ?= my-incredible-bucket

all:
	@make hello

setup:
	@echo sudo pip install boto3 && sudo pip3 install --upgrade awscli && python3 permissions.py
	@curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	@unzip awscliv2.zip
	@sudo ./aws/install
	@echo aws --version

hello:
	@echo --------------------------------------------------
	@echo Hello Wizard! we are in System Management Quest!!!
	@echo --------------------------------------------------

check:
	@python ./scripts/check.py

build-image:
	@aws --region eu-west-1 cloudformation deploy --template-file ./scripts/build-win-image.yml --stack-name My-First-EC2-Image --tags owner=Accor env=workshop-sm --capabilities CAPABILITY_IAM
	@echo --------------------------------------------------------
	@echo This can take up to 30 min - please continue with step 2
	@echo --------------------------------------------------------

build-bucket:
	@aws s3api create-bucket --bucket ${BUCKET_NAME} --region eu-west-1 --create-bucket-configuration LocationConstraint=eu-west-1 --acl public-read
	@aws s3api put-object --bucket ${BUCKET_NAME} --key old-logo.png --body old-logo.png --tagging "logo-version=v1" --acl public-read
	@echo ---------------------------------------------------------------------------------------
	@echo Please check in AWS Console the creation of the S3 Bucket and the logo version 1 upload
	@echo ---------------------------------------------------------------------------------------

check-ami:
	@echo ----------------------------------------------------------------
	@echo Please modify line 8 in build-ec.yml with the following ImageId:
	@echo ----------------------------------------------------------------
	@var1=$$(aws --region eu-west-1 imagebuilder list-images --query "imageVersionList[*].arn" --output text); \
	 aws --region eu-west-1 imagebuilder list-image-build-versions --image-version-arn $$var1 | grep ami-

build-instance:
	@aws --region eu-west-1 cloudformation deploy --template-file ./scripts/build-ec2.yml --stack-name My-First-EC2 --tags owner=Accor version=v1 env=workshop-sm --capabilities CAPABILITY_IAM

destroy:
	@aws --region eu-west-1 cloudformation delete-stack --stack-name My-First-EC2
