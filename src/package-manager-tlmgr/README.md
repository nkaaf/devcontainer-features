
# Package Manager - tlmgr (package-manager-tlmgr)

Interacting with tlmgr, the TeX Live package manager.

## Example Usage

```json
"features": {
    "ghcr.io/nkaaf/devcontainer-features/package-manager-tlmgr:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| packages | Space-seperated string of packages to install. | string | - |
| upgradePackages | Upgrade installed packages, this also upgrades 'tlmgr' automatically. | boolean | false |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nkaaf/devcontainer-features/blob/main/src/package-manager-tlmgr/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
