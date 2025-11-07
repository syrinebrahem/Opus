Fonctions:
- Multi-stage Dockerfile pour Node.js
- docker-compose pour dev
- Kubernetes manifests (deployment, service)
- GitHub Actions workflow: lint + build on push
- Terraform example 


How to run locally:
1. Build & run with Docker Compose:
   docker compose up --build
2. Test:
   curl http://localhost:3000/

K8s:
- kubectl apply -f k8s/

CI:
- push to repo; workflow runs on push to main.

Terraform:
- cd terraform
- terraform init && terraform apply
