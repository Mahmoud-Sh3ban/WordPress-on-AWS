# WordPress Deployment on Local Kubernetes using Terraform and Amazon RDS <p>

## Description:
This project demonstrates the deployment of a WordPress website on local Kubernetes using Minikube and storing the data of WordPress inside Amazon RDS (Amazon Relational Database Service) by using Terraform as Infrastructure-as-Code. It provides a seamless integration between WordPress, Kubernetes, and RDS for easy deployment and management of the website.<p>

<p>
  
## Prerequisites:<p>
  
Before getting started, ensure that you have the following prerequisites in place:<p>

- Local Kubernetes cluster - Minikube<p>
- Terraform installed on your local machine<p>
- Amazon Web Services (AWS) account with appropriate permissions to create and manage resources <p>(including Amazon RDS)<p>

<p> 
   
## Project Structure:<p>
  
The project consists of the following components:<p>
- **WordPress application**: A containerized WordPress application, including PHP, Apache, and necessary dependencies.<p>
  
- **MySQL database**: An Amazon RDS instance serving as the backend database for WordPress.<p>
  
- **Terraform configuration**: Infrastructure-as-Code (IaC) scripts written in Terraform to provision the necessary resources on AWS, including VPC, subnets, internet gateway, security groups, and etc.<p>
  
- **Kubernetes manifests**: YAML files describing the Kubernetes deployments, services, ingress rules, and other required configurations.<p>

<p>
  
## Setting Up The Environment:<p>
  
- Install Minikube:<p>
     ```plaintext
     Install Minikube using a package manager or direct download
     ```
 <p>
    
 - Install kubectl:<p>
      ```plaintext
      Install kubectl using package manager or direct download
      ```
 <p>
     
 - Setup AWS Credentials:<p>
    ```plaintext
    aws configure --profile your-profile
    ```
<p>
    
## Deployment Steps:<p>

  ### Provisioning AWS Resources<p>
    
  1. Update the AWS provider configuration in `provider.tf` with your desired AWS region and profile.<p>
    
  2. Run the following Terraform commands to initialize the modules<p>

      ```shell
      terraform init
      terraform apply --auto-approve
      ```
<p>
  
This will create the necessary AWS resources, including an RDS instance running MySQL. <p>

  
<p>

### Configuring Kubernetes and Deploying WordPress:<p>

1. Start Minikube:<p>
  
    ```shell
     minikube start
    ```
  
<p>
  
2. Configure kubectl to use the Minikube cluster:<p>
  
     ```shell
     kubectl config use-context minikube
     ```
<p>
 
3. Apply the Kubernetes manifest to deploy WordPress:<p>
  
      ```shell
      kubectl apply -f wordpress.yaml
      ```
 
<p>
   
  This will create the WordPress deployment and service on the Minikube cluster.<p>
<p>


### Connecting to WordPress:<p>
1. Get the Minikube IP:<p>
  
   ```shell
     minikube ip
    ```
<p>
  
2. Access the WordPress website in a web browser using the Minikube IP and the NodePort:<p>
  
    ```shell
    http://<minikube-ip>:<node-port>
    ```

<p>

 Note: Replace <minikube-ip> with the actual IP and <node-port> with the NodePort specified in `wp-k8s.tf`. <p>

<p>
  
 ## Cleaning up the Development Environment:<p>
  
 ### Destroy the AWS resources:<p>
  
        ```shell
         terraform destroy --auto-approve
        ```

 <p>

  This will delete the RDS instance and other associated AWS resources.<p>
 
<p>
 
## Version:<p>

 Terraform v1.4.6 <p>
  - provider.AWS v4.67.0
  - provider.Kubernetes v2.20.0






