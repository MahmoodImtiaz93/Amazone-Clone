const mongoose = require("mongoose");
//const ratingSchema = require("./rating");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  quantity: {
    type: Number,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  // ratings: [ratingSchema],
});

// module.exports = mongoose.model('Product', productSchema); // this one working
//module.exports = { Product, productSchema };

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };
//module.exports = mongoose.model('Product', productSchema);
