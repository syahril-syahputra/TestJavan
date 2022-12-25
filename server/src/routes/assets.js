const express = require("express");
const router = express.Router();
const assetsController = require("../controllers/assetsController");

router.get("/", assetsController.get);
router.post("/", assetsController.add);
router.put("/:id", assetsController.edit);
router.delete("/:id", assetsController.del);

module.exports = router;
