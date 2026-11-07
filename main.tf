# Look up the tenant's built-in domain (yourname.onmicrosoft.com).
data "azuread_domains" "initial" {
  only_initial = true
}

# One security group per department.
resource "azuread_group" "department" {
  for_each = toset(local.departments)

  display_name     = "sg-dept-${lower(each.key)}"
  security_enabled = true
}

# A random starting password per person. Nobody needs to see it.
resource "random_password" "initial" {
  for_each = local.people

  length = 20
}

# One user per person.
resource "azuread_user" "person" {
  for_each = local.people

  user_principal_name   = "${each.key}@${data.azuread_domains.initial.domains[0].domain_name}"
  display_name          = each.value.display_name
  department            = each.value.department
  password              = random_password.initial[each.key].result
  force_password_change = true
}

# Put each person in their department's group.
resource "azuread_group_member" "department" {
  for_each = local.people

  group_object_id  = azuread_group.department[each.value.department].object_id
  member_object_id = azuread_user.person[each.key].object_id
}