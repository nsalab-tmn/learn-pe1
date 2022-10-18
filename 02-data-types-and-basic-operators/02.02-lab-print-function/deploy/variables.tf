variable "instance_id" {
    type        = string
    default     = "user01_1111"
}

variable "tp_name" {
    type        = string
    default     = "smpl_lab"
}

variable "tp_learn_env" {
    type        = string
    default     = "dev"
}

variable "tp_learn_user" {
    type        = string
    default     = "user01"
}

variable "LAB_DEPLOY_IMAGE_VSCODE" {
    type        = string
    default     = "labdeployacrdev.azurecr.io/code-server:latest"   
}

variable "STORAGE_CONTAINER" {
    type        = string
    default     = "learn-materials" 
}

variable "LAB_DEPLOY_IMAGE_BLOB" {
    type        = string
    default     = "labdeployacrtst.azurecr.io/blob:latest"     
}

variable "LAB_DEPLOY_TEMPLATES_CS" {
    type        = string
    default     = "DefaultEndpointsProtocol=https;AccountName=learnsatst;AccountKey=u3xSELAl789uIB1nmp0PR4aTt2mEaoML7YSy2wL1MB20CAE9d9o/oUbFv5riz2o5yukzZh8oNeqD+ASthvU2/w==;EndpointSuffix=core.windows.net"       
}

variable "STORAGE_ACCOUNT_NAME" {
    type        = string
    default     = "learnsatst"       
}

variable "LAB_DEPLOY_PATH" {
    type        = string
    default     = "deploy"   
}