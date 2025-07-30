variable "name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}

variable "policy" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "key_prefix" {
  type = string
  default = ""
}

variable "files" {
  type = string
  default = ""
}

variable "website" {
  description = "Map containing website configuration."
  type = object({
    suffix                   = string
    key                      = string
    redirect_all_requests_to = optional(string)
    routing_rules            = optional(string, "")
  })
  default = null
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type = object({
    enabled    = optional(string, "Disabled")
    mfa_delete = optional(string, "Disabled")
  })
  default = null
}