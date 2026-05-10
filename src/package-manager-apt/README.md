
# Package Manager - apt (package-manager-apt)

Interacting with apt-like package managers.

## Example Usage

```json
"features": {
    "ghcr.io/nkaaf/devcontainer-features/package-manager-apt:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| manager | Package manager that is apt-like. | string | apt-get |
| packages | Space-seperated string of packages to install, versions constraints can also be applied. | string | - |
| deleteCache | Delete cached files. | boolean | false |
| upgradePackages | Upgrade installed packages. | boolean | false |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nkaaf/devcontainer-features/blob/main/src/package-manager-apt/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
