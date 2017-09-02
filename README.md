# General

A better setup script, which not only symlinks my config files, but instead incorporates a smarter
way to create the config files based on file parts as well as installing packages.
I wanted to split some configs (e.g. the i3 config) into two parts, because different systems
require different configuration changes, but also contain a lot a identical code.
In Addition this script inserts universal shortcuts and aliases in different files, inspired by
[Luke Smith](https://www.youtube.com/watch?v=9egjT9w6_Xc).

Another quite tedious task after setup can be installing all the packages you use, including those
directly required by the config files to function correctly, so the script does this as well.

This means, after initial install, I should be able to clone this repo, run the script and my system
will be completly setup and ready to go.

# Sources
- [This One **Wierd** Python Trick to keep my configs in sync! - Luke Smith](https://www.youtube.com/watch?v=9egjT9w6_Xc)
