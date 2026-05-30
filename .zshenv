# --- System & Wayland / Niri ---
export GDK_BACKEND=wayland
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock

# --- Zsh & XDG Base Directories ---
export ZDOTDIR="$HOME/.config/zsh"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export CARGO_HOME="$HOME/.local/share/cargo"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export DOTNET_CLI_HOME="$HOME/.local/share/dotnet"

# --- Master Toolchains ---
export TOOLS="$HOME/Coding/toolchains"

# --- SDKMAN! & Java (Required for Flutter/Android) ---
export SDKMAN_DIR="$HOME/.local/share/sdkman"
export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"

# --- Go Environment ---
export GOPATH="$TOOLS/go-workspace"

# --- Android SDK Configuration ---
export ANDROID_HOME="$TOOLS/android-sdk"
export ANDROID_USER_HOME="$TOOLS/.android"

# --- Final Consolidated PATH Construction ---
# System & User bins first
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"

# High priority ecosystem bins (Prepended)
export PATH="$JAVA_HOME/bin:$CARGO_HOME/bin:$PATH"

# Low priority ecosystem bins (Appended)
export PATH="$PATH:$HOME/.config/spicetify"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$TOOLS/flutter/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"
export PUB_CACHE="$HOME/.cache/dart/pub-cache"
export FLUTTER_CONFIG_DIR="$HOME/.cache/flutter-config"
export CHROME_EXECUTABLE="/usr/bin/brave-browser"
