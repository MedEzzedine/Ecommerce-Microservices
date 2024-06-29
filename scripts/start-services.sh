docker compose down
docker compose up -d db redis elasticsearch product cart order user ui
timeout 40
docker compose up -d gateway