<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Connect to database
    $servername = "localhost";
    $db_username = "root";
    $db_password = "";
    $dbname = "travelsdw";
    $conn = new mysqli($servername, $db_username, $db_password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare SQL statement
    $stmt = $conn->prepare("SELECT * FROM client WHERE nom_utilisateur = ? AND mot_passe = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();

    // Check if user exists
    $result = $stmt->get_result();
    if ($result->num_rows === 1) {
       // header('Location: dashboard.php');
        exit();
    } else {
        echo 'Invalid username or password';
    }

    // Close database connection
    $stmt->close();
    $conn->close();
}
