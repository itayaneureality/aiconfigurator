<!-- 
SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# WebUI Setup - Quick Reference

This is a quick reference guide for setting up and running the aiconfigurator WebUI.

## TL;DR - Fast Setup

```bash
# Method 1: Use the automated script
./build_and_launch.sh

# Method 2: Manual setup
pip3 install -e ".[webapp]"
aiconfigurator webapp
```

Access the WebUI at: **http://127.0.0.1:7860**

---

## Detailed Guides

📖 **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - Complete build and installation guide  
✅ **[VERIFICATION.md](VERIFICATION.md)** - Build verification report and feature documentation  
📘 **[README.md](README.md)** - Main project documentation  

---

## Common Commands

### Installation
```bash
# Install with webapp support
pip3 install -e ".[webapp]"

# Verify installation
aiconfigurator version
```

### Launch WebUI
```bash
# Basic launch
aiconfigurator webapp

# Custom port
aiconfigurator webapp --server-port 8080

# Enable all features
aiconfigurator webapp --enable-agg --enable-disagg-pd-ratio --enable-profiling

# Debug mode
aiconfigurator webapp --debug
```

### Check Status
```bash
# Check if webapp is running
curl -I http://127.0.0.1:7860

# View processes
ps aux | grep "aiconfigurator webapp"
```

---

## System Requirements

- **Python:** 3.9 or later
- **Git LFS:** Required for performance database files
- **Memory:** ~4 GB RAM (for loading performance databases)
- **Disk Space:** ~2 GB (including dependencies and databases)

---

## Key Features

The WebUI provides:
- 🎯 Interactive configuration for LLM serving deployments
- 📊 Pareto frontier visualization for performance optimization  
- 🔄 Comparison of aggregated vs disaggregated serving
- 📁 Automatic generation of deployment configuration files
- 🖥️ Support for multiple GPU types (H100, H200, B200, GB200, A100)
- 🛠️ Multiple framework support (TensorRT-LLM, vLLM, SGLang)

---

## Support

- **Issues:** https://github.com/ai-dynamo/aiconfigurator/issues
- **Documentation:** See the `docs/` directory
- **CLI Guide:** [docs/cli_user_guide.md](docs/cli_user_guide.md)

---

## Files in This Repository

### New Documentation Files
- `BUILD_INSTRUCTIONS.md` - Comprehensive build guide
- `VERIFICATION.md` - Build verification and features
- `QUICKSTART.md` - This file (quick reference)

### Build Tools
- `build_and_launch.sh` - Automated setup script

### Project Documentation
- `README.md` - Main documentation
- `DEVELOPMENT.md` - Developer guide
- `CONTRIBUTING.md` - Contribution guidelines

---

**Last Updated:** 2026-02-11  
**Version:** 0.7.0
