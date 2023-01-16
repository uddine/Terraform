# main.tf

/*
  COMMAND : 
  tclear var='provision_ec2=true' \
  -var='ec2_count=1'

resource "aws_instance" "ec2" {
  count = var.provision_ec2 == true ? var.ec2_count : 0

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    for key, value in var.ec2_tags :
    key => lower(value)
  }
}

*/

resource "aws_instance" "ec2" {
  for_each      = toset(var.host_type_list)
  ami           = data.aws_ami.ubuntu.id
  instance_type = each.key

  dynamic "ebs_block_device" {
    for_each = var.block_device
    content {
      device_name = ebs_block_device.value
      volume_size = 1
    }
  }

  tags = {
    for key, value in var.ec2_tags :
    key => lower(value)
  }
}