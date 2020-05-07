# Defined in - @ line 1
function dotfiles --wraps='/usr/bin/git --git-dir=/Users/$HOME/.dotfiles/ --work-tree=/Users/$HOME' --description 'alias dotfiles /usr/bin/git --git-dir=/Users/$HOME/.dotfiles/ --work-tree=/Users/$HOME'
  /usr/bin/git --git-dir=/Users/$HOME/.dotfiles/ --work-tree=/Users/$HOME $argv;
end
