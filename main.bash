#!/bin/bash
# Warna
green='\033[0;32m'
red='\033[0;31m'
blue='\033[0;34m'
reset='\033[0m'

# ASCII Art "Hacker" style
echo -e "${green}"
echo "  __  __      _        _ _           _ "
echo " |  \/  | ___| |_ __ _| | | ___ _ __| |"
echo " | |\/| |/ _ \ __/ _\` | | |/ _ \ '__| |"
echo " | |  | |  __/ || (_| | | |  __/ |  |_|"
echo " |_|  |_|\___|\__\__,_|_|_|\___|_|  (_)"
echo -e "${reset}"

# Fungsi untuk memeriksa dan menginstall package jika belum ada
install_package() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${blue}Package $1 not found. Installing...${reset}"
        pkg install $1 -y
    else
        echo -e "${green}Package $1 is already installed.${reset}"
    fi
}

# Install package yang dibutuhkan
echo -e "${blue}Checking for required packages...${reset}"
install_package nmap
install_package sqlmap
install_package nikto

# Menu alat penetrasi web
echo -e "${blue} Welcome to Web Penetration Tool v1.0 ${reset}"
echo -e "${red} Usage of this tool for illegal purposes is prohibited.${reset}"
echo -e "${blue} Select your attack method: ${reset}"
echo "1. Nmap Scan"
echo "2. SQLMap Injection"
echo "3. Nikto Vulnerability Scan"
echo "4. Exit"
read -p "Choose an option: " option

# Pilihan dari user
case $option in
  1)
    read -p "Enter target domain or IP: " target
    echo -e "${green}Scanning with Nmap...${reset}"
    nmap -A $target
    ;;
  2)
    read -p "Enter target URL: " url
    echo -e "${green}Running SQLMap...${reset}"
    sqlmap -u $url --batch
    ;;
  3)
    read -p "Enter target domain: " domain
    echo -e "${green}Running Nikto...${reset}"
    nikto -h $domain
    ;;
  4)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo -e "${red}Invalid option. Exiting...${reset}"
    exit 1
    ;;
esac
