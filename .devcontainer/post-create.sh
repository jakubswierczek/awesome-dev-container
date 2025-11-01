#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Installing homebrew..."
curl -LsSf https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash 2>&1 | sed "s/^/[homebrew]: /"
echo >> /home/vscode/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/vscode/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "🚀 Installing global packages..."
npm install -g npm@latest 2>&1 | sed "s/^/[npm]: /"
corepack enable

npm install -g socket 2>&1 | sed "s/^/[socket]: /"
npm install -g sfw 2>&1 | sed "s/^/[sfw]: /"

brew install oven-sh/bun/bun 2>&1 | sed "s/^/[bun]: /"
brew install codex 2>&1 | sed "s/^/[codex]: /"
brew install --cask claude-code 2>&1 | sed "s/^/[claude-code]: /"

curl -LsSf https://astral.sh/uv/install.sh | sh 2>&1 | sed "s/^/[uv]: /"
export COREPACK_ENABLE_AUTO_PIN=0
yes | pnpm config set store-dir /home/node/.local/share/pnpm || true
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "✅ Global packages installed"

echo "🎉 Development environment setup complete!"

