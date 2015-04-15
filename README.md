# git-shorty

This is a simple bash script that makes it easy to disable (and enable)
git aliases.

## Why would you want to do this?

Such a good question. Generally, you wouldn't. But if you're teaching
new programmers how to use git, it's easy to forget you're using
shortcuts that they may not have set up in their environments.

So when you type `git st` and they try to mimic you, they get this
lovely message in response:

```
git st
git: 'st' is not a git command. See 'git --help'.

Did you mean one of these?
	status
	ftp
	reset
	stage
	stash
	svn
```

Kind of a bummer. Avoid it with `git-shorty`!

## Installation

Download `git-shorty.sh` to wherever you keep your bash scripts. For the
sake of example, we'll use `~/scripts`.

Add an alias to your shell "rc file" (`.bashrc`, `.zshrc`, etc):

```bash
alias git-shorty='~/scripts/git-shorty.sh'
```

Remember to source the file. E.g.

```bash
source ~/.zshrc
```

### Assumptions

This script assumes that you have an aliases section in your global
`.gitconfig`. (If you don't, you can steal mine below).

It also assumes that one of your git aliases is `git st`. If it's not,
it's simple enough to switch the `aliases_are_enabled()` check to use
an alias you *do*  have. Just change `KNOWN_ALIAS` to something else.

```bash
KNOWN_ALIAS="anything"
```

## Usage

### Turn shortcuts (aliases) on:

```bash
$ git-shorty on
Turning aliases on...
Git aliases are enabled.
```

### Turn aliases off:

```bash
$ git-shorty off
Turning aliases off...
Git aliases are now disabled.
```

## Sample aliases

Here are all of the aliases from my personal `.gitconfig` if you're
looking for a starting place. :)

```
[alias]
  st = status
  ci = commit
  br = branch
  co = checkout
  df = diff
  dc = diff --cached
  latest = "for-each-ref --sort=-committerdate --format='%(committerdate:short) %(refname:short)'"
  lg = log -p
  lol = log --graph --decorate --pretty=oneline --abbrev-commit
  lola = log --graph --decorate --pretty=oneline --abbrev-commit --all
  ls = ls-files
  whoami = var GIT_COMMITTER_IDENT
  # Show files ignored by git:
  ign = ls-files -o -i --exclude-standard
  exclude = !sh -c 'echo "$1" >> .git/info/exclude' -
```
