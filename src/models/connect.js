// Chuỗi kết nối
import { Sequelize } from 'sequelize'
import config from '../config/config.js'

// yarn sequelize-auto -h localhost -d db_food -u root -x 123456 -p 3307 --dialect mysql -o src/models -l esm
const sequelize = new Sequelize(config.database, config.user, config.pass, {
    host: config.host,
    port: config.port,
    dialect: config.dialect
})

export default sequelize;
