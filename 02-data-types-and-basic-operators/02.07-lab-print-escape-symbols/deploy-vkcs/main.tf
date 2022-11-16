
resource "random_string" "learn" {
  length           = 8
  special          = false
  min_lower        = 2
  min_numeric      = 2
  upper            = false
}