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
