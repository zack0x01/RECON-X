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
figlet -w 120 -f big "NAABER"
echo -e "${CYAN}      Fast Port Scanner${NC}"
echo -e "${YELLOW}      Powered by Naabu${NC}"
echo ""
sleep 1

# =========================
# Input check
# =========================
if [ ! -f all.txt ]; then
  echo -e "${RED}[-] all.txt not found. Run SUBBER first.${NC}"
  exit 1
fi

# =========================
# Cleanup
# =========================
echo -e "${BLUE}[+] Cleaning previous results...${NC}"
rm -f ports.txt
sleep 1

# =========================
# Scan
# =========================
echo -e "${CYAN}[1/1] Scanning top 1000 ports...${NC}"
naabu -list all.txt -silent -top-ports 1000 | tee ports.txt
cat ports.txt | httpx -silent | tee active-ports.txt
echo -e "${GREEN}[✓] Port scan completed${NC}"
sleep 1

# =========================
# Stats
# =========================
TOTAL=$(wc -l < ports.txt)

echo ""
echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}  NAABER Finished Successfully 🚀${NC}"
echo -e "${GREEN}  Open Ports Found: $TOTAL${NC}"
echo -e "${GREEN}======================================${NC}"

