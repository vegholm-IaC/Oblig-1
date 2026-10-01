variable "location" {
  type        = string
  description = "Azure-regionen der compute-ressursene skal opprettes"
}

variable "base_name" {
  type        = string
  description = "Felles navneprefiks for virtuelle maskiner og nettverkskort"
}

variable "rsg_name" {
  type        = string
  description = "Navnet på ressursgruppen som skal inneholde compute-ressursene"
}

variable "vm_size" {
  type        = string
  description = "Azure VM-størrelse, for eksempel Standard_B1s"
}

variable "subnet_id" {
  type        = string
  description = "ID-en til subnettet som nettverkskortet skal kobles til"
}

variable "environment" {
  type        = string
  description = "Miljønavn som brukes som tag på compute-ressursene"
}

variable "owner" {
  type        = string
  description = "Eier eller ansvarlig team, brukt som tag på compute-ressursene"
}

variable "managedby" {
  type        = string
  description = "Verktøyet eller teamet som forvalter ressursene, brukt som tag"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Administratorpassordet som brukes ved opprettelse av den virtuelle maskinen"
}