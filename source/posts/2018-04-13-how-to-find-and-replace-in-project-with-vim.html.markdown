---

title: How to Find and Replace Project-wide in Vim
date: 2018-04-13 18:03 MDT
tags: vim, neovim, find and replace, code
published: true

---

## The problem

Sometimes one finds themselves with a need to search and replace some text throughout many places in a project. This often happens during a refactor, or when you made a mistake with a CLI code generator (like `rails scaffold`), and you accidentally misspell something.

In most modern IDEs, "find and replace all" is pretty simple - highlight the text, `Ctrl-Shift-F`, enter the new text, and hit enter. As you know, Vim does things a little differently.

You probably are already aware of how to find and replace all text within a file: `: %s/text/newText/g` - "within this file, find all instances of `text`, and replace it with `newText`."

But doing so in multiple files at once with just one or two commands has proven difficult until [Vim 7.4.8 released](https://chrisarcand.com/vims-new-cdo-command/) the `:cdo` and `:cfdo` commands. NeoVim with FZF and Ag makes it even easier.

## The solution

### Setup

1. Make sure you're using [Neovim](https://neovim.io/) (or Vim 7.4.8+, but really just use Neovim)
2. Install [FZF](https://github.com/junegunn/fzf#installation) for the command line and as a [vim plugin](https://github.com/junegunn/fzf#as-vim-plugin)
3. Install [Ag](https://github.com/ggreer/the_silver_searcher), so that it's available automatically to FZF in vim
4. If using iTerm2 on OSX, [set the alt/option key to Esc+](https://github.com/junegunn/fzf.vim/issues/54#issuecomment-350417085)

### Usage

1. Search the text you want to change in the current directory and it's children with `:Ag text`
  - Keep typing to fuzzy filter items
2. Select items with `alt-a`
  - Deselect items with `alt-d`
  - `Tab` and `Shift-Tab` will toggle individual items in the list
3. `Enter` will populate the quickfix list
4. `:cfdo %s/text/newText/g | :w` will substitute all instances of `text` with `newText` that you have selected, and save each file.
5. Rejoice.
  - You can also make a macro to do cool stuff with `:cfdo` rather than just substitution like `:cfdo {doCoolStuff} @a`

Thanks to Github user [@trevordmiller](https://github.com/trevordmiller) for tips on this.

