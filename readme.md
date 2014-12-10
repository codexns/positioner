# Positioner

A set of scripts to position windows on OS X, Linux and Windows for the
purposes of screenshots or screencasting.

## Setup

### OS X

The first time you run the script, you'll need to grant your Terminal
rights to control accessibility on your mac.

### Windows

To run the script you'll need to open Powershell as an administrator
and then execute the following:

```
Set-ExecutionPolicy Unrestricted
```

### Linux

The script uses the `wmctrl` and `xdpyinfo` commands. On Ubuntu, the
following command needs to be run to install `wmctrl`:

```bash
sudo apt-get install wmctrl
```

## Usage

Each of the script takes the same parameters:

```
./linux.sh "Window Title" 1440 810
./osx.sh "Window Title" 1440 810
.\windows.ps1 "Window Title" 1440 810
```