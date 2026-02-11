<!-- 
SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# WebUI Build Verification Report

**Date:** 2026-02-11  
**Project:** aiconfigurator  
**Version:** 0.7.0

---

## Build Summary

The aiconfigurator project has been successfully built with WebUI (webapp) support. All necessary dependencies have been installed, and the webapp is confirmed to be functional.

## Installation Details

### Package Installation
- ✅ **Package Name:** aiconfigurator
- ✅ **Version:** 0.7.0
- ✅ **Installation Type:** Editable mode (`pip3 install -e ".[webapp]"`)
- ✅ **Python Version:** 3.12.3
- ✅ **Gradio Version:** 5.47.1

### Dependencies Installed
Key dependencies installed successfully:
- Gradio 5.47.1 (WebUI framework)
- FastAPI (API backend)
- NumPy 1.26.4 (numerical computations)
- Pandas 2.3.3 (data manipulation)
- Matplotlib 3.10.8 (plotting)
- Plotly 6.5.2 (interactive plots)
- Bokeh 3.8.2 (visualization)
- PyTorch dependencies for model configuration

### Git LFS Files
- ✅ Git LFS installed (version 3.7.1)
- ✅ Large performance database files pulled successfully

## WebUI Launch Verification

### Server Status
- ✅ **Server Process:** Running (PID: 4175)
- ✅ **Server Address:** 127.0.0.1:7860
- ✅ **Memory Usage:** ~3.4 GB (includes performance databases)
- ✅ **HTTP Status:** Responding with 200 OK

### Performance Database Loading
The webapp successfully loaded performance databases for multiple GPU systems:
- ✅ b200_sxm (TensorRT-LLM, SGLang)
- ✅ h200_sxm (TensorRT-LLM, vLLM, SGLang)
- ✅ h100_sxm (TensorRT-LLM, vLLM, SGLang)
- ✅ gb200_sxm (TensorRT-LLM)
- ✅ a100_sxm (TensorRT-LLM, vLLM)

### Startup Logs
```
2026-02-11 10:21:24 - Loading system databases...
2026-02-11 10:22:15 - HTTP Request: GET http://127.0.0.1:7860/gradio_api/startup-events "HTTP/1.1 200 OK"
2026-02-11 10:22:15 - HTTP Request: HEAD http://127.0.0.1:7860/ "HTTP/1.1 200 OK"
```

## Available Features

### WebUI Tabs
The webapp includes the following interactive tabs:
1. **README Tab** - Project documentation and getting started guide
2. **Static Tab** - Basic configuration and static analysis
3. **Agg Pareto Tab** - Aggregated serving Pareto frontier analysis
4. **Disagg Pareto Tab** - Disaggregated serving Pareto frontier analysis
5. **Pareto Comparison Tab** - Compare different configurations
6. **Optional Tabs** (can be enabled with flags):
   - Agg Tab (`--enable-agg`)
   - Disagg PD Ratio Tab (`--enable-disagg-pd-ratio`)
   - Profiling Tab (`--enable-profiling`)

### Supported Systems
- **GPU Types:** H100 SXM, H200 SXM, B200 SXM, GB200 SXM, A100 SXM
- **Frameworks:** TensorRT-LLM, vLLM, SGLang
- **Framework Versions:** Multiple versions supported per framework

### Supported Models
- GPT family
- LLAMA (2, 3)
- MOE models
- QWEN
- DEEPSEEK_V3
- Hugging Face models

## Access Instructions

### Basic Access
1. The WebUI is accessible at: **http://127.0.0.1:7860**
2. Open a web browser and navigate to the URL
3. The Gradio interface will load automatically

### Launching the WebUI

**Simple launch:**
```bash
aiconfigurator webapp
```

**With custom port:**
```bash
aiconfigurator webapp --server-port 8080
```

**With all features enabled:**
```bash
aiconfigurator webapp --enable-agg --enable-disagg-pd-ratio --enable-profiling
```

**With debug logging:**
```bash
aiconfigurator webapp --debug
```

## Documentation Created

### New Files Added
1. **BUILD_INSTRUCTIONS.md** - Comprehensive build and installation guide
2. **build_and_launch.sh** - Automated build and launch script

### Existing Documentation
- README.md - Main project documentation
- DEVELOPMENT.md - Developer setup guide
- docs/cli_user_guide.md - CLI usage documentation
- docs/advanced_tuning.md - Advanced configuration options
- docs/dynamo_deployment_guide.md - Deployment instructions

## Known Warnings

The following warnings are expected and do not affect functionality:

1. **Missing Mamba2 data files** - Mamba2 models are not yet supported on all systems
2. **Missing wideep MoE/All2All data files** - Some advanced MoE features are system-specific
3. **MoE EP size warnings** - Expected for certain MoE parallelism configurations

These warnings indicate optional features that are not available for all hardware/framework combinations but do not prevent the webapp from functioning correctly.

## Verification Commands

To verify the installation yourself:

```bash
# Check aiconfigurator version
aiconfigurator version

# Check Gradio installation
python3 -c "import gradio; print(f'Gradio {gradio.__version__}')"

# Check aiconfigurator installation
python3 -c "import aiconfigurator; print(f'aiconfigurator {aiconfigurator.__version__}')"

# Test webapp help
aiconfigurator webapp --help

# Check if webapp is running
curl -I http://127.0.0.1:7860
```

## Troubleshooting

If you encounter issues:

1. **Port already in use:** Use a different port with `--server-port`
2. **Gradio not found:** Reinstall with `pip3 install -e ".[webapp]"`
3. **Missing data files:** Run `git lfs pull` to download performance databases
4. **Import errors:** Ensure you're in the correct virtual environment

## Conclusion

✅ **Build Status:** SUCCESS  
✅ **WebUI Status:** OPERATIONAL  
✅ **Documentation:** COMPLETE  

The aiconfigurator project is now fully built and ready to run on WebUI. Users can follow the BUILD_INSTRUCTIONS.md guide or use the build_and_launch.sh script for quick setup.

---

**Verified by:** GitHub Copilot Build Agent  
**Environment:** Ubuntu Linux with Python 3.12.3  
**Build Time:** ~2 minutes (excluding dependency download time)
