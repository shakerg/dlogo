$Env:DOCKER_TLS_VERIFY = 1
$Env:COMPOSE_TLS_VERSION = "TLSv1_2"
$Env:DOCKER_CERT_PATH = Split-Path $script:MyInvocation.MyCommand.Path
$Env:DOCKER_HOST = "tcp://ucp.docker.ee:443"

$d = Split-Path $script:MyInvocation.MyCommand.Path
if (Get-Command kubectl -ErrorAction Ignore) {
        $Env:KUBECONFIG = $null
        kubectl config set-cluster ucp_ucp.docker.ee:6443_jenkins --server https://ucp.docker.ee:6443 --certificate-authority "$(Join-Path $d ca.pem)" --embed-certs
        kubectl config set-credentials ucp_ucp.docker.ee:6443_jenkins --client-key "$(Join-Path $d key.pem)" --client-certificate "$(Join-Path $d cert.pem)" --embed-certs
        kubectl config set-context ucp_ucp.docker.ee:6443_jenkins --user ucp_ucp.docker.ee:6443_jenkins --cluster ucp_ucp.docker.ee:6443_jenkins
}
$Env:KUBECONFIG = Join-Path $d kube.yml

#
# Bundle for user jenkins
# UCP Instance ID ox51ffj80pxj2oe5xglu8m482
#
# Run this command from within this directory to configure your shell:
# Import-Module .\env.ps1
