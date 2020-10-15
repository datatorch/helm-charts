kubectl create secret generic azure-pgbouncer-config \
    --from-file=pgbouncer.ini \
    --from-file=userlist.txt