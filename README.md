## My dotfiles

### Notes for cloning to a fresh installation ([full guide](https://www.atlassian.com/git/tutorials/dotfiles)):

1) Before cloning: `echo ".dotfiles" >> .gitignore` to avoid recursion problems.
2) git clone --bare https://github.com/bjsi/dotfiles $HOME/.dotfiles
3) alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
4) config checkout
5) config config --local status.showUntrackedFiles no
