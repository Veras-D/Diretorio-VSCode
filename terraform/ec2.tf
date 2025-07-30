resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Veras", "Vivi", "Verivi"])
  name     = each.key
}

resource "aws_instance" "this" {
  for_each = {
    web = {
      name = "Web Server"
      type = var.instance_type
    }
    ci_cd = {
      name = "CI/CD Server"
      type = var.instance_type
    }
  }

  ami           = data.aws_ami.ubuntu.id
  instance_type = lookup(each.value, "type", null)

  tags = merge(
    {
      Name = "${each.key}: ${lookup(each.value, "name", null)}"
    },
    var.instance_tags
  )
}

resource "aws_instance" "web-env" {
  count = lookup(var.instance_env, local.env)["number"]

  ami           = lookup(var.instance_env, local.env)["ami"]
  instance_type = lookup(var.instance_env, local.env)["type"]

  tags = {
    Name = "EC2 web ${local.env}"
    Env  = local.env
  }
}