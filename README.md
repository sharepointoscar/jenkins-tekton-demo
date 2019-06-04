# OVERVIEW
This presentation takes the user through various changes to the `skiapp` repository.  Each folder represents a **Github Branch**


# Getting Started - Import Skiapp
Clone repository at https://github.com/jenkins-oscar/skiapp

```bash
# create the repo first
hub create jenkins-oscar/skierapp.git

# clone only the last commit from the master branch of the ski app
git clone --depth 1 -b master git@github.com:jenkins-oscar/skiapp.git skierapp

cd skierapp && rm -rf .git

echo "Init GIT"
git init && git add .
git commit -m "Initial Commit" && git remote add origin git@github.com:jenkins-oscar/skierapp.git

git push -u origin master


# in the root of the skiapp directory
# we need to remove the git, then import.
rm -rf .git

jx import --url git@github.com:jenkins-oscar/skierapp.git --name skiaway --git-username=sharepointoscar
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
# delete skierapp repo
hub delete jenkins-x/oscar/skierapp

# delete local repo 
cd ~/git-repos && rm -rf skierapp

```
