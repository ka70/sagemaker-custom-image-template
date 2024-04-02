# sagemaker-custom-image-template
This repository provides a template for creating a custom image for SageMaker Studio JupyterLab, streamlining the process of deployment and integration with AWS services.

## Creating a Custom Image

The creation of the custom image is guided by the official AWS documentation on granting users access to custom images. To facilitate a comprehensive deployment experience, a repository has been set up that automates the steps involved.

### Repository Cloning

To get started, clone the repository and navigate into its directory:

```bash
git clone https://github.com/ka70/sagemaker-custom-image-template.git
cd sagemaker-custom-image-template
```

### Custom Image Storage and Usage
Custom images are stored in ECR (Elastic Container Registry) and utilized within SageMaker. The image_push.sh script automates the creation of the repository, building of the image, and pushing it to ECR.

### Configuration
Before executing the script, open image_push.sh and set the variables according to your AWS environment and requirements:

```bash
REPOSITORY_NAME="smstudio-custom"
ACCOUNT_ID=<ACCOUNT ID>
REGION="ap-northeast-1"
TAG_NAME="latest"
```

Additionally, customize the requirements.txt file to include any necessary libraries for your custom image.

### Execution
Make the script executable and run it to push your image to ECR:
```
chmod +x push_image.sh
./push_image.sh 
```
### Verification
After the script execution, verify that your image has been successfully registered in ECR, making it available for use in SageMaker Studio JupyterLab.

For detailed instructions and further information on providing access to custom images in SageMaker, refer to the AWS official documentation linked within the repository.

## References

- [Qiita article on SageMaker custom images](https://qiita.com/unpipipi/items/301dc2e64b72abf22b60)
- [AWS official documentation - Providing Users Access to Custom Images](https://docs.aws.amazon.com/sagemaker/latest/dg/studio-updated-jl-provide-users-with-images.html)



