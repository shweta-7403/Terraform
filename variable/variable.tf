variable "aws_instance_type" {
  description = "what type of instance do you want?"
  type        = string
  validation {
    condition     = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro"
    error_message = "only t2.micro allow"
  }
}
variable "ec2_config" {
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}
variable "additional_tags" {
  type    = map(string) #Expecting key=value
  default = {}
}