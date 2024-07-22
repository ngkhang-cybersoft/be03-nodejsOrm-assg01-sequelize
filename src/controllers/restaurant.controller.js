import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import { responseData } from '../config/response.js';

const model = initModels(sequelize);

// Get a list of users who have favorited a restaurant
const getLikedUsersByRestaurantId = async (req, res) => {
  const { resId } = req.body;

  let listUser = await model.like_res.findAll({
    where: {
      res_id: resId,
    },
    include: ['user'],
  });

  responseData(listUser, 'Thành công', 200, res);
}

// Get a list of user rates for a restaurant
const getRatesByRestaurantId = async (req, res) => {
  const { resId } = req.body;

  let listUser = await model.rate_res.findAll({
    where: {
      res_id: resId,
    },
    include: ['user'],
  });

  responseData(listUser, 'Thành công', 200, res);
}

export {
  getLikedUsersByRestaurantId,
  getRatesByRestaurantId,
}
