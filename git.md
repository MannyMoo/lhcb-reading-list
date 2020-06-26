# Git setup

Git is version control software, mainly for code development. This means, as you develop your code, you can "commit" as you go. Each git commit records the current state of your code and the changes you've made since the last commit. This way, everything is backed up, and if something goes wrong you can check the revision history to identify the problem and revert changes as necessary. It also allows you to backup and share code on a remote repository, such as [Github](https://github.com/). After committing, you can "push" to the remote repository so it has a record of your commits. You can also "pull" changes from the repository so that other people can work on the same code and everyone can access the same version and revision history.

More info on using git can be found [here](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners).

Having set up a [Github account](https://github.com/), you can first get some handy utilities and configure git to work over ssh by installing [`commandline-utils`](https://github.com/MannyMoo/commandline-utils) with:

```
wget https://raw.githubusercontent.com/MannyMoo/commandline-utils/master/setup.sh
sh setup.sh -g -u <github username> -e <github email>
rm setup.sh
```

where `<github username>` and `<github email>` should be the username and email address used to set up your github account. This will configure git and generate an ssh key pair to use with your git account. Follow the instructions it prints to copy the generated public key into your github account. Again, I don't normally bother with a password for the key pair. This should allow you to push & pull from Github without needing a password, which is tested in the last step. You should see

```
Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.
```

You can check out all the other useful functions installed in `~/lib/bash/commandline-utils`. I also have in my login script:

```
export COMMANDLINEUTILSROOT=~/lib/bash/commandline-utils/
source $COMMANDLINEUTILSROOT/path-tools/path-tools.sh
source $COMMANDLINEUTILSROOT/ssh-tools/ssh-tools.sh
source $COMMANDLINEUTILSROOT/git-tools/git-tools.sh
source $COMMANDLINEUTILSROOT/shell-tools/bash-tools.sh
```

to load some more useful commands.