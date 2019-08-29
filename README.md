# Windows container with Azure CLI and docker.exe

This Windows container is just to have the Azure CLI and docker executable available. It is available on [Docker hub](https://hub.docker.com/r/jballe/azure-cli-docker)

It can be helpfull to login to Azure Container Registry and push images. You can do this hereby:

```powershell
docker run --rm `
  -v \\.\pipe\docker_engine:\\.\pipe\docker_engine `
  jballe/azure-cli-docker `
  powershell -Command 'az login --service-principal -u <clientid> -p <clientsecret> --tenant <tenant> ; `
    az acr login --name <registryname> ; `
    docker push <myimage> '
```
