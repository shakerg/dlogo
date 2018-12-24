export DOCKER_TLS_VERIFY=1
export COMPOSE_TLS_VERSION=TLSv1_2
export DOCKER_CERT_PATH=$PWD
export DOCKER_HOST=tcp://ucp.docker.ee:443

if kubectl >/dev/null 2>&1; then
    unset KUBECONFIG
    kubectl config set-cluster ucp_ucp.docker.ee:6443_jenkins --server https://ucp.docker.ee:6443 --certificate-authority "$PWD/ca.pem" --embed-certs
    kubectl config set-credentials ucp_ucp.docker.ee:6443_jenkins --client-key "$PWD/key.pem" --client-certificate "$PWD/cert.pem" --embed-certs
    kubectl config set-context ucp_ucp.docker.ee:6443_jenkins --user ucp_ucp.docker.ee:6443_jenkins --cluster ucp_ucp.docker.ee:6443_jenkins
fi
export KUBECONFIG=$PWD/kube.yml

#
# Bundle for user jenkins
# UCP Instance ID ox51ffj80pxj2oe5xglu8m482
#
# Run this command from within this directory to configure your shell:
# eval "$(<env.sh)"
