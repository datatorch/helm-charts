rm -rf ../files-to-gh
mkdir ../files-to-gh
helm package -d ../files-to-gh datatorch/
git checkout gh-pages
helm repo index --url "https://charts.datatorch.io" --merge index.yaml ../files-to-gh

mv ../files-to-gh/*.tgz ./
mv ../files-to-gh/index.yaml ./index.yaml

# git stash
# git checkout gh-pages
# yes | cp -rf ../files-to-gh/* ./