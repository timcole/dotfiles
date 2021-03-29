#!/bin/sh
NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}')

sb_help(){
  echo "Usage: sb <command> [options]\n"
  echo "Commands:"
  echo "  snow  Convert snowflake to timestamp"
  echo "  fwd   Port forward services"
}

sb_snow() {
  if [[ $# -eq 0 ]] ; then
    echo 'missing snowflake'
    exit 1
  fi

  epoch=$(($1 >> 23 + $SOCIALBLADE_EPOCH))
  date -r $(($epoch/1000))
}

sb_fwd() {
  if [[ $# -eq 0 ]] ; then
    sudo -E kubefwd svc -n $NAMESPACE
  else
    sudo -E kubefwd svc -n $NAMESPACE -l "app in ($1)"
  fi
}

sb_log() {
  if [[ $# -eq 0 ]] ; then
    echo 'missing service name'
    exit 1
  fi

  kubectl logs -n $NAMESPACE -f -l "app in ($1)" --prefix --timestamps --all-containers
}

sub=$1
case $sub in
  "" | "-h" | "--help")
    sb_help
    ;;
  *)
    shift
    sb_${sub} $@
    if [ $? = 127 ]; then
      echo "Error: '$sub' is not a known command.\n" >&2
      sb_help
      exit 1
    fi
    ;;
esac
