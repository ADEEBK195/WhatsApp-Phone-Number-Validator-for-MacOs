# 🍏 OutGrow | WhatsApp Phone Number Validator (macOS Edition)

<div align="center">
  <img src="screenshots/app_logo.png" alt="OutGrow Logo" width="160" />
  <br/>
  <p><strong>Enterprise-grade automated WhatsApp phone number verification & list hygiene platform built natively for macOS.</strong></p>

  [![Platform: macOS](https://img.shields.io/badge/Platform-macOS%20(Apple%20Silicon%20%26%20Intel)-black?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/)
  [![Framework: Electron](https://img.shields.io/badge/Framework-Electron-47848F?style=for-the-badge&logo=electron&logoColor=white)](https://www.electronjs.org/)
  [![Engine: Playwright](https://img.shields.io/badge/Engine-Playwright-2EAD33?style=for-the-badge&logo=playwright&logoColor=white)](https://playwright.dev/)
  [![Runtime: Node.js](https://img.shields.io/badge/Runtime-Node.js%2020+-339933?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org/)
  [![Architecture: SSE Streaming](https://img.shields.io/badge/Architecture-Event--Driven%20SSE-FF6C37?style=for-the-badge)](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events)
  [![Status: Production Ready](https://img.shields.io/badge/Release-v1.0.0%20(Universal%20DMG)-blueviolet?style=for-the-badge)](#-download--installation-for-macos)
</div>

---

## 📌 Executive Summary

**OutGrow WhatsApp Validator** is an automated desktop application engineered for high-throughput contact database verification, marketing list sanitization, and customer onboarding hygiene on **macOS**. 

By orchestrating headless browser automation via **Playwright** behind a sandboxed **Electron** desktop interface, the tool verifies whether lists of international phone numbers are registered on WhatsApp—without risking account flags or relying on expensive third-party APIs. It runs universally across both **Apple Silicon (M1/M2/M3/M4)** and **Intel** Macs.

> **Note**: This repository serves as the official portfolio showcase and binary release portal. The underlying automation engine and proprietary heuristic algorithms are maintained in a private repository.

---

## 📸 Application Showcase

### 1. Live Real-Time Dashboard
*Dark Graphite & Emerald UI displaying real-time progress metrics, total numbers, valid/invalid counters, randomized delay pacing, and searchable result stream.*

![Dashboard Preview](screenshots/dashboard.png)

---

### 2. In-App QR Code Authentication
*Seamless session linking directly inside the app shell—no detached browser windows required. Session cookies and local storage tokens persist securely in `~/Library/Application Support/` across launches.*

![QR Code Modal](screenshots/qr_modal.png)

---

### 3. Remote Cloudflare Tunnel Collaboration
*One-click instant HTTPS tunnel provisioning to share live validation runs and monitoring with distributed remote team members securely.*

![Cloudflare Tunnel Preview](screenshots/tunnel.png)

---

## 🏗️ Technical Architecture & Engineering Highlights

```
┌─────────────────────────────────────────────────────────────┐
│                 Electron Desktop Application                │
│                                                             │
│  ┌───────────────────────┐       ┌───────────────────────┐  │
│  │   Chromium Renderer   │       │   macOS Main Loop     │  │
│  │   • Dark Graphite UI  │◄─────►│   • Single-Instance   │  │
│  │   • Live SSE Client   │       │   • Native macOS Menu │  │
│  └───────────▲───────────┘       └───────────▲───────────┘  │
└──────────────┼───────────────────────────────┼──────────────┘
               │ Event-Driven Streams (SSE)    │ IPC Bridge
┌──────────────▼───────────────────────────────▼──────────────┐
│                    Local Express API Service                │
│  • Pacing Controller    • Session Manager   • Export Engine │
└──────────────────────────────┬──────────────────────────────┘
                               │ Orchestration
┌──────────────────────────────▼──────────────────────────────┐
│                  Playwright Automation Core                 │
│  • Headless Chromium Engine   • Anti-Ban Heuristic Monitor  │
│  • Persistent Session Store   • Rate-Limit Graceful Cutoff  │
└─────────────────────────────────────────────────────────────┘
```

- **Universal macOS Binary Architecture**: Compiled for both Apple Silicon (`arm64`) and Intel (`x64`) architectures, delivering native execution speed and optimal memory efficiency.
- **Native macOS Integration**: Custom macOS application menu (About, Edit with `Cmd+C`/`Cmd+V`/`Cmd+A` keyboard shortcuts, Window management) and native macOS Dock icon integration.
- **Playwright Automation Engine**: Direct low-level browser interaction with automated DOM selector fallback logic to handle WhatsApp Web UI updates seamlessly.
- **Proprietary Anti-Ban & Safety Safeguards (`SECURITY_STOP`)**: Real-time regex pattern monitors that actively scan WhatsApp's DOM for safety triggers (`unusual activity`, `rate limit`, `temporarily restricted`, `security check`). Automatically stops validation immediately to protect the user's phone number.
- **Event-Driven Reactive Streaming**: Uses **Server-Sent Events (SSE)** with persistent 20-second heartbeats, pushing real-time per-number verification results to the frontend with zero polling overhead.
- **Human Pacing Emulation**: Randomized min-to-max decimal delay intervals between lookups (e.g., 2.5s – 5.0s) simulating human keyboard and mouse latency.

---

## ⚡ Technical Specifications

| Component | Technology / Implementation |
| :--- | :--- |
| **Target OS** | macOS 12 Monterey or later (Apple Silicon M-Series & Intel) |
| **Frontend Shell** | Electron 41.x |
| **Automation Core** | Playwright Chromium Engine |
| **Backend Service** | Node.js + Express 4.x |
| **Streaming Protocol** | Server-Sent Events (SSE) |
| **Session Persistence** | `~/Library/Application Support/OutGrow WhatsApp Validator/.wweb_session` |
| **Packaging / Dist** | Electron-Builder (Universal `.dmg` & `.zip`) |
| **Networking** | Integrated Cloudflare Tunnel for secure HTTPS port forwarding |

---

## 🚀 Download & Installation for macOS

Pre-compiled, universal macOS packages are distributed directly under **Releases**:

1. Navigate to the [**Releases**](https://github.com/) section on the right side of this repository.
2. Download **`OutGrow WhatsApp Validator-1.0.0.dmg`** (or the `.zip` archive).
3. Double-click the `.dmg` file and drag **OutGrow WhatsApp Validator** into your **Applications** folder.

> [!NOTE]
> **First-Time macOS Launch Note (Apple Gatekeeper):**  
> Because this is a self-built open-source binary without a paid Apple Developer ID notarization certificate, macOS might show a warning on first launch: *"App cannot be opened because Apple cannot check it for malicious software"*.
>
> **To open:**
> 1. Right-click (or Control-click) the app in **Applications** and select **Open**.
> 2. Alternatively, open Terminal and run:
>    ```bash
>    xattr -cr "/Applications/OutGrow WhatsApp Validator.app"
>    ```

---

## ☁️ Automated Cloud Builds via GitHub Actions

This repository includes a preconfigured **GitHub Actions workflow** (`.github/workflows/build-mac.yml`):
1. Pushing commits or triggering **workflow_dispatch** spawns an official macOS runner (`macos-latest`).
2. GitHub Actions sets up Node.js 20, compiles the universal macOS `.dmg` and `.zip` installers, and attaches them under **Artifacts** for 1-click download.

---

## 🔒 Security & Safe Usage

- Built for legitimate contact database sanitization, customer onboarding verification, and database deduplication.
- Strictly adheres to human-simulated pacing recommendations to avoid triggering platform rate thresholds.
- All session data and authentication keys are stored exclusively in your local macOS user library and are never transmitted to external cloud servers.

---

## 📄 License & Rights

Copyright © 2026 OutGrow. All rights reserved.  
The source code and proprietary automation mechanisms of this project are private. Pre-built standalone binaries are distributed solely for evaluation and showcase purposes.
