<?php
session_start();

$db = new SQLite3('data.db');

// Bikin tabel
$db->exec("CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY, 
    username TEXT, 
    password TEXT,
    role TEXT
)");

// Data palsu
$db->exec("DELETE FROM users");
$db->exec("INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'superadmin')");
$db->exec("INSERT INTO users (username, password, role) VALUES ('dinda', 'hacker', 'user')");
$db->exec("INSERT INTO users (username, password, role) VALUES ('budianto', 'jago', 'user')");
$db->exec("INSERT INTO users (username, password, role) VALUES ('satria', 'sayang', 'user')");
$db->exec("INSERT INTO users (username, password, role) VALUES ('ketos', 'rahasia', 'moderator')");

$message = "";
$result_data = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user = $_POST['username'];
    $pass = $_POST['password'];
    
    // 🔥 RENTAN SQL INJECTION 🔥
    $query = "SELECT * FROM users WHERE username = '$user' AND password = '$pass'";
    $result = $db->query($query);
    
    if ($row = $result->fetchArray()) {
        $_SESSION['user_id'] = $row['id'];
        $_SESSION['username'] = $row['username'];
        $_SESSION['role'] = $row['role'];
        $message = "✅ Login sukses! Selamat datang, " . $row['username'];
        
        // Ambil semua data buat ditampilin
        $all = $db->query("SELECT id, username, password, role FROM users");
        $result_data = [];
        while ($r = $all->fetchArray()) {
            $result_data[] = $r;
        }
    } else {
        $message = "❌ Login gagal!";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>🔥 VULN LOGIN - LATIHAN SQLI & XSS 🔥</title>
    <style>
        body { font-family: monospace; background: #0a0a0a; color: #0f0; padding: 20px; }
        input, button { background: #111; color: #0f0; border: 1px solid #0f0; padding: 8px; margin: 5px; }
        .result { border: 1px solid #0f0; padding: 10px; margin-top: 20px; }
        .error { color: #f00; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #0f0; padding: 5px; text-align: left; }
        th { background: #1a1a1a; }
    </style>
</head>
<body>
    <h1>🔥 SITE SUPER RENTAN 🔥</h1>
    <p><i>No sanitasi, no prepared statement, no firewall!</i></p>
    
    <div class="result">
        <h3>📢 NOTIFIKASI:</h3>
        <div><?php echo $message; ?></div>
    </div>
    
    <form method="POST">
        <h3>🔐 LOGIN FORM</h3>
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">⚡ LOGIN ⚡</button>
    </form>
    
    <?php if ($result_data): ?>
    <div class="result">
        <h3>📋 DATA USER</h3>
        <table>
            <tr><th>ID</th><th>Username</th><th>Password</th><th>Role</th></tr>
            <?php foreach ($result_data as $row): ?>
            <tr>
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['username']; ?></td>
                <td><?php echo $row['password']; ?></td>
                <td><?php echo $row['role']; ?></td>
            </tr>
            <?php endforeach; ?>
        </table>
    </div>
    <?php endif; ?>
    
    <hr>
    <h3>🎯 TEST SQL INJECTION:</h3>
    <code>Username: admin' OR '1'='1' -- <br>Password: (kosongin)</code><br>
    <code>Username: ' UNION SELECT id, username, password, role FROM users -- <br>Password: (kosongin)</code><br>
</body>
</html>