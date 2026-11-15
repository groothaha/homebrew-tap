cask "ctxgraph" do
  version "0.1.0"
  sha256 "9c00208609898a712426b1a20bf59324e15d5d5c5a74ff04ec2e7fe4820681bd"

  url "https://github.com/groothaha/ctx-graph/releases/download/v#{version}/CtxGraph-#{version}.zip"
  name "CtxGraph"
  desc "Link Claude Code conversations so their context flows between them"
  homepage "https://github.com/groothaha/ctx-graph"

  depends_on macos: ">= :sonoma"

  app "CtxGraph.app"

  # Remove CtxGraph's hooks from ~/.claude/settings.json before deleting its scripts,
  # otherwise Claude Code would keep calling a missing file.
  zap script: {
        executable: "/bin/sh",
        args:       ["-c", 'f="$HOME/Library/Application Support/CtxGraph/bin/ctxgraph.py"; ' \
                           '[ -f "$f" ] && python3 -I "$f" uninstall-hooks; true'],
      },
      trash:  [
        "~/Library/Application Support/CtxGraph",
        "~/Library/Preferences/io.github.groothaha.ctxgraph.plist",
        "~/Library/Saved Application State/io.github.groothaha.ctxgraph.savedState",
      ]

  caveats <<~EOS
    CtxGraph is not notarized. The first time you open it, go to
    System Settings → Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine #{appdir}/CtxGraph.app

    To stop injecting context, turn off the hooks in CtxGraph → Settings → Claude Code
    (brew uninstall --zap also removes them).
  EOS
end
