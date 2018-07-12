function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    # User
    set_color $fish_color_user
    echo -n [(whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)]
    set_color normal

    echo -n ' '

    # PWD
    set_color blue
    echo -n (prompt_pwd)
    set_color normal

    __custom_terlar_git_prompt
    __fish_hg_prompt

    # Newline
    echo

    # Background jobs
    set -l jobs (jobs | wc -l | tr -d '. ')
    echo -n -
    if not test $jobs -eq 0
        set_color red
    end
    echo -n $jobs
    set_color normal
    echo -n -

    # Current time H:M
    echo -n (date "+%H:%M")

    # Pass/Fail prompt character
    if not test $last_status -eq 0
        set_color $fish_color_error
    else
        set_color green
    end

    echo -n ' λ '
    set_color normal
end
