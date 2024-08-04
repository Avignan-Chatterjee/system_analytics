#!/bin/bash
for i in {1..3}; do sshpass -pvagrant ssh-copy-id -o "StrictHostKeyChecking no" vagrant@192.168.1.10$i; done
