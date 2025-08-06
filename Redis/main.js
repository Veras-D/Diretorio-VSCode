import { createClient } from "redis";

const client = createClient();

client.on("error", (err) => console.log("❌ Redis Error", err));

await client.connect();

await client.set("username", "veras_d");

const username = await client.get("username");
console.log("🎯 Username from Redis:", username);

await client.quit();