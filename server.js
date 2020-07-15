const fastify = require('fastify')({
  logger: true
})

var AWS = require("aws-sdk");

const port = process.env.PORT || 3000;

fastify.get('/aws', (req, res) => {
  var aws_config = new AWS.Config();
  const aws_credentials = {
    aws_access_key_id: aws_config.credentials.accessKeyId,
    aws_secret_access_key: aws_config.credentials.secretAccessKey,
    aws_session_token: aws_config.credentials.sessionToken
  }
  return aws_credentials;
})

// Run the server!
fastify.listen(port, '0.0.0.0', (err, address) => {
  if (err) throw err
  fastify.log.info(`server listening on ${address}`)
})