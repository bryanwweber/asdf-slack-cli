#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="slack-cli"
TOOL_TEST="slack --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	# Copied from the Slack CLI installation script at https://downloads.slack-edge.com/slack-cli/install.sh
	curl --silent "https://api.slack.com/slackcli/metadata.json" | grep -o '"version": "[^"]*' | grep -o '[^"]*$'
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	if [ "$(uname)" == "Darwin" ]; then
		url="https://downloads.slack-edge.com/slack-cli/slack_cli_${version}_macOS_64-bit.tar.gz"
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		url="https://downloads.slack-edge.com/slack-cli/slack_cli_${version}_linux_64-bit.tar.gz"
	fi

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
