import express from 'express';
import { getLikedUsersByRestaurantId, getRatesByRestaurantId } from '../controllers/restaurant.controller.js';

const restaurantRouter = express.Router();

restaurantRouter.use('/user-liked', getLikedUsersByRestaurantId)
restaurantRouter.use('/user-rated', getRatesByRestaurantId)

export default restaurantRouter;
