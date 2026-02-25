#!/bin/bash
cd "$(dirname "$0")"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_DIR="logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/cluster_update_$TIMESTAMP.log"
echo "=== [$(date)] Cluster Update Started ===" | tee "$LOG_FILE"
ansible-playbook -i inventory/hosts.ini playbooks/system-update.yml >> "$LOG_FILE" 2>&1
echo "=== [$(date)] Cluster Update Completed ===" | tee -a "$LOG_FILE"
