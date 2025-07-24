# Serverless Package Vulnerability Scanning

A CI/CD pipeline that demonstrates security-first deployment of AWS Lambda functions with comprehensive vulnerability scanning.

## Overview

This project showcases how to integrate multiple security scanning tools into a serverless deployment pipeline, ensuring that infrastructure is only deployed after passing all security checks.

## Architecture

### AWS Resources
- **Lambda Function**: Node.js 22.x runtime with "Hello World" handler
- **IAM Role**: Minimal permissions for CloudWatch logging
- **VPC**: Multi-AZ setup with public/private subnets
- **Region**: ap-southeast-1 (Singapore)

### Security Scanning Pipeline
1. **NPM Audit** - Dependency vulnerability scanning
2. **Snyk Open Source** - Third-party package analysis
3. **Snyk Code** - Application code security review
4. **Snyk IaC** - Terraform configuration scanning

## Project Structure

```
├── .github/workflows/
│   └── package-scan.yml     # CI/CD pipeline
├── files/
│   ├── index.mjs           # Lambda function code
│   └── lambda_function.py  # Python alternative
├── iam.tf                  # IAM roles and policies
├── lambda.tf               # Lambda function definition
├── vpc.tf                  # VPC infrastructure
├── variable.tf             # Terraform variables
├── provider.tf             # AWS provider config
└── package.json            # Node.js dependencies
```

## Setup

### Prerequisites
1. AWS account with programmatic access
2. Snyk account and API token
3. GitHub repository with Actions enabled

### Configuration
1. **GitHub Secrets**:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `SNYK_TOKEN`

2. **Install Snyk CLI**:
   ```bash
   npm install -g snyk
   ```

## Deployment Flow

1. **Security Scans** (parallel execution)
   - NPM audit checks dependencies
   - Snyk scans code, packages, and infrastructure
   
2. **Infrastructure Deployment**
   - Terraform creates AWS resources
   - Only proceeds if all scans pass
   
3. **Testing & Cleanup**
   - 2-minute wait for verification
   - Automatic resource destruction

## Key Features

- **Security-First**: No deployment without passing scans
- **Multi-Layer Scanning**: Dependencies, code, and infrastructure
- **Automated Cleanup**: Resources destroyed after testing
- **Minimal Permissions**: IAM follows least privilege principle

## Usage

Push to repository or trigger workflow manually to start the security scanning and deployment process.

## Customization

- Modify `variable.tf` for different resource names
- Update `files/index.mjs` for custom Lambda logic
- Adjust scan thresholds in workflow file
- Change AWS region in `provider.tf`