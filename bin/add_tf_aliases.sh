#!/usr/bin/env bash

# Define the alias and the Terraform command
alias_name="tf"
terraform_command="terraform"

# Check if the alias is already defined in .bash_profile
if ! grep -q "alias $alias_name=$terraform_command" ~/.bash_profile; then
    # If the alias doesn't exist, add it to .bash_profile
    echo "alias $alias_name=$terraform_command" >> ~/.bash_profile
    echo "Alias '$alias_name' for '$terraform_command' added to ~/.bash_profile."
    echo "You may need to restart your terminal or run 'source ~/.bash_profile' for changes to take effect."
else
    echo "Alias '$alias_name' for '$terraform_command' already exists in ~/.bash_profile."
fi

