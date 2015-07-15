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
    
	set -l last_status $status

    if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end
	if not set -q ppid
		set -g ppid (ps -p %self -o 'ppid=' | xargs)
	end

	if not set -q session_type
		if begin test -n "$SSH_CLIENT"; or test -n "$SSH_TTY"; end
			set -g session_type "remote/ssh"
		else
			switch (ps -o comm= -p $ppid)
				case sshd
					set -g session_type "remote/ssh"
			end

		end
	end

    printf '%s' "$USER"
    if [ "$session_type" = "remote/ssh" ]
        set_color yellow
    	printf '%s' "@"
	    set_color 336
		printf '%s' "$__fish_prompt_hostname"
    end
    set_color $fish_color_cwd
    if test -w (pwd)
    	set_color green
	else
		set_color red
    end
    printf ' %s' (prompt_pwd)
    set_color normal
    printf '%s' (__fish_git_prompt)
    if [ (math "$last_status>0") = 1 ]
    	set_color red
    	printf ' %s' "$last_status"
	end
	if [ (math "$CMD_DURATION>1000") = 1 ]
		set_color magenta
		if [ (math "$CMD_DURATION>60000") = 1 ]
			set -l out (echo "scale=2;$CMD_DURATION/60000" | bc)
			printf ' %sm' "$out"
		else if [ (math "$CMD_DURATION>1000") = 1 ]
			set -l out (echo "scale=2;$CMD_DURATION/1000" | bc)
			printf ' %ss' "$out" 
		end
	end
    set_color normal
    printf ' %s ' ':'
end
