
#!/usr/bin/env bash

set -euo pipefail

echo "Installing Solana development environment..."

# Solana toolchain
curl --proto '=https' --tlsv1.2 -sSfL \
  https://solana-install.solana.workers.dev | bash

# Ensure tools are available in this shell
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Install project dependencies when package.json exists
if [ -f package.json ]; then
  echo "Installing Node.js dependencies..."
  pnpm install
fi

echo ""
echo "========== VERSIONS =========="

rustc --version
cargo --version
solana --version
anchor --version
node --version
pnpm --version

echo "================================"
echo "Solana environment ready!"
