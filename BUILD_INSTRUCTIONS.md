<!-- 
SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# Building and Running aiconfigurator WebUI

This guide provides step-by-step instructions to build and run the aiconfigurator WebUI.

## Platform Support

aiconfigurator WebUI is compatible with:
- **Linux** (Ubuntu, Debian, RHEL, etc.)
- **macOS** (Intel and Apple Silicon)
- **Windows 10/11** (native or WSL2)

> **Note for Windows Users**: While the core Python package works on Windows, some advanced features and deployment scripts are optimized for Linux/Unix environments. For full functionality, we recommend using Windows Subsystem for Linux 2 (WSL2).

## Prerequisites

- Python 3.9 or later
- pip (or pip3)
- Git LFS (Large File Support)

## Where to Run the Build Scripts

**Important**: All build and launch commands should be run from the **root directory of the repository** (the directory containing `build_and_launch.sh` or `build_and_launch.bat`).

After cloning the repository:
```bash
cd aiconfigurator
```

Then run the build script from this location.

## Quick Start

### Using Automated Scripts

The automated scripts will handle all installation steps for you.

**On Linux/macOS:**
```bash
./build_and_launch.sh
```

**On Windows (Command Prompt):**
```cmd
build_and_launch.bat
```

**On Windows (PowerShell):**
```powershell
.\build_and_launch.bat
```

These scripts will automatically install dependencies and launch the WebUI.

## Manual Installation Steps

### 1. Install Git LFS

Git LFS is required to handle large database files in the repository.

**On Linux:**
```bash
apt-get install git-lfs
```

**On macOS:**
```bash
brew install git-lfs
```

**On Windows:**
Download and install from: https://git-lfs.github.com/

Or with Chocolatey:
```cmd
choco install git-lfs
```

Or with Winget:
```cmd
winget install GitHub.GitLFS
```

### 2. Clone the Repository

**On Linux/macOS:**
```bash
git clone https://github.com/ai-dynamo/aiconfigurator.git
cd aiconfigurator
```

**On Windows:**
```cmd
git clone https://github.com/ai-dynamo/aiconfigurator.git
cd aiconfigurator
```

### 3. Pull LFS Files

After cloning, pull the large files:

**On Linux/macOS:**
```bash
git lfs pull
```

**On Windows:**
```cmd
git lfs pull
```

### 4. Install aiconfigurator with WebApp Dependencies

Install the package in editable mode with webapp support:

**On Linux/macOS:**
```bash
pip3 install -e ".[webapp]"
```

**On Windows:**
```cmd
python -m pip install -e ".[webapp]"
```

This will install:
- The `aiconfigurator` package
- All runtime dependencies (numpy, pandas, matplotlib, etc.)
- Gradio 5.47.1 for the web interface
- Additional webapp dependencies

### 5. Verify Installation

Check that aiconfigurator is installed correctly:

**On Linux/macOS:**
```bash
aiconfigurator --help
aiconfigurator version
```

**On Windows:**
```cmd
aiconfigurator --help
aiconfigurator version
```

You should see the available commands including `webapp`.

## Running the WebUI

### Basic Launch

To start the WebUI with default settings:

**On Linux/macOS:**
```bash
aiconfigurator webapp
```

**On Windows:**
```cmd
aiconfigurator webapp
```

The webapp will be available at: **http://127.0.0.1:7860**

### Advanced Launch Options

You can customize the webapp launch with various options (same on all platforms):

```bash
# Change server address and port
aiconfigurator webapp --server-name 0.0.0.0 --server-port 8080

# Enable additional features
aiconfigurator webapp --enable-agg --enable-disagg-pd-ratio --enable-profiling

# Enable debug mode
aiconfigurator webapp --debug

# Enable experimental features
aiconfigurator webapp --experimental

# Use custom system data paths
aiconfigurator webapp --systems-paths default,/path/to/custom/systems
```

### Available Options

- `--server-name`: Server name/address (default: 0.0.0.0)
- `--server-port`: Server port (default: 7860)
- `--enable-agg`: Enable Agg tab
- `--enable-disagg-pd-ratio`: Enable Disagg PD Ratio tab
- `--enable-profiling`: Enable Profiling tab
- `--debug`: Enable debug mode with detailed logging
- `--experimental`: Enable experimental features
- `--systems-paths`: Custom systems search paths (comma-separated)

## Accessing the WebUI

Once the webapp is running, you can access it by:

1. Opening a web browser
2. Navigating to `http://127.0.0.1:7860` (or your configured address:port)

The WebUI provides an interactive interface for:
- Configuring LLM serving deployments
- Comparing aggregated vs disaggregated serving
- Visualizing Pareto frontiers for performance optimization
- Generating deployment configuration files

## Troubleshooting

### Port Already in Use

If port 7860 is already in use, specify a different port:
```bash
aiconfigurator webapp --server-port 8080
```

### Gradio Not Installed

If you see a warning about Gradio not being installed, ensure you installed with webapp dependencies:

**On Linux/macOS:**
```bash
pip3 install -e ".[webapp]"
```

**On Windows:**
```cmd
python -m pip install -e ".[webapp]"
```

### Missing LFS Files

If you encounter errors about missing data files, ensure Git LFS is installed and files are pulled:
```bash
git lfs install
git lfs pull
```

### Windows-Specific Issues

**Python not found:**
- Ensure Python is added to your system PATH during installation
- Try using `py` command instead: `py -m pip install -e ".[webapp]"`

**Permission errors during installation:**
- Run Command Prompt or PowerShell as Administrator
- Or use virtual environment: `python -m venv venv && venv\Scripts\activate`

**Script execution policy errors (PowerShell):**
- Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

**Long path issues:**
- Enable long paths in Windows: `git config --system core.longpaths true`
- Or clone to a shorter path like `C:\aic`

**For best compatibility on Windows**, we recommend using Windows Subsystem for Linux 2 (WSL2):
1. Install WSL2: https://docs.microsoft.com/en-us/windows/wsl/install
2. Install Ubuntu from Microsoft Store
3. Follow the Linux installation instructions inside WSL2

### Performance Database Warnings

Some warnings about missing data files (e.g., Mamba2, wideep MoE) are expected. These warnings indicate that certain advanced features are not available for specific hardware/framework combinations, but do not prevent the webapp from functioning.

## Additional Resources

- [README.md](README.md) - Main project documentation
- [DEVELOPMENT.md](DEVELOPMENT.md) - Development guide
- [CLI User Guide](docs/cli_user_guide.md) - Detailed CLI documentation
- [Advanced Tuning](docs/advanced_tuning.md) - Advanced configuration options

## Frequently Asked Questions (FAQ)

### Where should I run the build and launch script?

Run the build and launch script from the **root directory of the repository** (the folder that contains the script files).

**Steps:**
1. Clone the repository: `git clone https://github.com/ai-dynamo/aiconfigurator.git`
2. Navigate to the root: `cd aiconfigurator`
3. Run the script:
   - **Linux/macOS**: `./build_and_launch.sh`
   - **Windows**: `build_and_launch.bat`

### Can I run it in a Windows environment?

**Yes!** aiconfigurator fully supports Windows 10/11. You have two options:

**Option 1: Native Windows (Recommended for WebUI)**
- Use `build_and_launch.bat` script
- Or manually install: `python -m pip install -e ".[webapp]"`
- Then run: `aiconfigurator webapp`

**Option 2: WSL2 (Recommended for full deployment)**
- Install WSL2: https://docs.microsoft.com/en-us/windows/wsl/install
- Install Ubuntu from Microsoft Store
- Follow Linux instructions inside WSL2

> **Note**: The WebUI and CLI work perfectly on native Windows. However, some advanced deployment scripts and automation tools are optimized for Linux/Unix environments. For complete deployment workflows, we recommend WSL2.

### What if I don't have Git LFS installed?

You'll see a warning, but the script will continue. However, you may encounter errors about missing performance database files. Install Git LFS from:
- **Windows**: https://git-lfs.github.com/
- **Linux**: `apt-get install git-lfs` or `yum install git-lfs`
- **macOS**: `brew install git-lfs`

Then run: `git lfs pull` to download the required files.

### Can I use a different Python version?

Python 3.9 or later is required. The script will check your Python version and warn you if it's incompatible.

## Support

For issues and questions:
- GitHub Issues: https://github.com/ai-dynamo/aiconfigurator/issues
- Documentation: https://github.com/ai-dynamo/aiconfigurator
