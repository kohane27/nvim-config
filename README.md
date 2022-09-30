<h1 align="center">Welcome to my neovim config 👋</h1>
<p>
</p>

I started off with [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch). It's always fun to look at how other people configure their nvim. The most interesting part should be `lua/packer_init.lua`. Take whatever you need.

## Requirements

### My system config

OS: EndeavourOS Linux x86_64

WM: sway (I'm on Wayland hence you'd need [bugaevc/wl-clipboard](https://github.com/bugaevc/wl-clipboard))

Terminal: kitty

### Dependecies

`pip3 install pynvim`

#### Languages

`pacman -Syu nodejs ruby perl`

#### Tools

`pacman -Syuu cmake fd ripgrep`

Open Neovim and issue `:Mason` to install the LSP servers you need.

Go to `/lua/lsp/null_ls.lua` to see external dependecies needed for formatting or linters.

## CHANGELOG

* [CHANGELOG](./CHANGELOG.md)

## Author

* Github: [@kohane27](https://github.com/kohane27)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
