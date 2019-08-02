workflow "Build and deploy on push" {
  resolves = [
    "master branch only",
    "Push to Docker Hub",
  ]
  on = "push"
}

action "master branch only" {
  uses = "actions/bin/filter@0dbb077f64d0ec1068a644d25c71b1db66148a24"
  args = "branch master"
}

action "Build image" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "build -t danjohnson95/php-mongodb-1.5.3-alpine:latest"
  needs = ["master branch only"]
}

action "Log in to Docker Hub" {
  uses = "actions/docker/login@86ff551d26008267bb89ac11198ba7f1d807b699"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["Build image"]
}

action "Push to Docker Hub" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "push danjohnson95/php-mongodb-1.5.3-alpine:latest"
  needs = ["Log in to Docker Hub"]
}
