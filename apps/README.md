# Utilities

## Directory Structure
To standardize how apps will be used and installed within the home folder the following directory structure could be used:

```

|-- isc21-scc
    |-- apps
    |   |-- bin
        |-- lib
        |-- share
        ...

```


## LMOD
Make use of LMOD to configure the environment for different modules

Use<code> ml {modulename}</code> to load {modulename}

Use<code> ml unload {modulename}</code> to unload a module

LMOD keeps versioning in mind. Say you have two gcc versions under the module names:

`gcc/6.3.2` and `gcc/9.4.1(D)`

then `gcc/9.4.1` will be loaded when you <code>ml gcc</code>

Read more about LMOD https://lmod.readthedocs.io/en/latest/