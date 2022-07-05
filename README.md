# __Workshop - System Management - Image Builder__ 
## This workshop is intended to be used as a hand-on experience, gamefied situation for each team in order to understand and apply IaC oriented to use AWS SSM, AWS EC2 Image Builder, AWS EC2 and other different components reviewed in previous sessions. 🚀

# The System Management Quest 🧙‍♂️
 
This is a gamified workshop where participants will practice automated deployment and configuration of EC2 windows instances based on a parent image built with EC2 Image Builder on the AWS platform. A set of different actions will be done using AWS SSM to have a final version of a webserver with static content.

## What is the script of the System Management Quest?
The System Management Quest is a competition across multiple teams. The winning team is the one which accumulates the highest number of points. Points come from activities described in the git repository. Some activities are based on time, therefore teams have to be quick on execution. Other activities are based on thinking, therefore teams have to scratch their heads. In all cases, high-degree of collaboration is an important factor of success.

## Pre-requisites to participe to a System Management Quest

- Chrome as a web browser for each participant
- Address of SSO portal for each team
- Authentication credentials for each participant
- Default VPC with public subnet

## How to win points? 🎯
Complete each activities below, and gain points for each of them. Note that activities have been designed to be executed in sequence.

### 📜 Where participants create their working environment (10 points)

What do you have to do:
1. Ensure that each team member has received credentials and instructions to go to AWS Console
2. Ensure that you get the instance role to be used for Cloud9 environments
3. Each team member authenticates to the AWS Console
4. From within the AWS Console, select the Ireland region from the menu at the top right of the window
5. Search and select the AWS Cloud9 service
6. From within the Cloud9 console, click on the button to create a new environment
7. Name the environment after your names, e.g., `m.anderson` for Mr. Anderson
8. Each participant starts his personal environment from within the browser

Congratulations! With the AWS Console to inspect cloud resources, and with Cloud9 to act programmatically on cloud resources, you have now the perfect toolbox to engage on a new quest.

### 📜 Where participants create their working environment (10 points)

What do you have to do:
#### Create a personal branch of this project (Github)
1. Each team member enters his personal Cloud9 environment
2. From there, look for the terminal window
3. Clone the git repository that has been prepared for the Quest
4. Enter the project directory
5. Create a feature branch with their personal name, e.g., `m.anderson` for Mr. Anderson
6. Push the new branch to the original git repository


### 📜 Where participants prepare for the System Management Quest (20 points)

What do you have to do:
#### Install and update development dependencies (AWS Cloud9)
1. On your AWS CLoud9 environment type `$ make hello` to see the welcome message.
2. On your AWS CLoud9 environment type `$ make setup` to install dependencies and update dev tools.

#### Create an EC2 Image for Windows-Server-2019 with latest SSM Agent (AWS Cloud9)
1. Type with shell command `$ make build-image` - this can take up to 30 minutes

### 📜 Where participants create cloud resources from the command line (30 points)

#### Create EC2 Instance Profile (AWS Console)
1. Sign-in to your AWS Account
2. Go to the IAM Console
3. Click ‘Roles’
4. Click ‘Create Role’
5. Click ‘AWS service’ and choose ‘EC2’, click next.
6. On the Attach permissions policies, search for `AmazonSSMManagedInstanceCore` and select it.
7. Also search for `EC2InstanceProfileForImageBuilder` and select it as well.
8. Click Next, optionally tag your resource and click next again.
9. On the review screen, give it a role name, in this workshop we will use `TeamRole`.

#### Create EC2 Key Pair for RDP to the EC2 instances (AWS Console)
1. Select the team member who will create the secret
2. This team member goes to the EC2 Console, in Ireland region
3. The person creates a key from the EC2 Console and give it the name `key-eu-west-1`. Since you may store multiple private key on a computer, and since the scope of a key is one AWS region, it is good practice to to mention the target region into key name.
4. On key creation, the person will receive a file from AWS. This is the private key itself, that is not stored by AWS.

#### Create S3 Bucket and upload static content for the frontend (AWS Cloud9)
1. Type with shell command `$ make check` - to check s3 connectivity from the AWS Cloud9
2. Type with shell command `$ make build-bucket` - to create the public S3 bucket and upload the old frontend logo.

### 📜 Where the team create 1 virtual machine with IIS and a static frontend (30 points)

#### Review if custom image is already created (AWS Cloud9)
1. After 30 min from `$ make build-image` , type with shell command `$ make check-ami` - to check if the AMI is already set from the AWS Cloud9 and follow the instructions.
2. Type with shell command `$ make build-instance` - to deploy your server from the AWS Cloud9
3. Attach the IAM Instance Role to the instance after the creation (AWS Console)
   - In the navigation pane, choose Instances.
   - Select the instance, choose Actions, Security, Modify IAM role.
   - Select the IAM role to attach to your instance, and choose Save.
4. Go to AWS System MAnager and select Fleet Manager - you should see your instance in the list
5. Select your instance, click on Node Actions and Execute Run command
6. Search for `AWS-RunPowerShellScript` and select it
7. On Command Parameters, type `Install-WindowsFeature Web-Server -ErrorAction stop` in order to install IIS over yout server
8. Reboot your instance to apply changes - hint: restart-computer from powershell
9. Verify that you ISS is connected from the browser

### 📜 Where the team updates the virtual machines frontend (50 points)
1. Update your ISS frontend with the old and new logo

### 💣 Bonus: Where the team put a network balancer in front of the servers (100 points)

## The end of the System Management Quest 🏰
1. Type with shell command `$ make destroy` - to destroy all the infrastructure from the AWS Cloud9

Congratulations, you have reached the end of the System Management Quest. Through the journey, here are technologies that you have practiced:
•	git for cloud operations – this workshop is packaged as a git repository downloaded and used by participants
•	The AWS Console – each participant will use it to inspect resources deployed on the AWS platform and troubleshooting.
•	AWS CLI – participants will deploy and control cloud resources with Infrastructure-as-Code
•	Cloud9 – integrated working environment for Infrastructure-as-Code
•	AWS Systems Manager – automation of software deployment and configuration on servers
•	AWS CloudWatch – automated monitoring dashboard for virtual servers

 

