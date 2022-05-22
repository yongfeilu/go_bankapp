# Go Backend Bank Web Service

__A simple bank application to enable users to manage their bank accounts written in Go__

* 1. Built Restful HTTP JSON APIs using Gin, implemented the Gin authentication middleware to authorize API requests with JWT/ Paseto, and enabled HTTPS by adding TLS to secure the connection.
* 2. Wrote strong unit tests for HTTP APIs using Gomock and achieved 100% coverage.
* 3. Built a CI/CD pipeline with Github Actions to achieve automation of unit tests, application Dockerization, and deployment using AWS ECR, RDS, and EKS services.
* To run the application locally, simple type ``make server`` in your terminal, or use Postman to send requests to https://api.bankapp.link/[path] (see api/server.go for more info)
  