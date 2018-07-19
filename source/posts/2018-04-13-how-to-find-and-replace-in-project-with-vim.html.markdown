---

title: How to Find and Replace Project-wide in Vim
date: 2018-04-13 18:03 MDT
tags: vim, neovim
published: false

---

Sometimes one finds themselves with a need to search and replace some text throughout many places in a project. This often happens during a refactor, or when you made a mistake with a CLI code generator (like `rails scaffold`), and you accidentally misspell something.

In most modern IDEs, "find and replace all" is pretty simple - highlight the text, `Ctrl-Shift-F`, enter the new text, and hit enter. As you know, Vim does things a little differently.

You probably are already aware of how to find and replace all text within a file: `: %s/oldText/newText/g` - "within this file, find all instances of 'oldText', and replace it with 'newText'."

But doing so in multiple files at once with just one or two commands has proven difficult until Vim 7.4.8 released the `:cdo` and `:cfdo` commands. NeoVim with FZF makes it even easier.


### Links

https://chrisarcand.com/vims-new-cdo-command/
https://github.com/junegunn/fzf.vim/issues/528
https://github.com/junegunn/fzf.vim/issues/54#issuecomment-350417085
https://github.com/junegunn/fzf.vim/issues/586
