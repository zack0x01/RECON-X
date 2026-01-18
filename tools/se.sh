#!/bin/bash

# =========================
# Colors
# =========================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'

# =========================
# Logo
# =========================
clear
echo -e "${PURPLE}"
figlet -w 120 -f big "SUBBER"
echo -e "${CYAN}        Subdomain Enumeration Framework${NC}"
echo -e "${YELLOW}        Recon | Fast | Clean | Powerful${NC}"
echo ""
sleep 1

# =========================
# Target
# =========================
DOMAIN=$1

# =========================
# Cleanup previous scan
# =========================
echo -e "${BLUE}[+] Cleaning previous results...${NC}"
[ -f act.txt ] && cp act.txt old.txt && rm act.txt
rm -f sf.txt af.txt fd.txt sl.txt all.txt active-ports.txt ports.txt urls.txt



sleep 1

# =========================
# Subfinder
# =========================
echo -e "${CYAN}[1/5] Running Subfinder...${NC}"
subfinder -d $DOMAIN -silent | tee sf.txt
echo -e "${GREEN}[✓] Subfinder done${NC}"
sleep 1

# =========================
# Assetfinder
# =========================
echo -e "${CYAN}[2/5] Running Assetfinder...${NC}"
echo "$DOMAIN" | assetfinder | grep "$DOMAIN" | tee af.txt
echo -e "${GREEN}[✓] Assetfinder done${NC}"
sleep 1

# =========================
# Findomain
# =========================
echo -e "${CYAN}[3/5] Running Findomain...${NC}"
findomain -t $DOMAIN -q | tee fd.txt
echo -e "${GREEN}[✓] Findomain done${NC}"
sleep 1

# =========================
# Sublist3r
# =========================
echo -e "${CYAN}[4/5] Running Sublist3r...${NC}"
../Sublist3r/sublist3r.py -d $DOMAIN -o sl.txt > /dev/null 2>&1
echo -e "${GREEN}[✓] Sublist3r done${NC}"
sleep 1

# =========================
# Merge & remove duplicates
# =========================
echo -e "${YELLOW}[+] Merging results & removing duplicates...${NC}"
cat sl.txt fd.txt af.txt sf.txt | anew all.txt > /dev/null
echo -e "${GREEN}[✓] Unique subdomains saved to all.txt${NC}"
sleep 1

# =========================
# Check alive subdomains
# =========================
echo -e "${RED}[5/5] Probing for alive subdomains...${NC}"
cat all.txt | httprobe | tee act.txt
echo -e "${GREEN}[✓] Alive subdomains saved to act.txt${NC}"
sleep 1

# =========================
# Cleanup temp files
# =========================
echo -e "${BLUE}[+] Cleaning temp files...${NC}"
rm -f sl.txt af.txt sf.txt fd.txt
sleep 1

# =========================
# Done
# =========================
echo ""
echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}  Recon Finished Successfully 🚀${NC}"
echo -e "${GREEN}  Total Alive Targets: $(wc -l < act.txt)${NC}"
echo -e "${GREEN}======================================${NC}"

