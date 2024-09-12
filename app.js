const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const dotenv = require("dotenv");
const cors = require('cors');  // Importa el paquete cors

dotenv.config();

var indexRouter = require('./src/routes/index');
var loginRouter = require('./src/routes/loginRoutes');
var authRoutes = require('./src/routes/authRoutes');
var rolRouter = require('./src/routes/rolRouter');

const app = express();

// Configura CORS para permitir solicitudes desde el origen específico
app.use(cors({ origin: 'http://localhost:4200' }));  // Cambia el origen si es necesario

// view engine setup
app.set('views', path.join(__dirname, 'src','views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.get('/check-env', (req, res) => {
  res.send(`NODE_ENV: ${process.env.NODE_ENV}`);
});

// Configuración de las rutas de la aplicación
app.use('/', indexRouter);
app.use('/authenticate', loginRouter);
app.use('/auth', authRoutes);
app.use('/rol', rolRouter);

// Middleware para capturar errores 404 y redirigir al index
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
