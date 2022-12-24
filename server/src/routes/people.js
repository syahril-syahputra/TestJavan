const express = require("express");
const router = express.Router();
const peopleController = require("../controllers/peopleController");

router.get("/", peopleController.get);
router.post("/", peopleController.add);
router.put("/:id", peopleController.edit);
router.delete("/:id", peopleController.del);

module.exports = router;
