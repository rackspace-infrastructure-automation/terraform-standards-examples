data "terraform_remote_state" "remote" {
  backend = "s3"

  config = {
    bucket = "my-state-bucket"
    region = "us-west-2"
    key    = "my-remote-state.tfstate"
  }
}

resource "aws_security_group" "my_security_group" {
  name_prefix = "MySecurityGroup"
  description = "Allows traffic to instances and containers"
  vpc_id      = "${data.terraform_remote_state.remote.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
