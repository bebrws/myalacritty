alias c1="awk '{print \$1}'"
alias c2="awk '{print \$2}'"
alias c3="awk '{print \$3}'"
alias c4="awk '{print \$4}'"
alias c5="awk '{print \$5}'"
alias c6="awk '{print \$6}'"
alias c7="awk '{print \$7}'"
alias c8="awk '{print \$8}'"
alias c9="awk '{print \$9}'"
alias c10="awk '{print \$10}'"


alias k='kubectl '
alias klogs='kail -n default '
alias klog='stern -n default '

#brew tap thecasualcoder/stable
#brew install kube-fzf

alias kcdp='describepod '
alias kcfp='findpod '

function kebash() {
  kubectl exec --stdin --tty $@ -- /bin/bash
}

function kesh() {
  kubectl exec --stdin --tty $@ -- /bin/sh
}

alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgsa='kubectl get services --all-namespaces'
alias klogs='kubectl get pods -o name | fzf --preview="kubectl logs {} | tail -20" --preview-window=up:80%'

function kListContainersInPod() {
  for pod in $( kgp | ignoreFirstLine | c1 ); do 
    echo "\nPOD: $pod"
    kubectl get pod $pod -o=jsonpath='{.spec.containers[*].name}'; 
    echo "\n"
  done
}


function kLogAllContainersInPod() {
  for container in $(kubectl get pod $1 -o=jsonpath='{.spec.containers[*].name}'); do
    kubectl logs $1 --container $container | tail -20
  done
}

# function kLogAllContainersInPod() { for container in $(kubectl get pod $1 -o=jsonpath='{.spec.containers[*].name}'); do kubectl logs $1 --container $container | tail -20; done }

function kLogsAllContainers() {
  kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\n"}' | fzf --preview='echo {} | xargs kubectl logs -n'  --preview-window=up:80% | xargs kubectl logs -n
}
alias klogs=kLogsAllContainers

function kLogsContainer() {
  kubectl get pods -o name | fzf --preview="kubectl logs {} --container $1 | tail -20" --preview-window=up:80%
}

# function kShContainer() {
#   export KPOD=$(kubectl get pods -o name | fzf)
#   kubectl exec --stdin --tty $KPOD --container $1 -- /bin/sh
# }

function kexSHContainer() {
  kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\n"}' | fzf | xargs -o -n 2 bash -c 'kubectl exec -n "$0" --stdin --tty "$1" --container node -- /bin/sh' 
}
function kexSH() {
  kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\n"}' | fzf | xargs -o -n 2 bash -c 'kubectl exec -n "$0" --stdin --tty "$1" -- /bin/sh' 
}


function kexBASHContainer() {
  kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\n"}' | fzf | xargs -o -n 2 bash -c 'kubectl exec -n "$0" --stdin --tty "$1" --container node -- /bin/bash' 
}
function kexBASH() {
  kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\n"}' | fzf | xargs -o -n 2 bash -c 'kubectl exec -n "$0" --stdin --tty "$1" -- /bin/bash' 
}





function kBashContainer() {
  export KPOD=$(kubectl get pods -o name | fzf)
  kubectl exec --stdin --tty $KPOD --container $1 -- /bin/bash
}


function getAllPodsNamespaceAndName() {
  kubectl get pods --all-namespaces -o jsonpath='{range .items[*]} {.metadata.namespace}   {.metadata.name} {"\n"}' 
}

function kdpods() {
  getAllPodsNamespaceAndName | fzf --preview='echo {} | xargs kubectl describe pod -n' | xargs kubectl describe pod -n
}
function kdelpods() {
  getAllPodsNamespaceAndName | fzf --preview='echo {} | xargs kubectl describe pod -n' | xargs kubectl delete pod -n
}

function getAllServicesNamespaceAndName() {
  kubectl get services --all-namespaces -o jsonpath='{range .items[*]} {.metadata.namespace}   {.metadata.name} {"\n"}' 
}

function kdservices() {
  getAllServicesNamespaceAndName | fzf --preview='echo {} | xargs kubectl describe service -n' | xargs kubectl describe service -n
}

function kdelservice() {
  getAllServicesNamespaceAndName | fzf --preview='echo {} | xargs kubectl describe service -n' | xargs kubectl delete service -n
}

alias  kg='kubectl get '
# alias -g kd='kubectl describe '
function kd() {
  kubectl get $1 --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\n"}' | fzf --preview='echo '"'"'{}'"'"' | xargs kubectl describe pod -n' | xargs kubectl describe $1 -n
}


alias  kdel='kubectl delete '

alias kgs='kubectl get services '
alias kgd='kubectl get deployments '

function kgevents() {  kubectl get events --sort-by='.metadata.creationTimestamp'  }
alias kgev=kgevents


