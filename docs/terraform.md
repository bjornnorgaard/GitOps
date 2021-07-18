# Quick tutorial for getting set up
Installed the Terraform CLI and added it to PATH.

Using this guide [https://registry.terraform.io/providers/scaleway/scaleway/latest/docs](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs).

Created `terraform/test.tf` with content as shown below.

```cs
terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.1.0"
    }
  }
}

provider "scaleway" {
  # Configuration options
  zone            = "fr-par-1"
  region          = "fr-par"
  project_id      = "your project guid"
}
```

In the `/terraform` directory, I ran: `terraform init`

Updated file to match example in guide: 

Ran `terraform plan` to see the proposed update.

Now we need to setup authentication for our Scaleway project.

```sh
$ export SCW_ACCESS_KEY="my-access-key"
$ export SCW_SECRET_KEY="my-secret-key"
```

We can now run `terraform apply` to provision the resources.

Finally we can drop the deployment with `terraform destroy`
