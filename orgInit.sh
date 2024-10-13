sf demoutil org create scratch -f config/project-scratch-def.json -d 5 -s -p concierge -e work.shop

sf package install --package 04t4P000002qm6f --noprompt --wait 50
sf data update record -s User -w "Name='User User'" -v "UserPermissionsKnowledgeUser=true"

sf project deploy start
sf org assign permset -n solutions
sf data upsert bulk -f data/Knowledge__kav.csv -i id -s Knowledge__kav --wait 30
# sfdx automig:load -d data

sf apex run -f scripts/conciergeSetup.cls

sf automig load -d data2
sf org open
