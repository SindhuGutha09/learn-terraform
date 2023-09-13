data "aws_ami_ids" "ami" {
  name_regex       = "Centos-*"
  owners           = ["342367090197"]

}
output "ami" {
  value = data.aws_ami_ids.ami
}