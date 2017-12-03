Neovim
======

This is a neovim configuration.
It resides in `~/.config/nvim`

In order to use it, you should probably get a few things.

You will need:
--------------

+ Plug: 

    ```
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

+ My colorscheme

    ```
    curl -fLo ~/.config/nvim/colors/SerialExperimentsLain.vim --create-dirs \
      https://raw.githubusercontent.com/ThomasLagace/SerialExperimentsLain/master/colors/SerialExperimentsLain.vim
    ```

+ Some Python dependencies:

    ```
    pip2 install --upgrade neovim
    pip3 install --upgrade neovim
    ```
+ Merlin for ocaml (when I get it fixed)

    ```
    opam install merlin
    ```
+ Of course, pip2, pip3, and opam, and a powerline compatible font
