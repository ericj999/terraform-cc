output "vault_id" {
    description = "The Vault ID"
    value = azurerm_key_vault.main.id
}

output "vault_uri" {
    description = "The URI of the vault for performing operations on keys and secrets"
    value = azurerm_key_vault.main.vault_uri
}