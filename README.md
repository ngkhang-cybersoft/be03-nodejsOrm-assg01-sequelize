# Assigment Sequelize App Food

## User

- [x] Get a list of restaurants favorited by a user
  - URL: `/user/favorites/get-list`
  - Func: `getUserFavoriteRestaurants`
  - Request body `req.body`, example:

    ```json
    {
      "userId": 1
    }
    ```

- [x] Add a restaurant to a user's favorites list
  - URL: `/user/favorites/add-restaurant`
  - Func: `addUserFavoriteRestaurant`
  - Request body `req.body`, example:

    ```json
    {
      "userId": 1,
      "resId": 7
    }
    ```

- [x] Remove a restaurant from a user's favorites list

  - URL: `/user/favorites/remove-restaurant`
  - Func: `removeUserFavoriteRestaurant`
  - Request body `req.body`, example:

    ```json
    {
      "userId": 1,
      "resId": 7
    }
    ```

- [x] Add an order for food from a restaurant

  - URL: `/user/orders/add-order`
  - Func: `addOrder`
  - Request body `req.body`, example:

    ```json
    {
      "userId": 1,
      "foodId": 3,
      "amount": 5,
      "code": "ORDER013"
    }
    ```

- [x] Submit a rating for a restaurant

  - URL: `/use/rate/add-new-rating`
  - Func: `submitRestaurantRating`
  - Request body `req.body`, example:

    ```json
    {
      "userId": 1,
      "resId": 9,
      "amount": 10,
    }
    ```

- [x] Get a list of restaurants rated by a user

  - URL: `/user/rate/get-list-restaurant`
  - Func: `getUserRatedRestaurants`
  - Request body `req.body`, example:

    ```json
    {
      "userId": 1
    }
    ```

## Restaurant

- [x] Get a list of users who have favorited a restaurant

  - URL: `/restaurant/user-liked`
  - Func: `getLikedUsersByRestaurantId`
  - Request body `req.body`, example:

    ```json
    {
      "resId": 1
    }
    ```

- [x] Get a list of user rates for a restaurant

  - URL: `/restaurant/user-rated`
  - Func: `getRatesByRestaurantId`
  - Request body `req.body`, example:

    ```json
    {
      "resId": 1
    }
    ```
