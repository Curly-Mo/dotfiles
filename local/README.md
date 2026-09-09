# local config

- Machine-specific shell environment: Java toolchain, build tools, monorepo helpers
- Auto-detects and runs Maven, SBT, or Bazel builds with a single `build` command
- Monorepo worktree management aliases and completions
- VPN, gRPC, and project-specific shortcuts

## Files

- **`.localrc` / `.zsh_localrc`**
  - Sources a secrets file for credentials
  - `JAVA_HOME` set via jenv (Java 11)
  - `SBT_OPTS` with 4GB heap, G1GC, no assertions
  - Adds coursier, yarn, linuxbrew, and JetBrains Toolbox to `$PATH`
  - `MAVEN_OPTS` with 4GB heap
  - `fast-mvn` alias skips tests, enforcer, and checkstyle
  - `mvn-repl` launches an Ammonite REPL using Maven classpath
  - `build()` function auto-detects project type (Maven/SBT/Bazel) and runs with shorthand args (`-s` = skip tests, `-r` = run, etc.)
  - `run()` / `service_run()` / `jib()` helper functions for service lifecycle
  - `mono` / `mono1` / `mono2` / `wt` / `addtree` for git worktree management with tab completions
  - `baz` / `baztarget` / `bazdots` Bazel wrapper functions
  - VPN connection helpers
  - `jhurl` / `jhq` aliases for authenticated HTTP/gRPC requests
  - `pip` / `pipx` wrappers (`spotinstall`) for corporate PyPI
  - `userdata()` gRPC user lookup
  - Project directory `cd` aliases
  - `ghr` alias for GitHub Enterprise CLI

## Docs

- [jenv](https://www.jenv.be/)
- [GNU Stow](https://www.gnu.org/software/stow/)
