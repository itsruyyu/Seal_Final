aws_region               = "us-west-2"
cidr_block               = "10.0.0.0/16"
public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
ami_id                   = "ami-ganti ami"
key_name                 = "my-key-pair"
security_group_ids       = ["sg-0123456789abcdef0"]
db_username              = "admin"
db_password              = "securepassword123"
nacl_rules = [
  {
    rule_number = 100
    protocol    = "tcp"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    egress      = false
  }
]
