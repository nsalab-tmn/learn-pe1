#cloud-config
write_files:
- path: /opt/deploy.sh
  content: |
    #!/bin/bash

    wget https://learncertstore.blob.core.windows.net/supercert/supercert.pem
    wget https://learncertstore.blob.core.windows.net/supercert/supercert.key

    mv supercert.pem /opt/supercert.pem
    mv supercert.key /opt/supercert.key

    echo "bind-addr: 0.0.0.0:443
    auth: none
    cert: true" > /opt/config.yaml 

    /etc/sln/download-files-for-python.sh 
    /etc/sln/download-assessment.sh 

    sudo code-server --install-extension ms-python.python

    sudo code-server --config /opt/config.yaml --cert /opt/supercert.pem --cert-key /opt/supercert.key /code

  owner: ubuntu:ubuntu
  permissions: '0644'

runcmd:
- export STORAGE_CONTAINER="${STORAGE_CONTAINER}"
- export LAB_DEPLOY_TEMPLATES_CS="${LAB_DEPLOY_TEMPLATES_CS}"
- export STORAGE_ACCOUNT_NAME="${STORAGE_ACCOUNT_NAME}"
- export LAB_TP_NAME="${LAB_TP_NAME}"
- export LAB_DEPLOY_PATH="${LAB_DEPLOY_PATH}"
- export DST_FOLDER="${DST_FOLDER}"
- export lab_assessment_templates_cs="${lab_assessment_templates_cs}"
- export storage_container_materials="${storage_container_materials}"
- export lab_assessment_path="${lab_assessment_path}"
- export lab_tp_name="${lab_tp_name}"
- chmod 777 -R /opt
- chmod +x /opt/deploy.sh
- /opt/deploy.sh