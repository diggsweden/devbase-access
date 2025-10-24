# devbase-access

> Your access point to a clean, consistent, and lightweight development workspace at DIGG.

---

## 🧭 Purpose

`devbase-access` is the foundation for setting up and maintaining a developer-friendly environment across **macOS**, **Ubuntu**, and **Windows (WSL)**.

This repository is part of the broader **devbase** ecosystem:

* [`devbase-core`](https://github.com/diggsweden/devbase-core) → Core scripts and configuration shared across platforms.
* `devbase-access` → Access layer and setup entry point for each OS.
* `devbase-custom-config` → Internal (WSL-specific) configuration, managed privately.

Together, they aim to reduce friction, improve onboarding, and make sure every developer can focus on **building value**, not fighting setup.

---

## ⚙️ Structure

```
.
├── README.md
├── docs/
│   ├── macos.md
│   ├── ubuntu.md
│   └── windows.md
├── scripts/
│   ├── install.sh
│   ├── configure.sh
│   └── verify.sh
└── examples/
    └── env-template.yaml
```

Each platform guide under `/docs` describes how to go from a fresh machine to a productive environment — including credentials, IDE setup, and essential packages.

---

## 🚀 Getting Started

1. **Clone this repository**

   ```bash
   git clone https://github.com/diggsweden/devbase-access.git
   cd devbase-access
   ```

2. **Pick your platform**

   ```bash
   cd docs/macos     # or ubuntu, windows
   ```

3. **Follow the setup guide** — it will walk you from zero to a working environment.

4. **(Optional)** Run helper scripts to automate setup:

   ```bash
   ./scripts/install.sh
   ./scripts/configure.sh
   ```

---

## 🤝 Contributing

Contributions are welcome — especially from developers who:

* Have recently onboarded and spotted friction points.
* Found smarter or cleaner ways to achieve the same setup.
* Want to help keep our stack maintainable and consistent.

To contribute:

1. Fork the repo.
2. Create a feature branch (`feat/update-macos-docs`).
3. Open a PR with a concise description.

All contributions should follow **Clean Code** principles and prioritize clarity and repeatability.

---

## 🧩 Design Principles

* **Simplicity** → Prefer readable bash, avoid unnecessary abstractions.
* **Transparency** → No hidden state; each step should be traceable.
* **Reproducibility** → Same steps, same result, across machines.
* **Ownership** → Every developer should feel empowered to improve the base.

---

## 🪴 Vision

We’re building a **developer experience** that’s light, reproducible, and joyful. The goal: a full-stack developer at DIGG should be able to set up a new machine and reach first commit within hours — not days.

> *Less iron. More flow.*
