
kubectl apply -f manifests/test-env/infrastructure/namespace.yml
kubectl apply -f manifests/test-env/infrastructure/configMap.yml
kubectl apply -f manifests/test-env/infrastructure/pg-volume.yml
kubectl apply -f manifests/test-env/infrastructure/es-volume.yml
kubectl apply -f manifests/test-env/infrastructure/postgres.yml
kubectl apply -f manifests/test-env/infrastructure/elasticsearch.yml
kubectl apply -f manifests/test-env/infrastructure/redis.yml

sleep 70

kubectl apply -f manifests/test-env/micro-services/cart.yml
kubectl apply -f manifests/test-env/micro-services/order.yml
kubectl apply -f manifests/test-env/micro-services/user.yml
kubectl apply -f manifests/test-env/micro-services/product.yml
kubectl apply -f manifests/test-env/micro-services/frontend.yml

sleep 70

kubectl apply -f manifests/test-env/infrastructure/gateway.yml
