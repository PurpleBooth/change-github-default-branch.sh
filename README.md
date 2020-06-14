# change-github-default-branch.sh

Usage

    change-github-default-branch.sh "$GITHUB_TOKEN" PurpleBooth/homebrew-repo

Does not delete the old default branch, or change where pull requests
are based from, incase something breaks.

## Thanks

  - [mfcrocker](https://github.com/mfcrocker) for ubuntu fixes.
  - [greg-1-anderson](https://github.com/greg-1-anderson) for spotting a
    couple of bugs
  - [Lewiscowles1986](https://github.com/Lewiscowles1986) for letting
    you change the default branch if your branch isn't the one git sets
