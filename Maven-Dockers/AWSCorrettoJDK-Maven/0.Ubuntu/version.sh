# Example version script.
# Please choose one version or create your own

# Node.js: grep the version from a package.json file with jq
#jq -rM '.version' package.json

cat version.sh | grep "version=" version.sh | sed 's/.*=//' | grep -v /

version=19.10
