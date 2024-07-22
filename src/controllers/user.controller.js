import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import { responseData } from '../config/response.js';

const model = initModels(sequelize);

// Get a list of restaurants favorited by a user
const getUserFavoriteRestaurants = async (req, res) => {
  let { userId } = req.body;

  let data = await model.like_res.findAll({
    where: {
      user_id: userId,
    },
    include: ['re'],
  })

  responseData(data, 'Thành công', 200, res);
}

// Add a restaurant to a user's favorites list
const addUserFavoriteRestaurant = async (req, res) => {
  const { userId, resId } = req.body;
  let newData = {
    user_id: userId,
    res_id: resId,
    date_like: new Date(),
  };

  let isUserExist = await model.like_res.findOne({
    where: {
      user_id: userId,
      res_id: resId,
    }
  });

  if (isUserExist) {
    responseData('', 'Nhà hàng đã có trong danh sách yêu thích', 409, res);
    return;
  }

  await model.like_res.create(newData);
  responseData('', 'Đã thêm vào danh sách yêu thích', 200, res);
}

// Remove a restaurant from a user's favorites list
const removeUserFavoriteRestaurant = async (req, res) => {
  const { userId, resId } = req.body;
  await model.like_res.destroy({
    where: {
      user_id: userId,
      res_id: resId,
    }
  })

  responseData('', 'Xóa khỏi danh sách yêu thích', 200, res);
}

// Add an order for food from a restaurant
const addOrder = async (req, res) => {
  const { userId, foodId, amount, code } = req.body;

  let newData = {
    user_id: userId,
    food_id: foodId,
    amount,
    code,
    arr_sub_id: '[]'
  }

  await model.orders.create(newData);
  responseData('', 'Đã đặt hàng thành công', 200, res);
}

// Submit a rating for a restaurant
const submitRestaurantRating = async (req, res) => {
  const { userId, resId, amount } = req.body;

  let newData = {
    user_id: userId,
    res_id: resId,
    date_rate: new Date(),
    amount,
  };

  let isExistRated = await model.rate_res.findOne({
    where: {
      user_id: userId,
      res_id: resId,
    }
  });

  if (isExistRated) {
    responseData('', 'Đã đánh giá trước đó', 409, res);
    return;
  }

  await model.rate_res.create(newData);
  responseData('', 'Đánh giá nhà hàng thành công', 200, res);
}

// Get a list of restaurants rated by a user
const getUserRatedRestaurants = async (req, res) => {
  const { userId } = req.body;

  let listRated = await model.rate_res.findAll({
    where: {
      user_id: userId
    },
    include: ['re']
  });

  if (listRated) {
    responseData(listRated, 'Thành công', 200, res);
    return;
  }
}

export {
  getUserFavoriteRestaurants,
  addUserFavoriteRestaurant,
  removeUserFavoriteRestaurant,
  addOrder,
  submitRestaurantRating,
  getUserRatedRestaurants,
};
