#! /bin/bash

path=$(pwd)

source=$path/itops-engineer2/task2/config.file

gcloud compute --project=$project instances create centos-jenkins --description "vm centos testing" --zone=$zone --machine-type=f1-micro --subnet=$subnet --network-tier=STANDARD --image=centos-7-v20210512 --image-project=centos-cloud --boot-disk-size=20GB --boot-disk-type=pd-standard --boot-disk-device-name=centos-jenkins --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=none --metadata-from-file=startup-script=$path/itops-engineer2/task2/init-file --metadata=ssh-keys=${ssh-keys}
