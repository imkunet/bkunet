# usage: alias conda="lazyload conda __ll_conda"
# __ll_conda() { ... }
# ^^ put the slow loading code in there :)
lazyload() {
        LL_PROGRAM=$1
        LL_PRELOAD=$2
        shift 2
        LL_ARGS="$@"
        unalias $LL_PROGRAM
        eval $LL_PRELOAD
        eval $LL_PROGRAM "$@"
}
dns() { curl --http2 -sH "accept: application/dns-json" "https://1.1.1.1/dns-query?name=$1" | jq }
cfwhois() { curl --http2 -s "https://cfwho.com/api/v1/$1" | jq }
tre() {
	if [ -z ${1+x} ]; then eza --icons=always -T;
	else eza --icons=always -T -L $1; fi
}
edit() { R=$(realpath "${1:-.}");(builtin cd "$(dirname "$R")";$EDITOR "$R") }
