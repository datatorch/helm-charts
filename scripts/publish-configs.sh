az artifacts universal publish \
    --organization https://dev.azure.com/DataTorchio/ \
    --feed datatorchio \
    --name helm-chart-values \
    --version 0.1.12 \
    --description "Helm chart config values" \
    --path ./configs