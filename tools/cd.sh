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
figlet -w 120 -f big "CDER"
echo -e "${CYAN}      Clean Data Extractor${NC}"
echo -e "${YELLOW}      waybackurls + gau${NC}"
echo ""
sleep 1

# =========================
# Input check
# =========================
if [ ! -f act.txt ]; then
  echo -e "${RED}[-] act.txt not found. Run subdomain scan first.${NC}"
  exit 1
fi

# =========================
# Cleanup old files
# =========================
echo -e "${BLUE}[+] Cleaning previous results...${NC}"
rm -f u1.txt u2.txt urls.txt
sleep 1

# =========================
# Waybackurls
# =========================
echo -e "${CYAN}[1/2] Collecting URLs from Wayback...${NC}"
cat act.txt | waybackurls | tee u1.txt > /dev/null
echo -e "${GREEN}[✓] Wayback collection done${NC}"
sleep 1

# =========================
# GAU
# =========================
echo -e "${CYAN}[2/2] Collecting URLs using GAU...${NC}"
cat act.txt | gau | tee u2.txt > /dev/null
echo -e "${GREEN}[✓] GAU collection done${NC}"
sleep 1

# =========================
# Merge & dedupe
# =========================
echo -e "${YELLOW}[+] Merging and removing duplicates...${NC}"
cat u1.txt u2.txt | anew urls.txt > /dev/null
echo -e "${GREEN}[✓] Final URLs saved to urls.txt${NC}"
sleep 1

# =========================
# Cleanup temp files
# =========================
echo -e "${BLUE}[+] Cleaning temp files...${NC}"
rm -f u1.txt u2.txt
sleep 1

# =========================
# Stats
# =========================
TOTAL=$(wc -l < urls.txt)

echo ""
echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}  CDER Finished Successfully 🚀${NC}"
echo -e "${GREEN}  Total URLs Collected: $TOTAL${NC}"
echo -e "${GREEN}======================================${NC}"

