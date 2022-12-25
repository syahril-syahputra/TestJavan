const express = require("express");
const router = express.Router();
const peopleController = require("../controllers/peopleController");

router.get("/", peopleController.get);
router.get("/detail", peopleController.detail);
router.post("/", peopleController.add);
router.put("/:id", peopleController.edit);
router.delete("/:id", peopleController.del);
router.post("/asset", peopleController.addAsset);
router.delete("/asset/:id", peopleController.deleteAsset);

module.exports = router;
