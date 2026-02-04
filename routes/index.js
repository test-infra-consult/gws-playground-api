var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET API endpoint for messages */
router.get('/api/message', function(req, res) {
  res.json({
    message: 'Hello from the API!',
    timestamp: new Date().toISOString(),
    version: '1.0.0'
  });
});

/* GET API endpoint to test environment variables */
router.get('/api/env-test', function(req, res) {
  res.json({
    message: 'Environment variables test',
    environment: process.env.ENVIRONMENT || 'not set',
    hasDatabaseUrl: process.env.DATABASE_URL,
    hasApiKey: process.env.API_KEY,
    timestamp: new Date().toISOString()
  });
});

/* GET API endpoint for user info */
router.get('/api/users/:name', function(req, res) {
  res.json({
    name: req.params.name,
    greeting: `Welcome, ${req.params.name}!`,
    timestamp: new Date().toISOString()
  });
});

module.exports = router;
