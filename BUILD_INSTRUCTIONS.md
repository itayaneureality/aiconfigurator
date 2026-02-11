<!-- 
SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# Building and Running aiconfigurator WebUI

This guide provides step-by-step instructions to build and run the aiconfigurator WebUI.

## Prerequisites

- Python 3.9 or later
- pip3
- Git LFS (Large File Support)

## Installation Steps

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

### 2. Clone the Repository

```bash
git clone https://github.com/ai-dynamo/aiconfigurator.git
cd aiconfigurator
```

### 3. Pull LFS Files

After cloning, pull the large files:
```bash
git lfs pull
```

### 4. Install aiconfigurator with WebApp Dependencies

Install the package in editable mode with webapp support:
```bash
pip3 install -e ".[webapp]"
```

This will install:
- The `aiconfigurator` package
- All runtime dependencies (numpy, pandas, matplotlib, etc.)
- Gradio 5.47.1 for the web interface
- Additional webapp dependencies

### 5. Verify Installation

Check that aiconfigurator is installed correctly:
```bash
aiconfigurator --help
aiconfigurator version
```

You should see the available commands including `webapp`.

## Running the WebUI

### Basic Launch

To start the WebUI with default settings:
```bash
aiconfigurator webapp
```

The webapp will be available at: **http://127.0.0.1:7860**

### Advanced Launch Options

You can customize the webapp launch with various options:

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
```bash
pip3 install -e ".[webapp]"
```

### Missing LFS Files

If you encounter errors about missing data files, ensure Git LFS is installed and files are pulled:
```bash
git lfs install
git lfs pull
```

### Performance Database Warnings

Some warnings about missing data files (e.g., Mamba2, wideep MoE) are expected. These warnings indicate that certain advanced features are not available for specific hardware/framework combinations, but do not prevent the webapp from functioning.

## Additional Resources

- [README.md](README.md) - Main project documentation
- [DEVELOPMENT.md](DEVELOPMENT.md) - Development guide
- [CLI User Guide](docs/cli_user_guide.md) - Detailed CLI documentation
- [Advanced Tuning](docs/advanced_tuning.md) - Advanced configuration options

## Support

For issues and questions:
- GitHub Issues: https://github.com/ai-dynamo/aiconfigurator/issues
- Documentation: https://github.com/ai-dynamo/aiconfigurator
