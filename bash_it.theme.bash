# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

# scm theming
SCM_THEME_PROMPT_PREFIX="|"
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red?}✗${normal?}"
SCM_THEME_PROMPT_CLEAN=" ${green?}✓${normal?}"
SCM_GIT_CHAR="${green?}±${normal?}"
SCM_SVN_CHAR="${bold_cyan?}⑆${normal?}"
SCM_HG_CHAR="${bold_red?}☿${normal?}"

VIRTUALENV_THEME_PROMPT_PREFIX="("
VIRTUALENV_THEME_PROMPT_SUFFIX=")"

function pure_prompt() {
	local ps_host="${bold_blue?}\h${normal?}"
	local ps_user="${green?}\u${normal?}"
	local ps_user_mark="${purple?}\$ ${normal?}"
	local ps_root="${red?}\u${red?}"
	local ps_root_mark="${red?} \$ ${normal?}"
	local ps_path="${yellow?}\w${normal?}"
	local virtualenv_prompt scm_prompt
	virtualenv_prompt="$(virtualenv_prompt)"
	scm_prompt="$(scm_prompt)"
	# make it work
	case "${EUID:-$UID}" in
		0)
			ps_user_mark="${ps_root_mark}"
			ps_user="${ps_root}"
			;;
	esac

  if [ "${KUBE_PS1_ENABLED}" == "on" ] ; then
	  PS1="${scm_prompt} ${ps_path} $(kube_ps1) ${ps_user_mark}"
  else
	  PS1="${scm_prompt} ${ps_path} ${ps_user_mark}"
  fi
}

safe_append_prompt_command pure_prompt
