# TLA+ Workshop

## Setup

We will use Visual Studio Code and the TLA+ plugin.

* Install Visual Studio Code if you don't already have it

* Save the following code as hello.tla:

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
