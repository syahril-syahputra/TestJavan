const get = async (req, res) => {
  try {
    const query = "select * from assets order by idAssets desc";
    req.db.query(query, function (err, data) {
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
const add = async (req, res) => {
  // console.log(req.body)
  try {
    const query = `insert into assets (titleAssets, price) value ('${req.body.title}', '${req.body.price}')`;
    req.db.query(query, function (err, data) {
      if (err) throw err;

      // console.log(data)
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
const edit = async (req, res) => {
  try {
    const query = `update assets set titleAssets='${req.body.title}', price='${req.body.price}' where idAssets=${req.params.id}`;
    req.db.query(query, function (err, data) {
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
const del = async (req, res) => {
  try {
    const query = `delete from assets where idAssets=${req.params.id}`;
    req.db.query(query, function (err, data) {
      req.db.query(`delete from people_assets where idAsset=${req.params.id}`);
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
module.exports = { get, add, edit, del };
