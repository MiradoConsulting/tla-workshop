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

* You should get a prompt that there is no _hello.cfg_.  Let the prompt create the file for you.

* Remove or comment things until _hello.cfg_ just contains:
```tla
INIT Init
NEXT Next
```
Make sure both _hello.tla_ and _hello.cfg_ are saved, then in either file, right-click and click _Check Model with TLC_.

You should get successful output.

## Settings

There's two more things we need to configure to have a good time:
- Turn off deadlock detection.
- Turn on PlusCal autotranslate.
Do both of these by right-clicking and clicking _Command Palette_ (or _ctrl-shift-p_) and use the prompt up the top to enter
```
>Preferences: Configure Language Specific Settings...
```
and then
```
TLA+
```
