dayone
======

Your first day at isocket shouldn't be wasted setting up your dev environment. We've automated those menial tasks so you can get right to what you really want to do- ship code.

## Setup

Assuming you've just been handed a new MacBook Pro, launch Terminal and run this:

```bash
mkdir dayone && curl -L https://github.com/isocket/dayone/tarball/master | tar xz --strip 1 -C dayone && cd dayone && ./setup.sh
```

There will be some simple prompts along the way.

Read more about [what will be installed](https://github.com/isocket/dayone/wiki/What-Will-Be-Installed) on the wiki
