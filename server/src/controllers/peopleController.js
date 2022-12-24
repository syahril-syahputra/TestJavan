const get = async (req, res) => {
  try {
    const query = "select * from people order by id asc";
    req.db.query(query, function (err, data) {
      if (err) throw err;
      res.json(data);
    });
  } catch (error) {
    res.json({ message: error });
  }
};
module.exports = { get };
