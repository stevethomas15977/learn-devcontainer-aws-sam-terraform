# custom-vscode-devcontainer
Learn how to create a custom vscode devcontainer 

## Environment variables
$ENV:<AWS_ACCESS_KEY_ID> = '' \
$ENV:<AWS_SECRET_ACCESS_KEY> = '' \
$ENV:<AWS_DEFAULT_REGION> = 'us-east-1' 

## Follow instruction indicated here 
cd /zip_based_lambda_functions/api-lambda-dynamodb-example/
terraform init
terraform apply
sam build --hook-name terraform --beta-features
sam local invoke aws_lambda_function.publish_book_review -e events/new-review.json --beta-features

## Also see this URL for further learning
[Devcontainers with AWS SAM and Terraform](https://aws.amazon.com/blogs/compute/better-together-aws-sam-cli-and-hashicorp-terraform/)
