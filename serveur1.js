const express = require("express");
const connexion = require("./connexion1");
const app = express();
const bodyParser = require("body-parser");
const path = require("path");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static("public"));

// Page d'accueil
app.get("/", (req, res) => {
    res.render("accueil");
});

// Formulaire d'ajout
app.get("/ajouter", (req, res) => {
    res.render("formulaire1");
});

app.post("/ajouter", (req, res) => {
    const {
        type_marchandise,
        poids,
        destination,
        date_expedition,
        date_arrivee_prevue,
        statut,
        client,
        contact_client,
        notes
    } = req.body;

    const sql = `INSERT INTO marchandises 
        (type_marchandise, poids, destination, date_expedition, date_arrivee_prevue, statut, client, contact_client, notes)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    connexion.query(sql, [
        type_marchandise,
        poids,
        destination,
        date_expedition,
        date_arrivee_prevue,
        statut,
        client,
        contact_client,
        notes
    ], (err) => {
        if (err) console.log(err);
        res.redirect("/afficher");
    });
});

// Affichage des marchandises
app.get("/afficher", (req, res) => {
    connexion.query("SELECT * FROM marchandises ORDER BY id ASC", (err, resultat) => {
        if (err) console.log(err);
        res.render("afficher", { resultat });
    });
});

// Formulaire de modification
app.get("/modification", (req, res) => {
    let id = req.query.id;
    connexion.query("SELECT * FROM marchandises WHERE id = ?", [id], (err, resultat) => {
        if (err) console.log(err);
        res.render("update", { resultat });
    });
});

// Validation de la modification
app.post("/mod", (req, res) => {
    let id = req.query.id;
    const {
        type_marchandise,
        poids,
        destination,
        date_expedition,
        date_arrivee_prevue,
        statut,
        client,
        contact_client,
        notes
    } = req.body;

    const sql = `UPDATE marchandises SET 
        type_marchandise = ?, poids = ?, destination = ?, date_expedition = ?, 
        date_arrivee_prevue = ?, statut = ?, client = ?, contact_client = ?, notes = ? 
        WHERE id = ?`;

    connexion.query(sql, [
        type_marchandise,
        poids,
        destination,
        date_expedition,
        date_arrivee_prevue,
        statut,
        client,
        contact_client,
        notes,
        id
    ], (err) => {
        if (err) console.log(err);
        res.redirect("/afficher");
    });
});

// Suppression
app.get("/suppression", (req, res) => {
    let id = req.query.id;
    connexion.query("DELETE FROM marchandises WHERE id = ?", [id], (err) => {
        if (err) console.log(err);
        res.redirect("/afficher");
    });
});

app.listen(3007, () => {
    console.log("Serveur démarré sur le port 3007");
});
