@echo off
set DOCKER_TLS_VERIFY=1
set COMPOSE_TLS_VERSION=TLSv1_2
set DOCKER_CERT_PATH=%~dp0
set DOCKER_HOST=tcp://ucp.docker.ee:443

kubectl >nul 2>&1
if %ERRORLEVEL% == 0 (
    set KUBECONFIG=
    kubectl config set-cluster ucp_ucp.docker.ee:6443_jenkins --server https://ucp.docker.ee:6443 --certificate-authority "%~dp0ca.pem" --embed-certs
    kubectl config set-credentials ucp_ucp.docker.ee:6443_jenkins --client-key "%~dp0key.pem" --client-certificate "%~dp0cert.pem" --embed-certs
    kubectl config set-context ucp_ucp.docker.ee:6443_jenkins --user ucp_ucp.docker.ee:6443_jenkins --cluster ucp_ucp.docker.ee:6443_jenkins
)
set KUBECONFIG=%~dp0kube.yml

REM
REM Bundle for user jenkins
REM UCP Instance ID ox51ffj80pxj2oe5xglu8m482
REM
REM Run this command from within this directory to configure your shell:
REM .\env.cmd
