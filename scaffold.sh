#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scaffold.sh [target_dir]
TARGET_DIR="${1:-.}"

mkdir -p "$TARGET_DIR"/{docs,scripts,examples}

# --- files ---
touch "$TARGET_DIR/README.md"
touch "$TARGET_DIR/docs/macos.md" \
      "$TARGET_DIR/docs/ubuntu.md" \
      "$TARGET_DIR/docs/windows.md"
touch "$TARGET_DIR/examples/env-template.yaml"

# --- script files with safe shebang if empty ---
for f in install.sh configure.sh verify.sh; do
  path="$TARGET_DIR/scripts/$f"
  if [[ ! -f "$path" ]]; then
    printf '#!/usr/bin/env bash\nset -euo pipefail\n\n# TODO: implement %s\n' "$f" > "$path"
  fi
done

# --- seed minimal content if empty ---
[[ -s "$TARGET_DIR/README.md" ]] || cat > "$TARGET_DIR/README.md" <<'EOF'
# devbase-access

Your access point to a clean, consistent, and lightweight development workspace.

## Structure
- docs/ — OS-specific guides (macOS, Ubuntu, Windows/WSL)
- scripts/ — install/configure/verify helpers
- examples/ — templates (env, configs)
EOF

[[ -s "$TARGET_DIR/docs/macos.md" ]] || cat > "$TARGET_DIR/docs/macos.md" <<'EOF'
# macOS Setup
> From first login to coding flow. Keep it reproducible and minimal.
EOF

[[ -s "$TARGET_DIR/docs/ubuntu.md" ]] || cat > "$TARGET_DIR/docs/ubuntu.md" <<'EOF'
# Ubuntu Setup
> Works for native Ubuntu and WSL. Document exact package versions when relevant.
EOF

[[ -s "$TARGET_DIR/docs/windows.md" ]] || cat > "$TARGET_DIR/docs/windows.md" <<'EOF'
# Windows (WSL) Setup
> Windows host + WSL (Ubuntu). Keep host steps and WSL steps clearly separated.
EOF

[[ -s "$TARGET_DIR/examples/env-template.yaml" ]] || cat > "$TARGET_DIR/examples/env-template.yaml" <<'EOF'
# Example environment template
APP_NAME: sample-app
ENV: dev
EOF

# make scripts executable
chmod +x "$TARGET_DIR"/scripts/*.sh

# pretty print result
command -v tree >/dev/null 2>&1 && tree -a "$TARGET_DIR" || {
  printf '\nCreated structure under %s:\n' "$TARGET_DIR"
  find "$TARGET_DIR" -maxdepth 2 -type d -printf '%p/\n'
  find "$TARGET_DIR" -maxdepth 2 -type f -printf '%p\n'
}
echo "Done."
