declare -a firewall_services=("nfs3" "nfs" "mountd" "rpc-bind")
for service in ${firewall_services[@]}; do
  firewall-cmd --permanent --zone=libvirt --add-service="$service"
done

declare -a firewall_ports=("2049/tcp" "2049/udp")
for port in ${firewall_ports[@]}; do
  firewall-cmd --permanent --zone=libvirt --add-port="$port"
done

firewall-cmd --reload
firewall-cmd --zone=libvirt --list-all
