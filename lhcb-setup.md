# Setting up the LHCb software environment

Note that this assumes you're working on a PPE machine at Glasgow (and not `ppelx` or `ppelogin`). It might be possible to get this to work elsewhere, but would take extra work.

The LHCb software environment sets up all the software you'll need and ensures that everything uses compatible versions. Having [set up git](git.html), you then want to install utilities for the LHCb environment by doing

```
eval "$(curl -fsSL https://raw.github.com/MannyMoo/lhcb-project-utils/master/setup.sh)"
```

This will modify `~/.bashrc` so that it sets up the LHCb software environment automatically on login. Then you should be ready to run and develop LHCb software. "Setting up the environment" is mainly about defining [environment variables](https://phoenixts.com/blog/environment-variables-in-linux/) so that you can access the necessary software executables and libraries, and ensuring that the software versions are all consistent and linked properly. Eg, you'll find that you now have the `lb-run` command, which is used to setup and run LHCb software packages. More information on that can be found [here](https://lhcb.github.io/starterkit-lessons/first-analysis-steps/davinci.html).

You'll also have a `root-env` command, to set up a basic environment with just ROOT. If you just enter

```
root-env
```

then this will start an interactive shell in the ROOT environment, so you can use the `root` executable, and also `import ROOT` in python, and any other ROOT functionality you want to use. You can also give commands to `root-env`, which will be executed in the ROOT environment without starting a new interactive shell. Eg, to open a .root file:

```
root-env root -l myfile.root
```

or start an `ipython` session:

```
root-env ipython
```

This way of setting up and working in different environments is key to the LHCb software.
