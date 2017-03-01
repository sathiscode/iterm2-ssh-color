# Usage:
# source iterm2.zsh

# Script to change iTerm2 window/tab color based on SSH host
Requires iTerm2 >= Build 1.0.0.20110804

1. Copy to home folder. E.g: ~/iterm2_ssh_color.sh
2. Create different profiles in iTerm2 (Preferences -> Profiles)
3. Update iterm2_color.sh ssh_host_config section with ssh host names & corresponding configuration
4. Open ~/.bash_profile and add alias ssh=~/iterm2_ssh_color.sh
5. Restart iTerm2 terminal or execute source ~/.bash_profile

References
https://gist.github.com/wadey/1140259
https://github.com/samkeen/iterm-color-ssh/blob/master/ssh.color.sh
