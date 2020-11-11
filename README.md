# TLA+ Workshop

## Setup

We will use Visual Studio Code and the TLA+ plugin.

* Install Visual Studio Code if you don't already have it

* Save the following code as _hello.tla_:

```tla
-------- MODULE hello --------

VARIABLES x

Init ==
    x = 0

Next ==
    x' = x

==============================
```

* You should get a popup suggesting that you search the marketplace for plugins.  Do so and install the TLA+ plugin.

* Once the plugin is installed, right-click in the code window and hit _Check Model with TLC_.

* You should get a prompt that there is no hello.cfg.  Let the prompt create the cfg file for you.  Remove or comment things until _hello.cfg_ just contains:
INIT Init
NEXT Next
Make sure both files (.tla and .cfg) are saved, then in either file, right-click and click _Check Model with TLC_.
