# Contributing

## Issues

Issues are very valuable to this project.

  - Ideas are a valuable source of contributions others can make
  - Problems show where this project is lacking
  - With a question you show where contributors can improve the user
    experience

Thank you for creating them.

## Pull Requests

Pull requests are, a great way to get your ideas into this repository.

When deciding if I merge in a pull request I look at the following
things:

### Does it state intent

You should be clear which problem you're trying to solve with your
contribution.

For example:

> Deletes previous default branch

Doesn't tell me anything about why you're doing that

> Delete's previous default branch, as in large user accounts it can
> rapidly become unmanageable to delete them manually

Tells me the problem that you have found, and the pull request shows me
the action you have taken to solve it.

### Is it of good quality

  - Use `shellcheck` to find bugs
  - Use `shfmt -w -s .` to format the code

### Does it move this repository closer to my vision for the repository

The aim of this repository is:

  - Provide a quick way for people to change a lot of repositories to
    use "main" as their default branch
  - Be friendly to being embedded in larger, more complex scripts
  - Work on linux and mac systems with only their default packages

### Does it follow the contributor covenant

This repository has a [code of conduct](CODE_OF_CONDUCT.md), I will
remove things that do not respect it.
