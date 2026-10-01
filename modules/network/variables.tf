variable "location" {
  type        = string
  description = "Azure-regionen der nettverksressursene skal opprettes"
}
variable "base_name" {
  type        = string
  description = "Felles navneprefiks for ressursene i nettverksmodulen"
}

variable "rsg_name" {
  type        = string
  description = "Navnet på ressursgruppen som skal inneholde nettverksressursene"
}

variable "environment" {
  type        = string
  description = "Miljønavn som brukes som tag på nettverksressursene"
}

variable "owner" {
  type        = string
  description = "Eier eller ansvarlig team, brukt som tag på nettverksressursene"
}

variable "managedby" {
  type        = string
  description = "Verktøyet eller teamet som forvalter ressursene, brukt som tag"
}

variable "address_space" {
  type        = string
  description = "Adresserommet vnet-et disponerer, som CIDR – for eksempel 10.10.0.0/16"
}

variable "subnets" {
  type        = map(string)
  description = "Subnett som skal opprettes: navn => adresseprefiks"
}