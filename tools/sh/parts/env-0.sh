#!/bin/ash

: "${INIT_LOG:="$PWD/tools/sh/log.sh"}"


# Env pre-checks

test -z "${BASH_ENV:-}" || {
  $INIT_LOG "warn" "" "Bash-Env specified" "$BASH_ENV"
  test -f "$BASH_ENV" || $INIT_LOG "warn" "" "No such Bash-Env script" "$BASH_ENV"
}

test -z "${CWD:-}" || {
  test "$CWD" = "$PWD" || {
    $INIT_LOG "error" "" "CWD =/= PWD" "$CWD"
    CWD=
  }
}


# Start env

: "${CWD:="$PWD"}"
: "${DEBUG:=}"
: "${OUT:="echo"}"
: "${TAB_C:="	"}"
#: "${TAB_C:="`printf '\t'`"}"
#: "${NL_C:="`printf '\r\n'`"}"


export scriptname=${scriptname:-"`basename "$0"`"}
export uname=${uname:-"`uname -s`"}


# Set GNU 'aliases' to try to build on Darwin/BSD

case "$uname" in
  Darwin )
      export gdate=${gdate:-"gdate"}
      export ggrep=${ggrep:-"ggrep"}
      export gsed=${gsed:-"gsed"}
      export gawk=${gawk:-"gawk"}
      export gstat=${gstat:-"gstat"}
      export guniq=${guniq:-"guniq"}
    ;;
  Linux )
      export gdate=${gdate:-"date"}
      export ggrep=${ggrep:-"grep"}
      export gsed=${gsed:-"sed"}
      export gawk=${gawk:-"awk"}
      export gstat=${gstat:-"stat"}
      export guniq=${guniq:-"uniq"}
    ;;
esac


: "${script_util:="$CWD/tools/sh"}"
: "${ci_util:="$CWD/tools/ci"}"
export script_util ci_util