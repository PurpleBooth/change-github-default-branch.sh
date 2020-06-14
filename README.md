# change-github-default-branch.sh

``` shell
$ curl --silent --location --output - \
    https://raw.githubusercontent.com/PurpleBooth/change-github-default-branch.sh/main/change-github-default-branch.sh | \
    bash -s --
USAGE: bash -t GITHUB_TOKEN -d DEFAULT_BRANCH_NAME USER/REPO

OPTIONS
  -t          Default: GITHUB_TOKEN environment variable     The GitHub token to use
  -d          Default: main                                  The new branch
ARGS
  USER/REPO   Required  A github repository, for example purplebooth/readable-name-generator

You can create a GitHub token (it needs at least repo:public_repo, or repo on private repositores) from https://github.com/settings/tokens/new
```

A more full examle:

``` shell
curl --silent --location --output - https://raw.githubusercontent.com/PurpleBooth/change-github-default-branch.sh/main/change-github-default-branch.sh | \
    bash -s -- \
    -t YOURGITHUBTOKENAAAAAA -d primary example/repo
```

Alternatively, to avoid curling to bash you can run

``` shell
curl -LO https://raw.githubusercontent.com/PurpleBooth/change-github-default-branch.sh/main/change-github-default-branch.sh
chmod +x change-github-default-branch.sh
./change-github-default-branch.sh -t YOURGITHUBTOKENAAAAAA -d primary example/repo
```

Does not delete the old default branch, or change where pull requests
are based from, incase something breaks.

## Thanks

  - [mfcrocker](https://github.com/mfcrocker) for ubuntu fixes.
  - [greg-1-anderson](https://github.com/greg-1-anderson) for spotting a
    couple of bugs
  - [Lewiscowles1986](https://github.com/Lewiscowles1986) for letting
    you change the default branch if your branch isn't the one git sets
