# Setting up the LHCb software environment

The LHCb software environment sets up all the software you'll need and ensures that everything uses compatible versions. Having [set up git](git.html), you then want to install utilities for the LHCb environment by doing

```
eval "$(curl -fsSL https://raw.github.com/MannyMoo/lhcb-project-utils/master/setup.sh)"
```

This will modify `~/.bashrc` so that it sets up the LHCb software environment automatically on login. Then you should be ready to run and develop LHCb software.
