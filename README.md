[Payments](https://github.com/SynergyDataSystems/PatriotSoftware.Payments)

# PatriotSoftware.Payments.AwsCdkLocal
## A Local Stack CDK Helper Helper Image

Small image that can execute CDK by mounting the CDK code properly and executing the proper commands.

## Usage

```
  aws-cdk:
    container_name: cdk-host
    network_mode: host
    image: mhamiltonpatriot/aws-cdk-local
    command: bash -c "
        cdklocal bootstrap -c isLocalStack=true -v
        && cdklocal deploy -c isLocalStack=true
      "
    depends_on:
      localstack:
        condition: service_healthy # Only start up once the localstack service is ready for connections
    working_dir: /repos/PatriotSoftware.Payments.TempEscrowAccountEventBridge/deploy
    environment:
      AWS_ACCESS_KEY_ID: " "
      AWS_SECRET_ACCESS_KEY: " "
      AWS_DEFAULT_REGION: "us-east-1"
      LOCALSTACK_HOSTNAME: "127.0.0.1"
    volumes:
      - ./../../../repos:/repos # Mount the CDK folder to use
```

## Build and Publish
```
# Run from outside cloned repo
docker build -t mhamiltonpatriot/aws-cdk-local PatriotSoftware.Payments.AwsCdkLocal
docker login

image tag mhamiltonpatriot/aws-cdk-local mhamiltonpatriot/aws-cdk-local:latest
image tag mhamiltonpatriot/aws-cdk-local mhamiltonpatriot/aws-cdk-local:1.1.0

docker push mhamiltonpatriot/aws-cdk-local --all-tags
```
