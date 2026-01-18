Sure man 😎
Here’s a **clean, professional, well-organized `README.md`** you can drop straight into GitHub.
It looks serious, easy to read, and hacker-friendly 🔥

---

```md
# 🚀 RECON-X

**RECON-X** is a modular, automated reconnaissance framework designed for bug bounty hunters and penetration testers.  
It chains multiple powerful tools into a clean, fast, and organized recon pipeline.

> SUBBER → NAABER → CDER  
> Subdomains → Ports → URLs

---

## ✨ Features

- 🔎 Automated **subdomain enumeration**
- ⚡ Fast **port scanning**
- 🌐 Historical & live **URL collection**
- 🧩 Modular tool structure
- 🎨 Clean CLI output with colors & banners
- 🧹 Auto deduplication & cleanup

---

## 🧠 Toolchain Overview

| Module | Name   | Description |
|------|--------|-------------|
| 1️⃣ | **SUBBER** | Subdomain enumeration using multiple sources |
| 2️⃣ | **NAABER** | Fast port scanning using Naabu |
| 3️⃣ | **CDER** | URL extraction using Wayback & GAU |
| 🧠 | **RECON-X** | Main launcher that chains everything |

---

## 📂 Project Structure

```

recon-x/
│
├── recon.sh              # Main launcher
├── tools/
│   ├── se.sh             # SUBBER (subdomain enum)
│   ├── ps.sh             # NAABER (port scan)
│   └── cd.sh             # CDER (URL extraction)
│
├── all.txt               # All discovered subdomains
├── act.txt               # Alive subdomains
├── ports.txt             # Open ports
└── urls.txt              # Final collected URLs

````

---

## ⚙️ Requirements

Make sure the following tools are installed and in your `$PATH`:

- `subfinder`
- `assetfinder`
- `findomain`
- `Sublist3r`
- `httprobe`
- `naabu`
- `waybackurls`
- `gau`
- `anew`
- `figlet`

Optional (for extra style):
- `lolcat`

---

## 🛠 Installation

```bash
git clone https://github.com/yourusername/recon-x.git
cd recon-x
chmod +x recon.sh tools/*.sh
````

---

## 🚀 Usage

Run the full recon pipeline with:

```bash
./recon.sh example.com
```

Each module will execute in order with clear progress output.

---

## 📊 Output Files

| File        | Description               |
| ----------- | ------------------------- |
| `all.txt`   | All discovered subdomains |
| `act.txt`   | Alive subdomains          |
| `ports.txt` | Open ports                |
| `urls.txt`  | Final deduplicated URLs   |

---

## 🔥 Example Workflow

```bash
SUBBER  → find subdomains
NAABER  → scan ports
CDER    → collect URLs
```

Perfect for chaining with:

* `httpx`
* `nuclei`
* `gf`
* `dalfox`

---

## 🧩 Customization

You can:

* Add new tools inside `tools/`
* Change port ranges in NAABER
* Filter juicy parameters in CDER
* Chain auto-scanning modules

---

## ⚠️ Disclaimer

This tool is intended **for educational purposes and authorized security testing only**.
You are responsible for complying with all applicable laws.

---

## ⭐ Credits

Built with ❤️ for the bug bounty & security community.

If you like this project — **star it** ⭐ and make it deadlier 😈

```

---

If you want next:
- 🧠 **Screenshots section**
- 📊 **Recon report template**
- 🧬 **Badges (stars, version, license)**
- 📜 **LICENSE file**

Say the word, we’ll polish it to **top-tier GitHub quality** 🔥
```
