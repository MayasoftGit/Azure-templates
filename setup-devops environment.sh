#!/bin/bash

# Set Azure CLI defaults
az configure --defaults group=devops-group location=eastus

# Create a Resource Group
az group create --name devops-group --location eastus

# Create a storage account for pipelines
az storage account create --name devopsstorageacct --resource-group devops-group --sku Standard_LRS

# Setup GitHub Actions Runner (Example)
curl -o actions-runner-linux-x64-2.308.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.308.0/actions-runner-linux-x64-2.308.0.tar.gz
mkdir actions-runner && cd actions-runner
tar xzf ../actions-runner-linux-x64-2.308.0.tar.gz

# Register the runner
./config.sh --url https://github.com/<your-repo> --token <your-token>

echo "DevOps environment setup completed successfully!"
