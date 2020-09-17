az artifacts universal publish \
    --organization https://dev.azure.com/DataTorchio/ \
    --feed datatorchio \
    --name helm-chart-values \
    --version 0.1.4 \
    --description "Helm chart values" \
    --path ./configs