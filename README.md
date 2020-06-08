Some Dumb Monitor Interface tool
=====
What Is, Why Do
-------
`sdmi` is a tool I wrote to make working with `xrandr` easier, since its syntax is a little verbose.

Features
-----
* Turn on and off specific displays.
* Control positioning of displays relative to $MAINDIS.

Installation and Usage
-----
* Clone this repository: `git clone https://github.com/gitluin/sdmi.git`.
* Copy or link `sdmi.sh` in `/usr/local/bin/`.
* Use `sdmi.sh` at the shell prompt!

Recent Statii
------
* v1.1 - Support for controlling the state of $MAINDIS too.
* v1.0 - Initial version. Can ask for help, turn on and off specific displays, control position of auxiliary displays.

To Do
----
 * Tab completion.
 * Intelligent swapping (i.e. MAINDIS has been set to HDMI, but you want to mirror to HDMI)

Please submit bug reports/feature requests as issues on the GitHub repository page!
