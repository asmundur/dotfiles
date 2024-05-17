# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc


alias fman="compgen -c | fzf | xargs man"
alias fwhich="compgen -c | fzf | xargs which"
alias fversion="compgen -c | fzf | xargs -I {} bash -c '{} --version 2>/dev/null || {} -v 2>/dev/null || {} -V 2>/dev/null || {} version 2>/dev/null || echo \"No version option found for {}\"'"
alias fpod="kubectl get pods -A --no-headers | fzf | awk '{print \$2,\$1}' | xargs -n 2 sh -c 'kubectl describe pod \$0 -n \$1'"
alias frmpod="kubectl get pods -A --no-headers | fzf | awk '{print \$2,\$1}' | xargs -n 2 sh -c 'kubectl delete pod \$0 -n \$1'"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

complete -C /usr/bin/terraform terraform
