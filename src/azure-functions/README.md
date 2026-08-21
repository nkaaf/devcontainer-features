
# Azure Functions Development Tools (azure-functions)

Installs tools that are recommended for the development of Azure Function Apps.

## Example Usage

```json
"features": {
    "ghcr.io/nkaaf/devcontainer-features/azure-functions:0": {}
}
```



## Customizations

### VS Code Extensions

- `ms-azuretools.vscode-azurefunctions`
- `ms-azuretools.vscode-azure-functions-web`
- `ms-azuretools.vscode-azure-functions-remote-web`

# Notes

## Supported distributions

This feature supports the following Debian/Ubuntu versions:

| Distribution | Versions |
|---|---|
| Debian | 8–13 |
| Ubuntu | 16.04, 17.04, 18.04, 18.10, 19.04, 20.04, 22.04, 24.04 |

## Telemetry

Azure Functions Core Tools telemetry opt-out is **enabled by default**.

To enable telemetry, set the following in `devcontainer.json`:

```json
{
  "containerEnv": {
    "FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT": "false"
  }
}
```

"0" can also be used instead of "false".


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nkaaf/devcontainer-features/blob/main/src/azure-functions/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
