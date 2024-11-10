#!/bin/bash
for i in {1..3}; do sshpass -pvagrant ssh-copy-id -o "StrictHostKeyChecking no" vagrant@192.168.1.10$i; done
#for i in `for i in {1..3}; do vagrant ssh node$i -c "ip addr show eth0 | grep 'inet '"; done | awk '{print $2}' | cut -d'/' -f1`; do sshpass -pvagrant ssh-copy-id -o "StrictHostKeyChecking no" vagrant@$i; done
