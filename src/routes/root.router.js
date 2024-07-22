import express from 'express';
import userRouter from './user.router.js';
import restaurantRouter from './restaurant.router.js';

const rootRouter = express.Router();

rootRouter.use('/user', userRouter);
rootRouter.use('/restaurant', restaurantRouter);

export default rootRouter;
