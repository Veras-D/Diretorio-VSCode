variable "environment" {
  type        = string
  description = "Envoronment Variable: dev | test | prod"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile"
}

variable "bucket_id_byte_length" {
  type    = number
  default = 4
}

variable "instance_ami" {
  type        = string
  description = "AWS ami instance value"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type"
}

variable "instance_tags" {
  type        = map(string)
  description = "AWS instance tags"
  default = {
    Name    = "Ubuntu"
    Project = "terraform test"
  }
}

variable "instance_env" {
  description = "Instance configuration per workspace"

  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })
    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-02127283774ff5e66"
      type   = "t2.micro"
      number = 1
    }
    prod = {
      ami    = "ami-02127283774ff5e66"
      type   = "t2.micro"
      number = 3
    }
  }
}