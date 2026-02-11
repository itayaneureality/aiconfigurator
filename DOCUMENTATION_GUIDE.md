<!-- 
SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# Documentation Guide

This guide helps you navigate the aiconfigurator documentation.

## Documentation Structure

```
aiconfigurator/
├── README.md                    # Main project overview and getting started
├── QUICKSTART.md               # Quick reference for WebUI setup (NEW)
├── BUILD_INSTRUCTIONS.md       # Detailed build guide for WebUI (NEW)
├── VERIFICATION.md             # Build verification report (NEW)
├── build_and_launch.sh         # Automated setup script (NEW)
├── DEVELOPMENT.md              # Developer setup and workflow
├── CONTRIBUTING.md             # Contribution guidelines
├── CODE_OF_CONDUCT.md          # Community standards
├── SECURITY.md                 # Security policies
└── docs/
    ├── cli_user_guide.md       # Detailed CLI usage
    ├── advanced_tuning.md      # Advanced configuration
    ├── dynamo_deployment_guide.md  # Deployment instructions
    └── add_a_new_model.md      # Model addition guide
```

## Quick Navigation

### I want to...

#### 🚀 Build and run the WebUI
→ Start with **[QUICKSTART.md](QUICKSTART.md)** or use `./build_and_launch.sh`  
→ For details: **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)**

#### 📖 Learn about the project
→ Read **[README.md](README.md)**

#### 💻 Use the CLI
→ See **[docs/cli_user_guide.md](docs/cli_user_guide.md)**

#### 🛠️ Develop or contribute
→ Follow **[DEVELOPMENT.md](DEVELOPMENT.md)** and **[CONTRIBUTING.md](CONTRIBUTING.md)**

#### 🔧 Advanced configuration
→ Check **[docs/advanced_tuning.md](docs/advanced_tuning.md)**

#### 🚢 Deploy to production
→ Read **[docs/dynamo_deployment_guide.md](docs/dynamo_deployment_guide.md)**

#### ➕ Add a new model
→ Follow **[docs/add_a_new_model.md](docs/add_a_new_model.md)**

#### ✅ Verify the build
→ See **[VERIFICATION.md](VERIFICATION.md)**

---

## Documentation for Different Users

### For End Users
1. **[QUICKSTART.md](QUICKSTART.md)** - Get started quickly
2. **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - Detailed setup
3. **[README.md](README.md)** - Project overview
4. **[docs/cli_user_guide.md](docs/cli_user_guide.md)** - Using the CLI

### For Developers
1. **[DEVELOPMENT.md](DEVELOPMENT.md)** - Development environment setup
2. **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute
3. **[docs/add_a_new_model.md](docs/add_a_new_model.md)** - Extending functionality

### For DevOps/SRE
1. **[docs/dynamo_deployment_guide.md](docs/dynamo_deployment_guide.md)** - Production deployment
2. **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - Build and installation
3. **[README.md](README.md)** - Docker build instructions

---

## New Files Added for WebUI Support

The following files were added to help users build and run the WebUI:

### 📄 QUICKSTART.md
- **Purpose:** Quick reference for getting started with WebUI
- **Audience:** Users who want to get started immediately
- **Content:** TL;DR commands, common operations, key features

### 📄 BUILD_INSTRUCTIONS.md  
- **Purpose:** Comprehensive guide for building and running the WebUI
- **Audience:** Users setting up aiconfigurator for the first time
- **Content:** Step-by-step installation, configuration options, troubleshooting

### 📄 VERIFICATION.md
- **Purpose:** Document successful build and features
- **Audience:** Users who want to verify their installation
- **Content:** Installation details, verification steps, available features

### 🔧 build_and_launch.sh
- **Purpose:** Automated build and launch script
- **Audience:** Users who want automated setup
- **Content:** Bash script that checks requirements, installs dependencies, launches webapp

---

## Recommended Reading Order

### For First-Time Users
1. 📖 **README.md** - Understand what aiconfigurator does
2. 🚀 **QUICKSTART.md** - Get started with WebUI quickly
3. 📘 **BUILD_INSTRUCTIONS.md** - Detailed setup if needed
4. ✅ **VERIFICATION.md** - Verify your installation

### For CLI Users
1. 📖 **README.md** - Project overview
2. 📘 **docs/cli_user_guide.md** - Detailed CLI guide
3. 🔧 **docs/advanced_tuning.md** - Advanced features

### For Developers
1. 📖 **README.md** - Project overview
2. 💻 **DEVELOPMENT.md** - Development setup
3. 🤝 **CONTRIBUTING.md** - Contribution process
4. 📝 **CODE_OF_CONDUCT.md** - Community guidelines

---

## Getting Help

If you can't find what you're looking for:

1. Check the **[README.md](README.md)** for general information
2. Search the **[docs/](docs/)** directory for specific topics
3. Open an issue at https://github.com/ai-dynamo/aiconfigurator/issues
4. Read the inline help: `aiconfigurator --help` or `aiconfigurator webapp --help`

---

**Last Updated:** 2026-02-11
