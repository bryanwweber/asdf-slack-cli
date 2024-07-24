<div align="center">

# asdf-slack-cli [![Build](https://github.com/bryanwweber/asdf-slack-cli/actions/workflows/build.yml/badge.svg)](https://github.com/bryanwweber/asdf-slack-cli/actions/workflows/build.yml) [![Lint](https://github.com/bryanwweber/asdf-slack-cli/actions/workflows/lint.yml/badge.svg)](https://github.com/bryanwweber/asdf-slack-cli/actions/workflows/lint.yml)

[slack-cli](<TOOL HOMEPAGE>) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add slack-cli
# or
asdf plugin add slack-cli https://github.com/bryanwweber/asdf-slack-cli.git
```

slack-cli:

```shell
# Show all installable versions
asdf list-all slack-cli

# Install specific version
asdf install slack-cli latest

# Set a version globally (on your ~/.tool-versions file)
asdf global slack-cli latest

# Now slack-cli commands are available
slack --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/bryanwweber/asdf-slack-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Bryan Weber](https://github.com/bryanwweber/)
