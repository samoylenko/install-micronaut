# Micronaut CLI installer

A simple script to install [Micronaut](https://micronaut.io/) CLI for unprivileged users
(no root / sudo). It was created for macOS but should work in any POSIX
environment, including [Cygwin](https://www.cygwin.com/)

## Running the script

The script attempts to update the current environment by sourcing the changes it
just made, just before it exits. The last part won't work unless it is run using
dot or source:

```shell
. install-micronaut.sh
source install-micronaut.sh
```
