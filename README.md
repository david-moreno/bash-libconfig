# bash-libconfig

A Bash library for basic configuration files handling

Install
-------

You can clone this repository or download it as a zip file. To clone:

    $ git clone https://github.com/david-moreno/bash-libconfig.git
    $ cd bash-libconfig
    $ sudo make install

Uninstall
---------

Using the cloned/unzipped directory:

    $ cd bash-libconfig
    $ sudo make uninstall

Usage
-----

#### cfg_exists *file*
Checks if the config *file* exists

#### cfg_isset *variable*
Checks if *variable* has a value

#### cfg_isnum *variable*
Checks if *variable* is a valid number

#### cfg_isint *variable*
Checks if *variable* is a valid integer number

#### cfg_isfloat *variable*
Checks if *variable* is a valid floating point number

#### cfg_exit_on_no_conf *file*
Terminates the script if the configuration *file* does not exists

#### cfg_warn_on_no_conf *file*
Issues a warning if the configuration *file* does not exists

#### cfg_exit_on_unset *variable*
Terminates the script if the *variable* is not set

#### cfg_warn_on_unset *variable*
Issues a warning if the *variable* is not set

Example
-------

If we have a configuration file *myscript.conf*:

```bash
name="user"
level=40
```

We can include it into our script in this way:

```bash
#!/bin/bash

#Includes the library into the script
source "/usr/lib/bash/libconfig"

#If the config file exists, include it
config="test.conf"
cfg_exit_on_no_conf config
source "$config"

#Checks if 'level' variable is set and is a valid number
cfg_exit_on_unset level
if (( `cfg_isnum level` )); then
	plevel=$level
else
	plevel=0
fi

#Checks if 'name' variable is set
if (( `cfg_isset name` )); then
	pname=$name
else
	pname="Unknown"
fi

echo "Hi $pname!"
echo "Level: $plevel"
```
