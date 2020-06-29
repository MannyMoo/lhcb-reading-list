# Tips for logging into Glasgow machines using ssh

## Working at the commandline

If you're unfamiliar with this, Section I of the [Theoretical Physics 3 Computer Laboratory](https://moodle.gla.ac.uk/course/view.php?id=4315#section-7) is a good start.

## Easy logins

You can log in to the Glasgow network from the commandline with [ssh](https://www.ssh.com/ssh/) ("secure shell") as detailed [here](https://twiki.ppe.gla.ac.uk/bin/view/IT/RemoteAccess#SSH). On Linux or OSX, open up a terminal and enter:

```
ssh username@ppelx.physics.gla.ac.uk
```

replacing `username` with the username for your PPE computing account. For Windows machines, you can use some of the software listed [here](https://twiki.ppe.gla.ac.uk/bin/view/IT/WindowsSSH) ([MobaXterm](http://mobaxterm.mobatek.net/) seems to work well).

To avoid having to give your username and full address every time, you can create an ssh config file, as described [here](https://linuxize.com/post/using-the-ssh-config-file/). First make the `~/.ssh` directory and `~/.ssh/config` file and set their permissions so only you can read or write to them:

```
mkdir -p ~/.ssh
chmod 0700 ~/.ssh
touch ~/.ssh/config
chmod 600 ~/.ssh/config
```

My `~/.ssh/config` file contains:

```
# Glasgow PPE.
host ppe*
    User username
    Hostname %h.gla.ac.uk

# Defaults for all hosts
host *
    Protocol 2
    PubkeyAuthentication      yes
    PasswordAuthentication    yes
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials yes
    ForwardX11 yes
    ForwardX11Trusted yes
    ServerAliveInterval 60
    ServerAliveCountMax 3
    IdentityFile ~/.ssh/id_rsa
```

Again you should replace `username` with the username for your PPE account. You can also configure ssh settings with the windows clients, eg, for [MobaXterm](https://mobaxterm.mobatek.net/documentation.html#4_1). Then you should be able simply to do

```
ssh ppelx.physics
```

This logs you in to one of the shared gateway machines. You shouldn't use these for any intensive work, so it's best to log in to a personal desktop from there. Each desktop on the PPE network has a name like `ppeNNN` which you can get from the sticker on the machine, eg, my desktop (the one physically sat at my desk) is `ppepc48`. So to log in to there from `ppelx`, you can simply do

```
ssh ppepc48
```

You can also get a list of all machines on the PPE network from ppelx with

```
arp
```

To avoid having to do the double login, you can use, eg

```
ssh -t ppelx.physics ssh ppepc48
```

which will log you in directly to `ppepc48` via `ppelx`. On Linux and OSX, you can add an alias for this command in your login script, eg

```
alias mydesktop="ssh -t ppelx.physics ssh ppepc48"
```

Your login script is normally `~/.bashrc` if you're using bash, although I like zsh with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh), in which case the login script is `~/.zshrc`. This is executed every time you open a new terminal, so you can put useful aliases, functions, and environment variables there, as well as sourcing other scripts.

Then, when you next open a new terminal, you can log in directly to `ppepc48` with just

```
mydesktop
```

To login without needing a password, you can create and use a key pair as detailed [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2), eg:

```
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | ssh ppelx.physics "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys"
```

I normally don't bother entering a passphrase for the key pair - just make sure never to give anyone else access to your private key! With your ssh config set up as above, you should then be able to use `mydesktop` to log in without needing to enter a password.

## Persistent sessions with `tmux`/`screen`

When you close an ssh session (with `^D` or `logout`), or if your connection is interrupted, any processes you're running are killed, which is quite inconvenient. To avoid this, you can create a persistent session with `tmux`, detailed [here](https://linuxize.com/post/getting-started-with-tmux/), or if `tmux` isn't installed, you can use its predecessor `screen` which will likely be installed. You can create a `tmux` or `screen` session, detach from it, and log out, and your processes will keep running. You can then log back in, reattach the session, and continue as before. This also works if your connection is interrupted.

You can create multiple different sessions with different names (say if you're working on more than one project). To create a new session with name `name`, do
```
tmux new-session -s name
```

Within the session, you can work as usual at the commandline. You can have multiple windows per session. To create a new one use `^b+c`. To switch between windows use `^b+n` for the next or `^b+p` for the previous window. For scrollback, do `^b+[`, use `PageUp` and `PageDown` to scroll, and hit `Esc` when you're done scrolling.

To detach from a session, do `^b+d`, which will return you to the login terminal. To reattach a session named `name`, do

```
tmux attach -t name
```

`screen` is very similar but with slightly different key bindings.

You can customise the behaviour of `tmux` by editing `~/.tmux.conf`, detailed [here](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/). For instance, I prefer to use `^z` as the control command rather than `^b`, and to have a larger scrollback limit than the default. So I have in my `~/.tmux.conf`:

```
# remap prefix from 'C-b' to 'C-z'
unbind C-b
set-option -g prefix C-z
bind-key C-z send-prefix

# Set scrollback buffer to 50000
set -g history-limit 50000
```

Hopefully this will make your life a lot easier when working over ssh!
