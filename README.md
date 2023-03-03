<h1 align="center">Welcome to my Neovim IDE Layer 👋</h1>
<p>
</p>

![screenshot](https://user-images.githubusercontent.com/57322459/216741256-de0ac4fc-bda9-44fa-aac4-83413baaae7e.png)

I started off with [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch). The most interesting part should be `lua/lazy_init.lua`.

## Requirements

### System config

OS: EndeavourOS Linux x86_64

WM: [sway](https://swaywm.org/) (I'm on Wayland so you'd need a Wayland clipboard utility like [bugaevc/wl-clipboard](https://github.com/bugaevc/wl-clipboard))

Terminal: [kitty](https://github.com/kovidgoyal/kitty)

### Dependecies

`pip3 install pynvim`

#### Languages

`pacman -Syu nodejs ruby perl`

#### Tools

`pacman -Syu cmake fd ripgrep`

Open Neovim and run `:Mason` to install the LSP servers you need.

Go to `/lua/lsp/null_ls.lua` to see external dependecies needed for formatters and linters.

## CHANGELOG

- [CHANGELOG](./CHANGELOG.md)

## Author

- Github: [@kohane27](https://github.com/kohane27)

## Show your support

Give a ⭐️ if this project helped you!

---

_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
