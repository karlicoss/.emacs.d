This repository bootstraps emacs, that is, you'll just need to

1. Ensure you've disabled the existing config: remove or rename `.emacs` and `.emacs.d`
2. Install mercurial:

    ```sudo apt-get install mercurial```

3. Clone the config

    ```
    cd ~
    hg clone http://bitbucket.org/karlicoss/.emacs.d
    ```

4. Run `emacs`, wait a bit while it downloads and installs packages for you

The `.emacs.d/.init.el` file has comments, so it shouldn't be hard to
understand what's happening in it.
