import express from 'express';
import { getUserFavoriteRestaurants, addUserFavoriteRestaurant, removeUserFavoriteRestaurant, addOrder, submitRestaurantRating, getUserRatedRestaurants } from '../controllers/user.controller.js';

const userRouter = express.Router();

userRouter.use('/favorites/get-list', getUserFavoriteRestaurants);
userRouter.use('/favorites/add-restaurant', addUserFavoriteRestaurant);
userRouter.use('/favorites/remove-restaurant', removeUserFavoriteRestaurant);
userRouter.use('/orders/add-order', addOrder);
userRouter.use('/rate/add-new-rating', submitRestaurantRating);
userRouter.use('/rate/get-list-restaurant', getUserRatedRestaurants);

export default userRouter;
