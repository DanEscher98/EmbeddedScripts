# Defined in /tmp/fish.KFVlQd/del_vm.fish @ line 2
function del_vm --argument name
    virsh destroy $name 2>/dev/null
    virsh undefine $name --remove-all-storage
    virsh pool-refresh default
    if test -d .vagrant
        vagrant destroy
    end
end
