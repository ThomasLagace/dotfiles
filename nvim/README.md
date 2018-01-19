Neovim
======

This is a vim / neovim configuration.
Neovim config resides in `~/.config/nvim`, while vim configuration is in ~/.vimrc
It *should* work in both vim and neovim, but has only been tested with nvim

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
    pip3 install psutils
    ```

+  universal-ctags

+ For node.js completion:
    ``` 
    sudo npm install -g tern
    ```
+ Merlin for ocaml (when I get it fixed)

    ```
    opam install merlin
    ```

+ texlive for LaTeX editing support

+ Of course, pip2, pip3, and a powerline compatible font
