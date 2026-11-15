# groothaha/tap

Homebrew casks for my apps.

```sh
brew install --cask groothaha/tap/ctxgraph
```

| Cask | App |
|---|---|
| `ctxgraph` | [CtxGraph](https://github.com/groothaha/ctx-graph): link Claude Code conversations so their context flows between them (macOS 14+) |

CtxGraph is not notarized: after installing, open it once from System Settings → Privacy & Security → **Open Anyway**, or run `xattr -dr com.apple.quarantine /Applications/CtxGraph.app`.
