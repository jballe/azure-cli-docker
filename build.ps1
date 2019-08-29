param(
    $repo = "jballe/azure-cli-docker",
    [switch]$Push
)

& docker build -t "${repo}:windowsservercore-ltsc2019" --build-arg BASEIMG=mcr.microsoft.com/windows/servercore:ltsc2019 .
If($Push) { & docker push "${repo}:windowsservercore-ltsc2019" }
& docker build -t "${repo}:latest" -t "${repo}:windowsservercore-1903" --build-arg BASEIMG=mcr.microsoft.com/windows/servercore:1903 .
If ($Push) { & docker push "${repo}:windowsservercore-1903" }

& docker tag "${repo}:windowsservercore-ltsc2019" "${repo}:latest"
If ($Push) { & docker push "${repo}:latest" }