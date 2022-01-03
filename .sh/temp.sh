#!/bin/sh
echo "Get Diffs"
git config --global user.email "VlocityCICD@noreply.github.com"
git config --global user.name "lawbh93/VlocityCICD"

X=${TARGET:default}
echo $X
CURREN_Branch= git branch --show-current

echo 'current branch' ${git branch -a}
if [[ " $X " =~  'develop' ]]; then
    VAR= git diff --name-only remotes/origin/develop..$CURREN_Branch
elif [[ " $X " =~  'release' ]]; then
    VAR= git diff --name-only remotes/origin/release..$CURREN_Branch
elif [[ " $X " =~  'master' ]]; then
    VAR= git diff --name-only remotes/origin/master..$CURREN_Branch
# Siguiente condicion solo para fines de pruebas
elif [[ " $X " =~  'updateMetadata' ]]; then
    VAR= git diff --name-only remotes/origin/master..$CURREN_Branch
fi
echo $VAR