variable "instance_id" {
    type        = string
    default     = "user01-1111"
}

variable "tp_name" {
    type        = string
    default     = "smpl-lab"
}

variable "tp_learn_env" {
    type        = string
    default     = "tst"
}

variable "tp_learn_user" {
    type        = string
    default     = "user01"
}

variable "LAB_DEPLOY_IMAGE_VSCODE" {
    type        = string
    default     = "labdeployacrtst.azurecr.io/code-server:latest"   
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

variable "LAB_DEPLOY_CONTAINER_SERVER" {
    type        = string
    default     = "labdeployacrtst.azurecr.io"     
}

variable "LAB_DEPLOY_CONTAINER_PASSWORD" {
    type        = string
    default     = "jj"  
}

variable "LAB_DEPLOY_CONTAINER_USERNAME" {
    type        = string
    default     = "labdeployacrtst"  
}

variable "LAB_TP_NAME" {
    type        = string
    default     = "634fe2f72096b54853f10bc1"  
}
