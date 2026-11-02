# 📱 Mobile AI Development Environment For Free (VS Code + Claude Code + Ollama )
<img width="3268" height="1184" alt="banner" src="https://github.com/user-attachments/assets/e600d51b-1c74-416c-b18f-6850be304702" />

A complete, professional setup to turn your Android device into a portable AI-powered development environment.
This guide walks through installing a local LLM (Ollama), configuring Claude Code inside Ubuntu, and running VS Code in your browser.

## 🚀 Overview
You will build:

Termux| Linux environment on Android
Ubuntu (proot)| Full Linux userland
code-server| VS Code in browser
Ollama| Run local AI models
Claude Code| AI coding assistant

---

## ⚙️ Requirements

- Android phone (4GB+ RAM recommended)
- Stable internet
- Termux (from F-Droid)

---

## 🚀 Architecture Overview

This setup separates responsibilities for stability and performance:

- Termux (Host Layer) → Runs Ollama (LLM server)
- Ubuntu (proot-distro) → Development environment
- Claude Code → AI coding assistant (connected to Ollama)
- VS Code (code-server) → Browser-based editor

---

# 🛠️ INSTALLATION 

## 🧠 Part 1 — Install Ollama (Termux)

Ollama runs directly in Termux to provide a local AI backend.

1. Update and install dependencies
```
pkg update && pkg upgrade -y
pkg install git nodejs-lts python -y
pkg install ollama
```
---

2. Start Ollama server
```
ollama serve
```
---

3. Download coding model
## Note - you can Pull and Run local models like ```ollama run llama3.2 AND Qwen 2.5 Series``` Based on your phone Processor.  
```
ollama pull nemotron-3-super:cloud
```

«⚠️ First download may be several GB. Ensure stable internet.»

---`

## 🐧 Part 2 — Ubuntu Setup (proot-distro)

1. Install proot-distro and ubuntu 
```
pkg install proot-distro
proot-distro install ubuntu
proot-distro login ubuntu
```
---

2. Update system and install dependencies
```
apt update && apt upgrade -y
apt install -y curl wget git build-essential nodejs npm
```
---


## 🤖 Part 3 — Install Claude Code (inside Ubuntu)

Claude Code will connect to Ollama running in Termux.

---

1. Install Claude Code
```
npm install -g @anthropic-ai/claude-code
```
---

2. Configure connection to Ollama
```
echo -e '\n# Claude Code with Ollama Config\nexport ANTHROPIC_BASE_URL="http://localhost:11434"\nexport ANTHROPIC_AUTH_TOKEN="ollama"' >> ~/.bashrc && source ~/.bashrc
```
---

3. Run Claude Code
```
claude --model nemotron-3-super:cloud
```
OR
```
ollama launch claude
```

---

## 💻 Part 4 — Install VS Code (code-server)

1. Install code-server
```
curl -fsSL https://code-server.dev/install.sh | sh
```
---

2. Start VS Code
```
code-server --auth none

```
for background
```
code-server &
```

---

3. Access in browser
```
http://127.0.0.1:8080
```
---

### 🔗 System Workflow

Termux
 └── Ollama (LLM Server :11434)

Ubuntu (proot)
 ├── Claude Code (AI CLI)
 └── VS Code (code-server)

- Claude Code → sends requests to Ollama
- VS Code → used for editing and development
- Entire system runs locally on your phone

---

⚡ Usage Workflow

1. Start Ollama (Termux):

ollama serve

2. Enter Ubuntu:

proot-distro login ubuntu

3. Start VS Code:

code-server &

4. Run Claude Code:

claude --model qwen3-coder:7b

---

⚠️ Important Notes

- Keep Ollama running before using Claude Code
- Ensure enough storage (model size ~4–5GB)
- Performance depends on device hardware
- Close background apps for better stability

---

🛠️ Troubleshooting

Claude cannot connect to Ollama

- Ensure "ollama serve" is running
- Check port "11434" is active

---

VS Code not opening

Try:

code-server --bind-addr 127.0.0.1:9090

---

Command not found

Reload environment:

source ~/.bashrc

---

📦 Command Summary

Ollama (Termux)

pkg update && pkg upgrade -y
pkg install git nodejs-lts python -y
pkg install ollama

ollama serve
ollama pull qwen3-coder:7b

---

Ubuntu + Claude Code

pkg install proot-distro
proot-distro install ubuntu
proot-distro login ubuntu

apt update && apt upgrade -y
apt install -y curl wget git build-essential nodejs npm

npm install -g @anthropic-ai/claude-code

echo -e '\n# Claude Code with Ollama Config\nexport ANTHROPIC_BASE_URL="http://localhost:11434"\nexport ANTHROPIC_AUTH_TOKEN="ollama"' >> ~/.bashrc && source ~/.bashrc

claude --model qwen3-coder:7b

---

VS Code

curl -fsSL https://code-server.dev/install.sh | sh

code-server &
code-server --auth none

---

🎯 Final Result

You now have:

- 🧠 Local AI model (Ollama)
- 🤖 AI coding assistant (Claude Code)
- 💻 Full VS Code environment

All running directly on your phone.

---

🚀 Ready to Build

This setup provides a self-contained AI development environment suitable for:

- Python development
- Web apps
- GenAI experimentation
- Lightweight ML workflows

---
