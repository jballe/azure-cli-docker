FROM stefanscherer/docker-cli-windows as dockercli

FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN powershell.exe -Command Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet' ; Remove-Item ./AzureCLI.msi
COPY --from=dockercli ["/docker.exe", "C:/Windows/"]
