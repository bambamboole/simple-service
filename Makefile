VERSION ?= latest
REGISTRY ?= 594487216236.dkr.ecr.eu-central-1.amazonaws.com
REPOSITORY ?= simple-service

# Commands
build-and-push: docker-build docker-push

docker-build:
	docker build . --target production --platform=linux/amd64 -t ${REGISTRY}/${REPOSITORY}:${VERSION}
	docker build . --target nginx --platform=linux/amd64 -t ${REGISTRY}/${REPOSITORY}:nginx-${VERSION}

#ecr-login:
#    aws ecr get-login-password --profile test | docker login --username AWS --password-stdin 594487216236.dkr.ecr.eu-central-1.amazonaws.com

docker-push:
	docker push ${REGISTRY}/${REPOSITORY}:${VERSION}
	docker push ${REGISTRY}/${REPOSITORY}:nginx-${VERSION}
