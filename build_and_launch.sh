#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# Quick build and launch script for aiconfigurator WebUI

set -e  # Exit on error

echo "========================================"
echo "aiconfigurator WebUI Build & Launch"
echo "========================================"
echo ""

# Check Python version
echo "1. Checking Python version..."
PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
REQUIRED_VERSION="3.9"
if [[ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]]; then
    echo "❌ Error: Python $REQUIRED_VERSION or higher is required (found $PYTHON_VERSION)"
    exit 1
fi
echo "✅ Python version: $PYTHON_VERSION"
echo ""

# Check if Git LFS is installed
echo "2. Checking Git LFS..."
if ! command -v git-lfs &> /dev/null; then
    echo "⚠️  Warning: Git LFS is not installed."
    echo "   Install it with: apt-get install git-lfs (Linux) or brew install git-lfs (macOS)"
    echo ""
else
    echo "✅ Git LFS is installed"
    echo ""
fi

# Pull LFS files
echo "3. Pulling Git LFS files..."
git lfs pull 2>&1 | tail -3
echo "✅ LFS files pulled"
echo ""

# Check if aiconfigurator is already installed
if python3 -c "import aiconfigurator" 2>/dev/null; then
    echo "4. aiconfigurator is already installed"
    CURRENT_VERSION=$(python3 -c "import aiconfigurator; print(aiconfigurator.__version__)")
    echo "   Current version: $CURRENT_VERSION"
    echo ""
else
    echo "4. Installing aiconfigurator with webapp support..."
    pip3 install -e ".[webapp]" | grep -E "(Successfully|Installing|Requirement)"
    echo "✅ Installation complete"
    echo ""
fi

# Verify installation
echo "5. Verifying installation..."
if aiconfigurator version &> /dev/null; then
    VERSION=$(aiconfigurator version)
    echo "✅ $VERSION installed successfully"
else
    echo "❌ Installation verification failed"
    exit 1
fi
echo ""

# Check if Gradio is installed
if python3 -c "import gradio" 2>/dev/null; then
    GRADIO_VERSION=$(python3 -c "import gradio; print(gradio.__version__)")
    echo "✅ Gradio $GRADIO_VERSION is installed"
else
    echo "❌ Gradio is not installed. Try running: pip3 install -e \".[webapp]\""
    exit 1
fi
echo ""

echo "========================================"
echo "Build Complete! 🎉"
echo "========================================"
echo ""
echo "To launch the WebUI, run:"
echo "  aiconfigurator webapp"
echo ""
echo "Or with custom options:"
echo "  aiconfigurator webapp --server-port 8080 --debug"
echo ""
echo "The webapp will be available at:"
echo "  http://127.0.0.1:7860"
echo ""

# Ask if user wants to launch now
read -p "Launch WebUI now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "Launching WebUI..."
    echo "Access it at: http://127.0.0.1:7860"
    echo "Press Ctrl+C to stop the server"
    echo ""
    aiconfigurator webapp
fi
