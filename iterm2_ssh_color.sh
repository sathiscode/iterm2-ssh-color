#!/bin/bash
################## Usage ##################
# 1. Copy to home folder. E.g: ~/iterm2_ssh_color.sh
# 2. Create different profiles in iTerm2 (Preferences -> Profiles)
# 3. Update iterm2_color.sh ssh_host_config section with ssh host names & corresponding configuration
# 4. Open ~/.bash_profile and add alias ssh=~/iterm2_ssh_color.sh
# 5. Restart iTerm2 terminal or execute source ~/.bash_profile
###########################################

### Add profile & tab color here
### format: {ssh hostname}:{Profile Name}:{tab color in RGB}
### E.g  Dev:Default:"0,0,0"

ssh_host_config=(
    dev:Default:"0,0,0"
)

### Set the terminal profile
function set_terminal_profile() {
    # Set window profile
    echo -e "\033]50;SetProfile=$1\a"
}

### Sets tab color
function set_tab_color() {
    IFS=',' read -a array <<< "$@"

    echo -ne "\033]6;1;bg;red;brightness;${array[0]}\a"
    echo -ne "\033]6;1;bg;green;brightness;${array[1]}\a"
    echo -ne "\033]6;1;bg;blue;brightness;${array[2]}\a"
}

#### Set the profile & tab color to defaults
function set_default_config() {
    set_terminal_profile "Default"
    set_tab_color "0,0,0"
    exit
}

for profile in ${ssh_host_config[*]}
do
    IFS=':' read -a conf <<< "${profile}"
    host_name=${conf[0]}
    proflie_name=${conf[1]}
    tab_rgb_color=${conf[2]}
    if [[ "$@" =~ "${host_name}" ]]; then
        set_terminal_profile "${proflie_name}"
        set_tab_color "${tab_rgb_color}"
    fi
done

trap set_default_config SIGINT SIGTERM

ssh $@

set_default_config