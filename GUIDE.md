# the bkunet guide

ok so here are all the things:

## the shell

it's all on `zsh`. use `zsh`. there are useful aliases and keybinds too.

if you notice your terminal freaking out and you're using the Ghostty terminal,
just do the hack of before opening `zsh` set `TERM=xterm-kitty` x_x.

there's a lot of autocomplete. autocomplete EVERYWHERE. tab on like `cd` for
example and it'll let you autocomplete the directories. tab on a bunch of
commands and it'll likely have their complete set of flags and descriptions!

there is also the use of `z` instead of `cd`. if you need the REAL `cd` command
use `builtin cd`, which will use the zsh builtin cd. you can use it by `z`-ing
to a directory that you've seen before, i.e. you've been to the directory `apple`
before so you can do `cd apple` and it'll go look at your history of cd-ing and
bring you there.

to tab complete on `z`, just type `cd ap ` (notice the space after `ap`) and the
hit tab. very good and cool. it won't autocomplete if there are no args, so you
can feel around for directories to `cd` into when you're just chilling.

### keybinds

- `TAB` see above
- `Ctrl+T` fuzzy find through current directory & subfolders (`ESC` to close any fuzzy finder)
- `Ctrl+R` fuzzy find through previously executed commands (I use this one all the time)

### aliases

- `lg` open lazygit
- `tre` print a tree of the current directory, do `tre X` to limit to X depth
- `sizeof [file]` show the file size of a dir/file
- `nsp [package package2 ...]` the current shell will now have the packages that you can find off of https://search.nixos.org/packages i.e. `nsp dig wireguard-tools` to use both `dig` and `wg`.
- `rgc` basically `rg` but with 3 context lines, on right there's `rg` for ripgrep (grep alternative)

## programs

todo

## nvim

honestly? please just configure this yourself. this out of the box configuration
that i use is kinda bad. but i like it, and now i'm forcing you to use it. soon there
will be some sort of option to turn off individual parts and this one should be up
for the chopping block.

there is which-key.nvim so a lot of this can just be found.

really useful keybinds:
- `<space>ff` find a file by name
- `<space>fg` find a file by content
- `<space>b` toggle terminal (to escape press escape twice)
- `<space>lg` open lazygit
- `<space>e` toggle file explorer

- `<space>w` to close current buffer tab
- `<space>W` to close all but current buffer tab
- `Alt+,` to go to leftward tab
- `Alt+.` to go to rightward tab

- `<space>gd` to go symbolic definition

honestly if you need more just do `<space>?` to pull up the bindings
