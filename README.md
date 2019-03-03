# SuricataReputationBasedDetection
An introduction of how Suricata works. Start with Reputation based detection in Suricata

Usage: suricata -c suricata.yaml -r example.pcap

Struture:
update-mdl.sh: Bash script to maintain a reputation list based on the Malware Domain List.
suricata.yaml: a downsized version of a full YAML file. This is specifically used for this project.
local.rules: contain two rules raising an alert depending on the severity.
categories.txt: category for reputation list
