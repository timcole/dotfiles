#!/bin/sh
CONTEXT="gke_social-blade-website_us-east1_production"
NAMESPACE="default"
SOCIALBLADE_EPOCH="1202446179000"

sb_help(){
  echo "Usage: sb <command> [options]\n"
  echo "Commands:"
  echo "  snow  Convert snowflake to timestamp"
  echo "  fwd   Port forward services"
  echo "  sh    Exec /bin/sh on a deployment"
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
    sudo -E kubefwd svc -x $CONTEXT -n $NAMESPACE
  else
    sudo -E kubefwd svc -x $CONTEXT -n $NAMESPACE -l "app in ($1)"
  fi
}

sb_sh() {
  if [[ $# -eq 0 ]] ; then
    echo 'missing selector (try: deployments/web)'
    exit 1
  fi

  if [[ $# -eq 1 ]] ; then
    kubectl exec --context $CONTEXT -n $NAMESPACE --stdin --tty $1 -- /bin/sh
  else
    kubectl exec --context $CONTEXT -n $NAMESPACE --container $2 --stdin --tty $1 -- /bin/sh
  fi
}

sb_log() {
  if [[ $# -eq 0 ]] ; then
    echo 'missing selector (try: deployments/web)'
    exit 1
  fi

  if [[ $# -eq 1 ]] ; then
    kubectl logs --context $CONTEXT -n $NAMESPACE -f $1 --all-containers --prefix --timestamps
  else
    kubectl logs --context $CONTEXT -n $NAMESPACE -f $1 --container $2 --timestamps
  fi
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
