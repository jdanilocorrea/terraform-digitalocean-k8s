variable "name_cluster" {
  type        = string
  description = "Nome do cluster Kubernetes na DigitalOcean. Use um nome curto e descritivo (ex: 'prod-cluster')."
}

variable "region" {
  type        = string
  description = "Região da DigitalOcean onde o cluster será criado (ex: 'nyc3', 'sfo3')."
}

variable "vpc_uuid" {
  type        = string
  description = "UUID da VPC existente onde o cluster será provisionado. Use 'terraform output' do módulo de VPC para obter este valor."
}

variable "kubernetes_version" {
  type        = string
  description = "Versão do Kubernetes a ser usada no cluster (ex: '1.30.1-do.0'). Pode ser consultada com 'doctl kubernetes options versions'."
}

variable "tags" {
  type        = list(string)
  description = "Lista de tags aplicadas ao cluster para fins de organização, billing e automação."
  default     = []
}


variable "do_project_name" {
  description = "Nome do projeto/stack"
  type        = string
  default     = "do-k8s-project"
}
variable "vpc_cidr" {
  description = "CIDR para VPC do DO"
  type        = string
  default     = "10.10.0.0/16"
}
# -----------------------------
variable "node_pools" {
  description = "Lista de node pools com configuração. Exemplo: [{name='pool-1', size='s-2vcpu-4gb', count=3, tags=['app']}]"
  type = list(object({
    name  = string
    size  = string
    count = number
    tags  = optional(list(string), [])
  }))
  default = [
    {
      name  = "default-pool"
      size  = "s-1vcpu-4gb"
      count = 3
      tags  = ["worker"]
    }
  ]
}

variable "do_token" {
  description = "DigitalOcean API token. NÃO comite este token - use secrets / env vars / terraform cloud"
  type        = string
  sensitive   = true
}




