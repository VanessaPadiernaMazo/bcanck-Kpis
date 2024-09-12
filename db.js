const knex = require('knex')({
  client: 'mysql',
  connection: {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  },
  pool: { min: 0, max: 10 },
});

// Probar la conexión a la base de datos
knex.raw('SELECT 1')
  .then(() => {
    console.log('Conectado a la base de datos con éxito');
  })
  .catch((err) => {
    console.error('Error al conectar a la base de datos:', err.message);
    // Opcional: Cerrar la conexión o salir de la aplicación si hay un error de conexión grave
    process.exit(1); 
  });

module.exports = knex;
