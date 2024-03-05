#!/bin/bash
# installs OpenVPN on Debian 11 Bullseye (with 2FA via Google Authenticator)

SUBNET="10.8.24.0"

function isRoot() {
    if [ "$EUID" -ne 0 ]; then
        return 1
    fi
}

function tunAvailable() {
    if [ ! -e /dev/net/tun ]; then
        return 1
    fi
}

function checkOS() {
    if [[ -e /etc/os-release ]]; then
        source /etc/os-release
        if [[ $ID == "debian" && $VERSION_CODENAME == "bullseye" ]]; then
            OS="debian"
        else
            echo "This script is only compatible with Debian 11 Bullseye."
            exit 1
        fi
    else
        echo "This script is only compatible with Debian 11 Bullseye."
        exit 1
    fi
}

function initialCheck() {
    if ! isRoot; then
        echo "Sorry, you need to run this as root"
        exit 1
    fi
    if ! tunAvailable; then
        echo "TUN is not available"
        exit 1
    fi
    checkOS
}

function installOpenVPN() {
    # Update package list
    apt update
    
    # Install required packages
    apt install -y openvpn easy-rsa iptables-persistent qrencode google-authenticator libpam-google-authenticator

    # Create necessary directories
    mkdir -p /etc/openvpn/clients /etc/openvpn/google-auth /var/log/openvpn
    
    # Copy Google Authenticator files to the appropriate directory
    cp /usr/share/doc/openvpn/examples/sample-config-files/google-authenticator /etc/openvpn/google-auth/

    # Proceed with OpenVPN setup...

    # Rest of the script continues...
}

function removeOpenVPN() {
    # Script to remove OpenVPN
    # This part needs to be updated accordingly based on how OpenVPN was installed on Debian 11
}

function manageMenu() {
    # Script to manage OpenVPN
    # This part needs to be updated accordingly based on how OpenVPN was installed on Debian 11
}

# Check for root, TUN, OS...
initialCheck

# Check if OpenVPN is already installed
# Modify this part accordingly based on how OpenVPN was installed on Debian 11

