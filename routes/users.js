var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
// get toto
router.get('/toto', (req, res) => {
  res.send('Résultat de la route Toto');
});
/* get toto id:1 */
router.get('/toto/:id', (req, res) => {
  console.log(req.params);
  res.json(req.params);
});
/* POST */
router.post('/post', (req, res) => {
  res.send('requete type post');
})
/* PUT */
router.put('/put', (req, res) => {
  res.send('requete type PUT');
});
/* delete */
router.delete('/del', (req, res) => {
  res.send('requete type delete');
});


module.exports = router;
