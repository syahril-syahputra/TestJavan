const express = require("express");
const router = express.Router();
const peopleController = require("../controllers/peopleController");

router.get("/", peopleController.get);

module.exports = router;
