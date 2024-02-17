# VSCode Extension Version Checker

A shell script to check the latest version of a vscode extension.
You can use this script to download the latest `vsix` file.

## Requiremetns

- bash
  - getopts
  - curl

## How to Use

### Setup

1. Clone this repository to your favorite directory:

   ```bash
   git clone https://github.com/hmasdev/vscode-ext-version.git
   ```

   The following steps assume that you have cloned this repository into the current folder.

2. Move to the directory created at the previous step:

   ```bash
   cd vscode-ext-version
   ```

### Run

The usage of this script is as follows:

```bash
vscev - VSCode Extension Version Checker
Usage: vscev [option] [extensionID]
Options:
  -d  Download the extension
  -h  Show help
```

#### Get the latest version

```bash
./vscev.sh ${publisher}.${extensionName}
```

For example, suppose that you want to know the latest version of `Github.copilot`, run

```bash
./vscev.sh Github.copilot
```

#### Get the latest `vsix`

```bash
./vscev.sh -d ${publisher}.${extensionName}
```

For example, suppose that you want to download the latest `vsix` of `Github.copilot`, run

```bash
./vscev.sh -d Github.copilot
```

Note that the latest `vsix` is downloaded into the working directory.

## Contribution

### Setup(dev)

1. Clone this repository to your favorite directory:

   ```bash
   git clone https://github.com/hmasdev/vscode-ext-version.git
   ```

   The following steps assume that you have cloned this repository into the current folder.

2. Move to the directory created at the previous step:

   ```bash
   cd vscode-ext-version
   ```

3. Install [`bats`](https://github.com/bats-core/bats-core), which is a test framework for `bash`, if you have not installed it yet:

   ```bash
   git clone https://github.com/bats-core/bats-core.git
   ./bats-core/install.sh ./bats
   export PATH=./bats/bin/:$PATH
   ```

   You can run `bats -v` to see if `bats` has been successfully installed.

   See [https://bats-core.readthedocs.io/en/stable/installation.html](https://bats-core.readthedocs.io/en/stable/installation.html) for detailed information.

### Development

1. Update `vscev.sh`;
2. test `vscev.sh` with `bats test_vscev.bats`;
3. commit the change, push it and created a pull-request.

## LISENCE

[MIT](./LICENSE)

## Authors

- [hmasdev](https://github.com/hmasdev)
