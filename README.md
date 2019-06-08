# OVERVIEW
This presentation takes the user through various changes to the `skiapp` repository.  Each folder represents a **Github Branch**


# Getting Started - Import Skiapp
Clone repository at https://github.com/jenkins-oscar/skiapp

```bash

# clone only the last commit from the master branch of the ski app
git clone --depth 1 -b master git@github.com:jenkins-oscar/skiapp.git skiersapp

cd skiersapp && rm -rf .git


echo "Init GIT"
git init && git add .
git commit -m "Initial Commit" && git remote add origin git@github.com:jenkins-oscar/skiersapp.git

# create the repo on github
hub create jenkins-oscar/skiersapp.git

git push -u origin master

# first remove the local repo we created, before importing into Jenkins X (it will create a folder with the repo name wherever we execute the command)

cd ../ && rm -rf skiersapp/

# in the root of the skiapp directory
jx import --url git@github.com:jenkins-oscar/skiersapp.git --git-username=sharepointoscar
```

# Homepage Changes

1. In the cloned app root directory execute:
```bash
git checkout -b Homepage-improvements
```

2. If needed, the original contents of each file are in the [homepage-improvements](/homepage-improvements) folder.

3. Make a small change such as changing the background image on `index.html`.  Pipeline will run. View logs `jx get activities -f skiapp -w`, 

4. Open terminal and execute `jx get build logs` this shows the actual logs to catch any errors.

# Tekton Prepend Stage Custom Steps
This branch, only  the `jenkins-x.yaml` file changes.

1. In the app root directory execute:
```bash
git checkout -b tekton-prepend-stage-custom-steps
```
2. Paste the contents of the `jenkins-x.yaml` file in the [tekton-prepend-stage-custom-steps](/tekton-prepend-stage-custom-steps) folder.

3. Check in changes
```bash
git add . && git commit -m "prepending and appending custom tekton pipeline steps" 
git push

#checkout -b tekton-prepend-stage-custom-steps
```
4. View logs

# Tekton Override Entire Pipeline
This branch, only  the `jenkins-x.yaml` file changes.

1. In the app root directory execute:
```bash
git checkout -b tekton-override-entire-pipeline
```
2. Paste the contents of the `jenkins-x.yaml` file in the [tekton-override-entire-pipeline](/tekton-override-entire-pipeline) folder.

3. Check in changes
```bash
git add . && git commit -m "overriding entire pipeline." 
git push

#checkout -b tekton-prepend-stage-custom-steps
```
4. View logs

# Cleanup

```bash

# cleanup jx resources

# delete app from jx
jx delete application 

# garbage collection
jx gc previews && jx gc pods && jx gc helm

```
