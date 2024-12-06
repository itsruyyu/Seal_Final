resource "aws_network_acl" "example" {
  vpc_id = var.vpc_id
}

resource "aws_network_acl_association" "example" {
  network_acl_id = aws_network_acl.example.id
  subnet_id      = var.subnet_id
}

resource "aws_network_acl_rule" "allow_inbound" {
  count = length(var.nacl_rules)

  network_acl_id = aws_network_acl.example.id
  rule_number    = var.nacl_rules[count.index].rule_number
  protocol       = var.nacl_rules[count.index].protocol
  rule_action    = var.nacl_rules[count.index].rule_action
  cidr_block     = var.nacl_rules[count.index].cidr_block
  from_port      = var.nacl_rules[count.index].from_port
  to_port        = var.nacl_rules[count.index].to_port
  egress         = false
}
