kubectl create secret docker-registry regcred \
  --docker-server=https://gcr.io \
  --docker-username=_json_key \
  --docker-email=docker@datatorch.io \
  --docker-password="$(cat gcrpull.json)"