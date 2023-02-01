const express = require("express");
const mongoose = require("mongoose");
const app = express();
const PORT = 3000;
const mongoDBPath =
  "mongodb+srv://mahmood:mahmood123456@cluster0.5q697dh.mongodb.net/?retryWrites=true&w=majority";

//Imported From Other Files
const authRouter = require("./routes/auth");

//middleware
app.use(express.json());
app.use(authRouter);

//Connections
mongoose
  .connect(mongoDBPath)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

// app.listen(process.env.PORT || 3000, function () {
//   console.log(
//     "Express server listening on port %d in %s mode",
//     this.address().port,
//     app.settings.env
//   );
// });

app.listen(PORT, "0.0.0.0", () => {
  console.log.apply(`connected at port ${PORT}`);
});
