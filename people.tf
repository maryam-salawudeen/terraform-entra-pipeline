# Our pretend company. Add someone to onboard them, remove them to offboard.

locals {
  departments = ["IT", "Finance", "Sales"]

  people = {
    "alex.martin" = {
      display_name = "Alex Martin"
      department   = "IT"
    }
    "sam.lee" = {
      display_name = "Sam Lee"
      department   = "Finance"
    }
  }
}