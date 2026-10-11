variable "colab_runtime_template_iam_members" {
  description = <<EOT
Map of colab_runtime_template_iam_members, attributes below
Required:
    - member
    - role
    - runtime_template
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member           = string
    role             = string
    runtime_template = string
    location         = optional(string)
    project          = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

