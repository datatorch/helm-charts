rm -rf ../files-to-gh
mkdir ../files-to-gh
helm package datatorch/
cp datatorch-*.tgz ../files-to-gh
rm datatorch-*.tgz
helm repo index ../files-to-gh --url https://charts.datatorch.io
git stash
git checkout gh-pages
yes | cp -rf ../files-to-gh/* ./