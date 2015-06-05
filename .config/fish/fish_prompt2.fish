set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set __fish_test_thing_one 'one'
set __fish_test_thing_two 'two'

function fish_prompt
    
    if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

    set last_status $status
    printf '%s' "$USER"
    set_color yellow
    printf '%s' "@"
    set_color 336
	printf '%s' "$__fish_prompt_hostname"
    set_color $fish_color_cwd
    if test -w (pwd)
    	set_color green
	else
		set_color red
    end
    printf ' %s' (prompt_pwd)
    set_color normal
    #printf '%s' (__fish_git_prompt)
    printf '%s ' ':'
    set_color normal
end