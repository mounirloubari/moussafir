<?php
if ($_SERVER["REQUEST_METHOD"] === "GET") {
    
    $username = $_GET["username"];

    

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
        $stmt = $conn->prepare("SELECT * FROM client WHERE nom_utilisateur = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
    
        // Check if user exists
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
        echo json_encode($user);
    
        // Close database connection
        $stmt->close();
        $conn->close();
}