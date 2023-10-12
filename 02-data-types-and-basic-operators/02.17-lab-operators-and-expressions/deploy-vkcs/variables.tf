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


variable "STORAGE_CONTAINER" {
    type        = string
    default     = "learn-materials" 
}

variable "LAB_DEPLOY_TEMPLATES_CS" {
    type        = string
    default     = "DefaultEndpointsProtocol=https;AccountName=learnsatst;AccountKey=<your account key here>;EndpointSuffix=core.windows.net"       
}

variable "STORAGE_ACCOUNT_NAME" {
    type        = string
    default     = "learnsatst"       
}

variable "LAB_DEPLOY_PATH" {
    type        = string
    default     = "deploy/solution"   
}

variable "LAB_TP_NAME" {
    type        = string
    default     = "6353fed4ae4685ba1d683eef"  
}

variable "lab_assessment_templates_cs" {
    type        = string
    default     = "DefaultEndpointsProtocol=https;AccountName=learnsatst;AccountKey=<your account key here>;EndpointSuffix=core.windows.net"       
}

variable "storage_container_materials" {
    type        = string
    default     = "learn-materials"     
}

variable "lab_assessment_path" {
    type        = string
    default     = "assessment"       
}
