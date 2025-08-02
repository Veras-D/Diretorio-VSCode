import amqp from "amqplib";

async function send() {
  const queue = "hello";
  const message = "🐇 Hello from RabbitMQ!";

  const connection = await amqp.connect("amqp://localhost");
  const channel = await connection.createChannel();

  await channel.assertQueue(queue, { durable: false });
  channel.sendToQueue(queue, Buffer.from(message));

  console.log("📤 Sent:", message);

  await channel.close();
  await connection.close();
}

send();