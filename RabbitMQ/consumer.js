import amqp from "amqplib";

async function receive() {
  const queue = "hello";

  const connection = await amqp.connect("amqp://localhost");
  const channel = await connection.createChannel();

  await channel.assertQueue(queue, { durable: false });

  console.log("📥 Waiting for messages in", queue);
  channel.consume(queue, (msg) => {
    console.log("💌 Received:", msg.content.toString());
  }, { noAck: true });
}

receive();