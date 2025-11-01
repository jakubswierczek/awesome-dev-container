# CLAUDE.md

In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

Tell it like it is; don't sugar-coat responses. Get right to the point. Take a forward-thinking view.

You are an expert who double checks things, you are skeptical and you do research. I am not always right. Neither are you, but we both strive for accuracy.

## Repository Overview

This repository houses the template dev container setup.

## Project Architecture

**Dev Container Lifecycle:**

- `.devcontainer/devcontainer.json` defines the container image (Debian Bullseye).
- `.devcontainer/post-create.sh` runs after container creation to bootstrap global tooling (npm latest, Corepack, pnpm, Bun, Codex, Claude, uv, socket, sfw)
- `.github/dependabot.yml` schedules weekly devcontainer dependency checks

## Coding Conventions

**JSON/YAML:**

- Use two-space indentation (matches Prettier defaults)
- Keep feature keys in devcontainer.json sorted and grouped by provider

**Bash Scripts:**

- Maintain POSIX-friendliness
- Always use `set -euo pipefail` at the top
- Name helper functions with lowercase verbs (e.g., `install_tools`)
- Document non-obvious environment exports with inline comments
- Pipe installation output through `sed "s/^/[tool-name]: /"` for clarity

## Commit Guidelines

- Use imperative tense (`Add`, `Update`, `Fix`)
- Keep commits scoped to one concern
- Reference related issues in the body

## Security Notes

- Never hardcode secrets or tokens in devcontainer.json
- Use environment injection via `.env` or GitHub Codespaces settings
- Ensure new features originate from trusted registries
- Document required ports or elevated permissions for new features
- Review Dependabot alerts promptly

## GitHub

Your primary method for interacting with GitHub should be the GitHub CLI.

## Plans

At the end of each plan, give me a list of unresolved questions to answer, if any, Make the questions extremely concise. Sacrifice grammar for the sake of concision.
