
# Marketplace AMI Pipeline v1

This repo builds a CentOS 7.9 AMI using Packer and Ansible via GitHub Actions CI.

## Usage

1. Add your AWS credentials as GitHub secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

2. Push to `main` branch to trigger the build.

The AMI will be built in `ap-southeast-1` region using a temporary keypair.
