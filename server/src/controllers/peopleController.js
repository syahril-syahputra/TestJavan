const get = async (req, res) => {
  try {
    const query = "select * from all_people order by id asc";
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
    const query = `insert into people (name, gender, parent) value ('${req.body.name}', '${req.body.gender}', ${req.body.parent})`;
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
    const query = `update people set name='${req.body.name}', gender='${req.body.gender}', parent=${req.body.parent} where id=${req.params.id}`;
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
    const query = `delete from people where id=${req.params.id} or parent=${req.params.id}`;
    req.db.query(query, function (err, data) {
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
const detail = async (req, res) => {
  try {
    const query = `select p.id, p.name , od.data_assets  from people p left join owner_detail od  on p.id = od.id `;
    req.db.query(query, function (err, data) {
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
const deleteAsset = async (req, res) => {
  try {
    const query = `delete from people_assets where idPeopleAssets=${req.params.id}`;
    req.db.query(query, function (err, data) {
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
const addAsset = async (req, res) => {
  // console.log(req.body)
  try {
    const query = `insert into people_assets (idPeople, idAsset) value ('${req.body.id}', '${req.body.asset}')`;
    req.db.query(query, function (err, data) {
      if (err) throw err;

      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
module.exports = { get, add, edit, del, detail, deleteAsset, addAsset };
