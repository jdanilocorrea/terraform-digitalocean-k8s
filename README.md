```
terraform-digitalocean-k8s/  
├─ .github/  
│ └─ workflows/  
│ └─ terraform.yml  
├─ modules/  
│ ├─ provider/  
│ │ └─ main.tf  
│ ├─ vpc/  
│ │ ├─ main.tf  
│ │ ├─ variables.tf  
│ │ └─ outputs.tf  
│ ├─ k8s/  
│ │ ├─ main.tf  
│ │ ├─ variables.tf  
│ │ └─ outputs.tf  
│ ├─ node-pool/  
│ │ ├─ main.tf  
│ │ ├─ variables.tf  
│ │ └─ outputs.tf  
│ └─ loadbalancer/  
│ ├─ main.tf  
│ ├─ variables.tf  
│ └─ outputs.tf  
├─ environments/  
│ ├─ dev/  
│ │ ├─ terraform.tfvars  
│ │ └─ backend.tf # opcional: apenas se usar backend por env  
│ ├─ stage/  
│ └─ prod/   
├─ main.tf  
├─ outputs.tf  
├─ providers.tf  
├─ variables.tf  
├─ versions.tf  
└─ README.md
```