var express = require('express');

var router = express.Router();
/* ne pas oublier npm install mysql */
const mysql = require('mysql');
//connexion BDD MySQL
const db = mysql.createConnection(
	{ host: 'localhost', 
		user: 'root', 
		password: '',
		//par défaut le driver retourne des dates au format UTC
		dateStrings: true,
		database: 'cinoche'});
db.connect((err) => {
	if(err) {
		console.log(err);
	}
});
// liste des cinémas
router.get('/', (req, res) => {
	db.query('SELECT num_cine, nom, adresse from cinema', (err, result) => {
		if(err) {
			res.json({err: 'La liste est indisponible pour le moment'});
		}
		else res.json(result);
		//si on veut retourner une vue au format EJS
		//else res.render('cinemas', {title: "Liste des cinémas", cinemas: result});
	});
});
//détails d'un cinéma
router.get('/:id', (req, res) => {
	let id = req.params.id;
	db.query(`SELECT num_cine, nom, adresse 
						from cinema
						where num_cine = ${id}`, (err, result) => {
		if(err) {
			res.json({err: 'Oupssss'});
		}
		else res.json(result);
	});
});
// programmation d'un cinéma
router.get('/programmation/:id', (req, res) => {
	let id = req.params.id;
	db.query(`SELECT p.num_proj, p.date, f.titre, f.genre
						FROM projection p 
						JOIN film f
						on p.num_film = f.num_film
						where p.num_cine = ${id}`, (err, result) => {
		if(err) {
			res.json({err: 'La programmation est indisponible pour le moment'});
		}
		else res.json(result);			
	});
	//res.json(req.params);
});
// ajouter un cinéma
router.post('/add', (req, res) => {
	db.query(`INSERT INTO cinema(nom, adresse)
					VALUES('${req.body.nom}', '${req.body.adresse}')`, (err, result) => {
		if(err) {
			res.json({err: 'La programmation est indisponible pour le moment'});
		}
		else res.json({msg: 'cinéma ajouté'});
		//else res.json(result);			
	});
});

// modifier un cinéma
router.put('/up/:id', (req, res) => {
	db.query(`UPDATE cinema
					set nom = '${req.body.nom}'
					, adresse = '${req.body.adresse}'
					WHERE num_cine = ${req.params.id}`, (err, result) => {
		if(err) {
			res.json({err: 'Erreur pendant la modification'});
		}
		else res.json({msg: 'cinéma modifié'});
		//else res.json(result);			
	});
});

// supprimer un cinéma 
router.delete('/supp/:id', (req, res) => {
	//console.log(req.params.id);
	let id = req.params.id;
	db.query(`DELETE FROM cinema where num_cine = ${id}`, (err, result) => {
		if(err) {
			res.json({err: 'suppression impossible'});
		}
		else{
			db.query('SELECT num_cine, nom, adresse from cinema', (err, result) => {
				if(err) {
					res.json({err: 'La liste est indisponible pour le moment'});
				}
				else res.json({liste: result, msg: `cinéma ${id} supprimé`});
			});
		} //res.json({msg: `cinéma ${id} supprimé`});			
	});
});
module.exports = router;