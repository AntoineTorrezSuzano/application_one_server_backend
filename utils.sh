find_available_ports_in_range() {
    local start_port=$1
    local end_port=$2
    local count=$3
    local found_ports=()

    for port in $(seq "$start_port" "$end_port"); do
        if ! ss -tuln | grep -q ":$port "; then
            found_ports+=("$port")
            if [ ${#found_ports[@]} -ge "$count" ]; then
                break
            fi
        fi
    done
    echo "${found_ports[@]}"
}