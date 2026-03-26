<?php
$db = new SQLite3('users.db');
$db->exec("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
$db->exec("INSERT OR IGNORE INTO users (username, password) VALUES ('admin', 'admin123')");
$db->exec("INSERT OR IGNORE INTO users (username, password) VALUES ('dinda', 'hacker123')");

$message = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user = $_POST['username'];
    $pass = $_POST['password'];
    
    // ⚠️ RENTAN SQL INJECTION ⚠️
    $query = "SELECT * FROM users WHERE username = '$user' AND password = '$pass'";
    $result = $db->query($query);
    
    if ($row = $result->fetchArray()) {
        $message = "Login berhasil! Selamat datang, " . $row['username'];
    } else {
        $message = "Login gagal!";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    
    <!-- ⚠️ RENTAN XSS ⚠️ -->
    <div style="color: red;">
        <?php echo $message; ?>
    </div>
    
    <form method="POST">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
    </form>
    
    <hr>
    <h3>Test SQL Injection:</h3>
    <code>Username: admin' OR '1'='1' -- <br>Password: apapun</code>
    <br><br>
    <h3>Test XSS:</h3>
    <code>Username: &lt;script&gt;alert('XSS')&lt;/script&gt;<br>Password: apapun</code>
</body>
</html>