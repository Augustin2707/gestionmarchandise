const mysql = require("mysql");

// Création de la connexion à la base de données
const connexion = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "", // mot de passe vide si tu es en local
    database: "examensgl"
});

// Connexion à la base au démarrage
connexion.connect((erreur) => {
    if (erreur) {
        console.error(" Échec de la connexion à la base de données :", erreur);
        throw erreur;
    }
    console.log(" Connexion à la base de données réussie");
});

// Exportation de la connexion pour être utilisée dans app.js ou server.js
module.exports = connexion;
