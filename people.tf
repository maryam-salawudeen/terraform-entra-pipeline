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
    "jordan.kim" = {
      display_name = "Jordan Kim"
      department   = "Sales"
    }
    "jordan.yao" = {
      display_name = "Jordan Yao"
      department   = "Sales"
    }
  }
}
