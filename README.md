# OVERVIEW
This presentation takes the user through various changes to the `skiapp` repository.  Each folder represents a **Github Branch**


# Getting Started 

The setup bash script clones an existin repository into a new one and strips out the `.git` files.  

It then adds all files, commits and pushes all to new repo, which is created in github using `hub`

```bash
./setup.bash
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
./cleanup.bash

```
