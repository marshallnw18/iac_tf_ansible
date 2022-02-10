# Get Linux AMI ID Using SSM Parameter (API) Endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
  provider = aws.region-master
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Get Linux AMI ID Using SSM Parameter (API) Endpoint in us-west-2
data "aws_ssm_parameter" "linuxAmiOregon" {
  provider = aws.region-worker
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Attach the public key from the user's "~/.ssh/id_rsa.pub" file to the Jenkins master node for keypair login
resource "aws_key_pair" "master-key" {
  provider = aws.region-master
  key_name = "jenkins"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Attach the public key from the user's "~/.ssh/id_rsa.pub" file to the Jenkins worker node for keypair login
resource "aws_key_pair" "worker-key" {
  provider = aws.region-worker
  key_name = "jenkins"
  public_key = file("~/.ssh/id_rsa.pub")
}