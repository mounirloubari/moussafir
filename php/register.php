<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $nom = $_POST["nom"];
  $prenom = $_POST["prenom"];
  $username = $_POST["new-username"];
  $password = $_POST["new-password"];
  $address = $_POST["address"];
  $tel = $_POST["tel"];

  var_dump($nom);
  var_dump($prenom);
  var_dump($username);
  var_dump($password);
  var_dump($address);
  var_dump($tel);

  // Connexion à la base de données
  $servername = "localhost";
  $username_db = "root";
  $password_db = "";
  $dbname = "travelsdw";

  $conn = new mysqli($servername, $username_db, $password_db, $dbname);

  // Vérifier la connexion
  if ($conn->connect_error) {
    die("La connexion a échoué: " . $conn->connect_error);
  }

  // Préparer et exécuter la requête SQL
  $stmt = $conn->prepare("INSERT INTO client (nom, prenom, nom_utilisateur, mot_passe, adresse, tel) VALUES (?, ?, ?, ?, ?, ?)");
  $stmt->bind_param("ssssss", $nom, $prenom, $username, $password, $address, $tel);
  $stmt->execute();

  // Vérifier si l'inscription a réussi
  if ($stmt->affected_rows === 1) {
    http_response_code(200);
  } else {
    http_response_code(500);
  }

  // Fermer la connexion
  $stmt->close();
  $conn->close();
}
