# terraform-lil

## Notes

### GCP
1. Ensure that for Project ID is being used and not the project name
1. API Permissions need to be checked and confirms 
1. Serivce account needs to have ownership of the project
1. 

### Azure 
1. commands 
```
az login
az account set --subscription="<id_from_the_previous_command>"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<id_from_command_one>"

```

### AWS 
1. owners id for ubuntu (canonical) is 099720109477