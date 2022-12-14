const { Pool } = require('pg')
// const secrets = require('../secrets')

/* const config = {
  user: secrets.db_user,
  host: secrets.db_host,
  database: secrets.db_name,
  password: secrets.db_pass,
  min: 3,
  max: 6,
  idleTimeoutMillis: 3000,
  connectionTimeoutMillis: 2000,
  port: 5432
} */

// const pool1 = new Pool(config)
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
})

module.exports = {pool};
