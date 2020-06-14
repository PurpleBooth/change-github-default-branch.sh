#!/usr/bin/env bash

set -euo pipefail

print_help() {
	echo "USAGE: $0 -t GITHUB_TOKEN -d DEFAULT_BRANCH_NAME USER/REPO" 1>&2
	echo
	echo "OPTIONS"
	echo '  -t          Default: GITHUB_TOKEN environment variable     The GitHub token to use'
	echo "  -d          Default: main                                  The new branch"

	echo "ARGS"
	echo "  USER/REPO   Required  A github repository, for example purplebooth/readable-name-generator"
	echo
	echo "You can create a GitHub token (it needs at least repo:public_repo, or repo on private repositores) from https://github.com/settings/tokens/new"
	exit 1
}

DEFAULT_BRANCH_NAME="main"

while getopts "t:d:" FLAG; do
	case "$FLAG" in
	t) GITHUB_TOKEN=$OPTARG ;;
	d) DEFAULT_BRANCH_NAME=$OPTARG ;;
	*) print_help ;;
	esac
done

REPO="${*:OPTIND}"

if [ -z "${REPO:-}" ] || [ -z "${DEFAULT_BRANCH_NAME:-}" ] || [ -z "${GITHUB_TOKEN:-}" ]; then
	print_help
fi

CURRENT_DEFAULT_BRANCH="$(
	curl \
		--silent \
		--header "Authorization: token $GITHUB_TOKEN" \
		--header "Content-Type: application/json" \
		"https://api.github.com/repos/$REPO" |
		python -c 'import sys, json; print(json.load(sys.stdin)["default_branch"])'
)"

LATEST_SHA="$(
	curl \
		--silent \
		-X GET \
		--header "Authorization: token $GITHUB_TOKEN" \
		--location \
		--output - \
		"https://api.github.com/repos/$REPO/git/refs/heads/$CURRENT_DEFAULT_BRANCH" |
		python -c 'import sys, json; print(json.load(sys.stdin)["object"]["sha"])'
)"
curl \
	--silent \
	-X POST \
	--header "Authorization: token $GITHUB_TOKEN" \
	--header "Content-Type: application/json" \
	-d "{ \"ref\": \"refs/heads/$DEFAULT_BRANCH_NAME\", \"sha\": \"$LATEST_SHA\" }" \
	"https://api.github.com/repos/$REPO/git/refs"

curl \
	--silent \
	-X PATCH \
	--header "Authorization: token $GITHUB_TOKEN" \
	--header "Content-Type: application/json" \
	--data "{\"default_branch\": \"$DEFAULT_BRANCH_NAME\" }" \
	"https://api.github.com/repos/$REPO"
