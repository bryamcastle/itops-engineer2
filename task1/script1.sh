#!/bin/bash
set -x

path=$(pwd)

source=$path/terraform/config.file

export GOOGLE_APPLICATION_CREDENTIALS=$path/terraform/key.json

function create(){
        cd docker
        gcloud auth activate-service-account --key-file $path/terraform/key.json
        sudo docker build -t hello-world-app .
        sudo docker tag hello-world-app gcr.io/$project/hello-world-app
        sudo docker push gcr.io/$project/hello-world-app
        cd $path

        cd terraform
        terraform init
        terraform plan
        terraform apply

        gcloud container clusters get-credentials gke-cluster --region $region --project $project
        kubectl apply -f deployment.yaml
        kubectl apply -f service.yaml
        kubectl apply -f ingress.yaml
        cd $path

}

function destroy(){

        cd terraform
        terraform destroy
        cd $path
}

function output(){

        cd terraform
        terraform output
        cd $path
}

if [[ "$1" == "create" ]]; then
        create
elif [[ "$1" == "destroy" ]]; then
        destroy
elif [[ "$1" == "output" ]]; then
        output
else
        echo "Have to use parameter: create | destroy | output"
fi
