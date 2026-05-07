
# Package Manager (package-manager)

Interacting with package managers.

## Example Usage

```json
"features": {
    "ghcr.io/nkaaf/devcontainer-features/package-manager:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| manager | Package Manager | string | system |
| packages | Space-seperated string of packages to install. Version constraints can be added in a manner that the package manager understands natively. | string | - |
| deleteCache | If applicable: Delete cached files. | boolean | false |
| upgradePackages | If applicable: Upgrade installed packages. | boolean | false |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nkaaf/devcontainer-features/blob/main/src/package-manager/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
