# Example version script.
# Please choose one version or create your own

# Node.js: grep the version from a package.json file with jq
#jq -rM '.version' package.json

cat version.sh | grep version | grep '\([0-9.]\+\.\?\)\{3\}' -o

version=12.0.1
