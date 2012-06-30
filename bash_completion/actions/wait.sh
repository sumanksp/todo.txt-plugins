# Wait first options (List of available items)
if [ ${COMP_WORDS[1]} = "wait" -a ${#COMP_WORDS[@]} -eq 3 ]; then
    COMPREPLY=($(compgen -W "$(export TODOTXT_PLAIN=1; eval $our_cmd ls | awk '/^[0-9]/{print $1}' | tr -d '\r' | sort -n)" -- "${word}"));
fi
# Wait second options (quoted text field)
if [ ${COMP_WORDS[1]} = "wait" -a ${#COMP_WORDS[@]} -eq 4 ]; then
    COMPREPLY=('"' "${word}");
fi
# Wait third options (for)
if [ ${COMP_WORDS[1]} = "wait" -a ${#COMP_WORDS[@]} -eq 5 ]; then
    COMPREPLY=("for" "${word}");
fi
# Wait fourth options (List of available items except the blocked item)
if [ ${COMP_WORDS[1]} = "wait" -a ${#COMP_WORDS[@]} -eq 6 ]; then
    COMPREPLY=($(compgen -W "$(export TODOTXT_PLAIN=1; eval $our_cmd ls | awk '/^[0-9]/{print $1}' | tr -d '\r' | sort -n | grep -v ${COMP_WORDS[2]})" -- "${word}"));
fi
# unwait first options (List of items with blockers set)
if [ ${COMP_WORDS[1]} = "unwait" -a ${#COMP_WORDS[@]} -eq 3 ]; then
    COMPREPLY=($(compgen -W "$(eval $our_cmd listblockers | awk '{print $NF}' | tr -d '\r' | sort -n)" -- "${word}"));
fi
