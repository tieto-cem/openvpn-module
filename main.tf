module "role" {
  source = "./modules/role"
  name   = var.name
}

module "sg" {
  source = "./modules/sg"
  name           = var.name
  cidr           = var.cidr
  vpc_id         = var.vpc_id
  allow_nat      = var.allow_nat
  allow_ssh_port = var.allow_ssh_port
  ssh_cidr       = var.ssh_cidr
}

resource "aws_instance" "openvpn" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    module.sg.id,
  ]
  subnet_id            = var.subnet_id
  source_dest_check    = var.source_dest_check
  user_data            = var.user_data
  iam_instance_profile = module.role.iam_instance_profile
  tags                 = var.tags
  volume_tags          = var.volume_tags
  depends_on = [
    module.role,
    module.sg,
  ]
}

resource "aws_eip" "openvpn_ip" {
  instance   = aws_instance.openvpn.id
  vpc        = true
  depends_on = [aws_instance.openvpn]
}
