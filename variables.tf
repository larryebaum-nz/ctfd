variable "ctfdName" {
  type = string
  description = "The CTFd instance name prefix"
}
variable "owner" {
  type = string
  description = "resource owner identifier"
}
variable "ttl" {
  type = string
  description = "ok to reap after ttl hours"
}
variable "requester" {
  type = string
  description = "requester email"
}
variable "customer" {
  type = string
  description = "customer"
}
variable "questionbank" {
  type = string
  description = "CTF questionbank to fetch and install"
}
variable "size" {
  type = map(string)
  default = {
    "1-15" = "small"
    "16-30" = "medium"
    "31-45" = "large"
  }
}
variable "userQty" {
  type = string
  description = "userQty from GHA input"
}
variable "importFile" {
  type = map(string)
  default = {
    "Field_Facing" = "CTF_Partner_20230627.zip" #Partner and Direct use the same questionbank
    "SE_Direct" = "CTF_Partner_20230627.zip" #Partner and Direct use the same questionbank
    "SE_Enablement-(internal_use_only)" = "CTF_SE_ENABLEMENT.20230418.zip" #update in future to file Adam L provides
    "SKO_2023" = "SKO-CTF-FullExport.2023-02-21_17_21_08.zip"
  }
}
variable "s3_keyid" {
  type = string
  description = "lightsail bucket access key id"
  default = "novalue"
}
variable "s3_secret" {
  type = string
  description = "lightsail bucket secret"
  default = "novalue"
}
