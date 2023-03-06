const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const app = express();
const PORT = 3000;
const mongoDBPath =
  "mongodb+srv://mahmood:mahmood123456@cluster0.5q697dh.mongodb.net/?retryWrites=true&w=majority";

//Imported From Other Files
const authRouter = require("./routes/auth");
const userRouter = require("./routes/user");

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

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
