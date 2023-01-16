# variables.tf

variable "ec2_count" {
  type        = number
  default     = 1
  description = "Number of EC2 instances to provision."
}

variable "provision_ec2" {
  type        = bool
  default     = false
  description = "Number of EC2 instances to provision."
}

variable "ec2_tags" {
  type        = map(string)
  default     = {
    Provisioned_With = "TeRRaFoRM",
    Type             = "web",
    Type_2           = "API"
  }
  description = "A map of tags for the EC2 instance(s)"
}

## Nous avons ajouté un troisième champs 
variable "host_type_list" {
  type        = list(string)
  default     = ["t3.micro", "t3.small"]
  description = "A list of host types"
}

variable "block_device" {
  type        = list(string)
  default     = ["sdf","sdg"]
  description = "A list of block device names."
}


