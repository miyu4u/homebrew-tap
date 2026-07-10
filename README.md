# miyu4u Homebrew Tap

Private Homebrew formulae maintained by `miyu4u`.

## Install

```bash
brew tap miyu4u/tap git@github.com:miyu4u/homebrew-tap.git
brew install miyu4u/tap/recurl
```

## Formulae

### `recurl`

Builds the private [`miyu4u/recurl`](https://github.com/miyu4u/recurl) source with Homebrew's `bun` dependency and installs the compiled `recurl` executable.

The formula fetches the source through GitHub SSH, so the installing user needs access to the private source repository. When `recurl`'s package version changes, update `Formula/recurl.rb`'s `version` and its test expectation in the same tap commit.
