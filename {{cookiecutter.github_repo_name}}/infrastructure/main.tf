module "eks-app" {
  source = "git::git@github.com:idealo/travel-data-terraform-modules.git//eks-app?ref=main"

  repository_name = "travel-data-skyscannertool"   # GitHub Repository  <Change Me>
  ecr_repository =  "travel-data-skyscannertool"    # optional: <repository_name> <Change Me>

  k8s_cluster_name = "travel-data-eks"  # optional: default=travel-data-eks

  environments = {
    "pro": {
      namespace: "skyscannertool"  # <Change Me>
      app_name: "travel-data-skyscannertool-pro" # <Change Me>
      app_policies = []
      app_inline_policy = data.aws_iam_policy_document.app_pro.json
    },
    "stg": {
      namespace: "skyscannertool" # <Change Me>
      app_name: "travel-data-skyscannertool-stg" # <Change Me>
      app_policies = []
      app_inline_policy = data.aws_iam_policy_document.app_stg.json
    }
  }
}

data "aws_iam_policy_document" "app_pro" {
  statement {
    effect = "Allow"
    actions = ["secretsmanager:GetSecretValue"]
    resources = [
      "arn:aws:secretsmanager:eu-central-1:553336977060:secret:pro/mysql/skyscannertool-??????", # <Change Me>
    ]
  }
}

data "aws_iam_policy_document" "app_stg" {
  statement {
    effect = "Allow"
    actions = ["secretsmanager:GetSecretValue"]
    resources = [
      "arn:aws:secretsmanager:eu-central-1:553336977060:secret:stg/mysql/skyscannertool-??????", # <Change Me>
    ]
  }
}

output "eks-app" {
  value = module.eks-app
}
