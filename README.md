# Тестовое задание DevOps разработчик

1. [Первичная установка](docs/project_install.md)
1. [Задание](docs/assignment.md)


# Установка CERT MANAGER
helm repo add jetstack https://cherts.jetstack.io
helm repo update 
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.14.3 \

# Запуск в minikube
# Включение Ingress controller в minikube
minikube addons enable ingress

# Запуск DEV
helm secrets install dev ./deploy/ -f ./deploy/values/dev/values.yaml -f ./deploy/values/dev/secrets.yaml -n dev --create-namespace

# Запуск PROD
helm secrets install prod ./deploy/ -f ./deploy/values/prod/values.yaml -f ./deploy/values/dev/secrets.yaml -n prod --create-namespace

# Запуск STAGE 
helm secrets install stage ./deploy/ -f ./deploy/values/stage/values.yaml -f ./deploy/values/stage/secrets.yaml -n stage --create-namespace