#### Download Nordic Theme Debian
# wget https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTYzMjk1Mjg1MywidSI6bnVsbCwibHQiOiJkb3dubG9hZCIsInMiOiJiMDY3YTc4YTUyZDVjMDY1MzE3ODQwZjk0NmMwNDE0YjU3ZDVjM2VlMDFkNDhlN2MwODQwZTk2NGZlZjVlZGRhZWYyMmMxMWE2YjMxMTYxNmQ3ZWUwMDdhNTA2NjQ2ZmZlMThmYWI5MzY5YmFiN2VmNTllOGZiYWJmZWY1M2Q4ZCIsInQiOjE2NDU0MTg2MzEsInN0ZnAiOiIyMTFhYTMzZTViZjNkNmZkOWFjNWM2YjdiZDMzMDM1NyIsInN0aXAiOiIxODAuMjUzLjg3LjkyIn0.-_UCS5nA-neANhRektgXqsmcaaRXspMGygTME4J_vw0/Nordic.tar.xz
# tar -xf Nordic.tar.xz.1
# cp /usr/share/sddm/themes/Nordic

# Setup SDDM theme
cat <<EOF > /etc/sddm.conf
[Theme]
Current=Nordic
EOF