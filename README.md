# AWS S3 + CloudFront Terraform Module

Modularized Terraform configuration for deploying S3 bucket with CloudFront distribution.

## Usage

1. Create S3 backend resources (one-time setup):
```bash
# Create state bucket and DynamoDB table
aws s3 mb s3://terraform-state-bucket --region us-east-1
aws s3api put-bucket-versioning --bucket terraform-state-bucket --versioning-configuration Status=Enabled
aws dynamodb create-table --table-name terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --region us-east-1
```

2. Update backend configuration in `main.tf` with your bucket and table names

3. Copy the example variables file:
```bash
cp terraform.tfvars.example terraform.tfvars
```

4. Edit `terraform.tfvars` with your values

5. Initialize and apply:
```bash
terraform init
terraform plan
terraform apply
```

## Outputs

- `s3_bucket_name` - S3 bucket name
- `cloudfront_distribution_id` - CloudFront distribution ID
- `cloudfront_domain_name` - CloudFront URL for accessing content
