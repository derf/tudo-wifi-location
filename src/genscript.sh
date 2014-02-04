#!/bin/sh

cat <<'EOF'
#!/bin/sh

if [ "${1}" = -h -o "${1}" = --help ]; then
	echo "Usage: $0 <string containing a WLAN AP MAC (BSSID)>"
	exit 0
fi

case "${1}" in
EOF

while read mac location; do
	echo "\t*${mac}*) echo \"${location}\"; exit 0 ;;"
done

cat <<'EOF'
esac

exit 1
EOF
