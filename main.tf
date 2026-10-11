resource "google_colab_runtime_template_iam_member" "colab_runtime_template_iam_members" {
  for_each = var.colab_runtime_template_iam_members

  member           = each.value.member
  role             = each.value.role
  runtime_template = each.value.runtime_template
  location         = each.value.location
  project          = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

