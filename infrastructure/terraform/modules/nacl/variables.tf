variable "nacl_rules" {
  description = "List of NACL rules to apply"
  type = list(object({
    rule_number = number
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
}
