
const random = require('random-number-generator')
module.exports.handler = async (event) => {

  const num = random(10000)

  const responseMessage = 'Hello, World! What a success!!!';
  const message = `Random Number: ${num}`;

  return {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      message: `Random Number: ${num}`,
    }),
  }
}
