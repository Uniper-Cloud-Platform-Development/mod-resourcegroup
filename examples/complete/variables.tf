variable "tags" {
  description = "Tags for the ESLZ resource group"
  type = map(string)
  default = {
    application_name   = "CloudWorks Automation Services"
    eam_id             = "203196"
    lob_parent         = "Information Technology"
    owner_email        = "G2958@uniper.energy"
    environment        = "POC"
    notification_email = "uit-cmc-automation-services@uniper.energy"
  }
}


variable "region"{
  type = string
  default = "weu"
}

variable "environment" {
  type = string
  default = "poc"  
}

variable "appshortname" { 
  type = string
  default = "plteng"  
}

variable "location" {
  type = string
  default = "westeurope"  
}

variable "identity" {
  type = string
  default = "id-weu-plteng-01"
}