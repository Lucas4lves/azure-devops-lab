locals {
  project_name="azure-devops-lab"
  default_location = "West Europe"
}

resource "azurerm_resource_group" "vnet_rg" {
  name = "${locals.project_name}-${var.vnet_rg_name}"
  location = var.vnet_rg_location
}

resource "azurerm_network_security_group" "vnet_sg" {
  name = var.vnet_sg_name
  location = coalesce(var.vnet_rg_location, local.default_location)
  resource_group_name = var.vnet_rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
  }
}

resource "azurerm_virtual_network" "base" {
  name                = "${locals.project_name}-${var.vnet_sg_name}"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "public"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.vnet_rg.id
  }

}