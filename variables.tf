variable "environment" {
  type        = string
  description = "used for naming resources and tagging"
  default     = "test"
}

variable "aws_region_primary" {
  type        = string
  description = "Primary AWS region to deploy to"
  default     = "us-east-1"
}

# variable "aws_region_secondary" {
#   type        = string
#   description = "Secondary AWS region to deploy to"
# }

# variable "application" {
#   type        = string
#   description = "used for naming resources and tagging"
#   default     = "test"
# }

# variable "component" {
#   type        = string
#   description = "used for naming resources and tagging"
#   default     = "instances"
# }

# variable "cost_allocation_method" {
#   type        = string
#   description = "used for naming resources and tagging"
#   default     = "IT"
# }

# variable "owner" {
#   type        = string
#   description = "used for tagging reources"
#   default     = "weiss"
# }


# # vpc
# ## primary vpc
# variable "primary_vpc_id" {
#   type        = string
#   description = "the vpc id for resources to live"
# }

# variable "primary_vpc_public_subnet_ids" {
#   type        = list(string)
#   description = "the list of public subnet ids"
# }

# variable "primary_vpc_app_subnet_ids" {
#   type        = list(string)
#   description = "the list of app subnet ids"
# }

# variable "primary_vpc_db_subnet_ids" {
#   type        = list(string)
#   description = "the list of db subnet ids"
# }

# ## secondary vpc
# variable "secondary_vpc_id" {
#   type        = string
#   description = "the vpc id for resources to live"
# }

# variable "secondary_vpc_public_subnet_ids" {
#   type        = list(string)
#   description = "the list of public subnet ids"
# }

# variable "secondary_vpc_app_subnet_ids" {
#   type        = list(string)
#   description = "the list of app subnet ids"
# }

# variable "secondary_vpc_db_subnet_ids" {
#   type        = list(string)
#   description = "the list of db subnet ids"
# }

# # ec2
# variable "instance_type" {
#   type        = string
#   description = "the type of instance to create"
# }

# variable "cpu_credits" {
#   type        = string
#   description = "cpu credits for instance"
#   default     = null
# }

# variable "disable_api_termination" {
#   type        = bool
#   description = "whether to disable termination of instance or not"
#   default     = false
# }

# variable "ebs_optimized" {
#   type        = bool
#   description = "set ebs optimized"
#   default     = false
# }

# variable "instance_root_ebs_delete_on_termination" {
#   type        = bool
#   description = "delete on terminiation for root ebs"
#   default     = true
# }

# variable "instance_ebs_block_size" {
#   type        = number
#   description = "the size in gb for the ebs volume"
#   default     = 120
# }

# variable "bastion_users" {
#   type = list(object({
#     username = string
#     sudo     = bool
#     keys     = list(string)
#   }))
#   description = "the users to add to the bastion host"
# }

# variable "allowed_bastion_ips" {
#   type        = list(string)
#   description = "the IP addresses that can access the bastion host"
# }