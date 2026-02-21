# 🚀 How to use this project

## Prerequisites

Before getting started, ensure you have the following installed:

- **Python** (3.11 or higher) - Check with `python --version`
- **Task** (Taskfile runner) - Install with `brew install go-task/tap/go-task` or follow [official installation](https://taskfile.dev/installation/)

## Quick Start

### 1. First-time Setup

When cloning the repository for the first time, you need to download the Taskfile dependencies:

```bash
task --yes
```

This command downloads all the external Taskfile dependencies defined in the main `Taskfile.yml`.

### 2. Environment Setup

Set up the development environment with all necessary dependencies:

```bash
task environment
```

This command:

- Sets up the Python virtual environment with `uv`
- Prepares the development environment

### 3. Project Setup

Install all project dependencies and configure the development environment:

```bash
task setup
```

This command:

- Creates `.env` file from `.env.example` if it doesn't exist
- Installs Python dependencies with `uv`
- Sets up pre-commit hooks
- Configures Git hooks
