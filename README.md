ping
====

perl pinger for Orakel.

This is a small script for irssi that will run the command 'beep' in the host system once anyone in a channel he has joined says a given KEYWORD:

## Dependencies
- beep (The package [beep](http://packages.ubuntu.com/search?keywords=beep). Alternatively, 'beep' can be aliased to whatever command you wish to be run.)
- irssi (as this is an irssi script...)


## Autorun irssi 

### Irssi config nick

You might want to always be available at a certain channel with a certain nick. In order to do this, we will set up so 
that when irssi starts, it sets this up automatically. In order to do this, open irssi and type:

```
/SERVER ADD -auto -network freenode irc.freenode.net 6667
/network add -nick your_nick freenode
/CHANNEL ADD -auto #irssi freenode
```

This will join freenode with nick "your_nick" and join channel "#irssi" whenever irssi is opened.

### Autostartup irssi in individual screen

In a bash file running at startup, e.g. .bash_profile type (irc can be replaced with your title):

```
screen -dmS irc bash -c "irssi"
```

This will cause irssi to be started up at startup in an individual screen (depends on screen package obviously)

