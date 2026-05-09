
# LaTeX - TeX Live (latex-texlive)

Installation of TeX Live.

## Example Usage

```json
"features": {
    "ghcr.io/nkaaf/devcontainer-features/latex-texlive:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| year | TeX Live Live version to install. | string | 2026 |
| scheme | Scheme to install (bookpub since 2022). | string | minimal |
| packages | Space-seperated string of packages to install. | string | - |
| installDocumentation | Install documentation. | boolean | false |
| installSource | Install sources. | boolean | false |

## Customizations

### VS Code Extensions

- `James-Yu.latex-workshop`
- `tecosaur.latex-utilities`
- `ltex-plus.vscode-ltex-plus`
- `ExodiusStudios.comment-anchors`



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nkaaf/devcontainer-features/blob/main/src/latex-texlive/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
