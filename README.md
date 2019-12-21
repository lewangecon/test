# Things to install

Here we list the things needed for data science

1. Download R and Rstudio
2. Mathpix
3. Atom

## Use Git and Github

### Step 1. Basics

  - Register a GitHub account
  - [Download Git for Windows:](https://happygitwithr.com/install-git.html#install-git-windows)
  - Configure Git:

  ```
  git config --global user.name 'Jane Doe'
  git config --global user.email 'jane@example.com'
  git config --global -list
  ```

  - [Connect to Github:](https://happygitwithr.com/push-pull-github.html#push-pull-github)

### Step 2. Create, modify, and update a Project

1. [Basics](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)

2. [.gitignore](https://www.atlassian.com/git/tutorials/saving-changes/gitignore): Imagine that you have a very large raw dataset that you do not make changes to nor want to share with others.


```
# exclude everything except directory foo/bar

    !/foo/bar

```

3. [How to find .gitignore in your system](https://stackoverflow.com/questions/11197249/show-system-files-show-git-ignore-in-osx)

4. [How to kill a push process](https://stackoverflow.com/questions/11729077/git-stop-git-push)

### Step 3. Collaborate with your friends (Part I)

1. [Set owner and add collaborators](https://swcarpentry.github.io/git-novice/08-collab/): Note that these collaborators can directly contribute to the project by pushing the changes to the Owner's repo `git push -u origin master` as they will do their own repository.

2. Clone a Repo
```
git clone https://github.com/vlad/planets.git ~/Desktop/vlad-planets
```

3. Before making any changes, a collaborator should always update his or her repo first `git pull origin master`

4. Oftentimes, you and your coauthor may be working on the same thing and both make changes to the same file. This would create a conflict, and Git would not allow you to push your changes then.

```
# Update the files first
git pull origin master

# Check the status to see which file contains merge conflict
git status

# Use Atom to open the file with merge conflicts and identify where the conflicts exist.
# Resolve the conflicts first. and save the file.
# then business as usual.
```

### Step 4. Collaborate with others: Donwload (Fork) others' work and Contribute (Pull Request) to them

1. [Fork a Repo](https://help.github.com/en/github/getting-started-with-github/fork-a-repo#fork-an-example-repository)

2. [Syncing a Fork]( https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork)

   - Tip: Syncing your fork only updates your local copy of the repository. To update your fork on GitHub, you must push your changes.
   - [**Warning:** Please enter a commit message to explain why this merge is necessary, especially if it merges an updated upstream into a topic branch](https://stackoverflow.com/questions/19085807/please-enter-a-commit-message-to-explain-why-this-merge-is-necessary-especially)

3. [Create a Pull Request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork)

4. [Owner to Review a Pull Request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/reviewing-proposed-changes-in-a-pull-request): Go to **Pull Requests**, examine **File changed**
