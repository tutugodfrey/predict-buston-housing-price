#!/usr/bin/env bash

IMAGE_REPO=tutug
IMAGE_NAME=boston-house-model
CONTAINER_NAME=buston-house-app
PORT=8082

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --name mypod $IMAGE_REPO/IMAGE_NAME

kubectl run buston-house-app --image=tutug/boston-house-model
kubectl expose pod buston-house-app --port 8082


# Step 3:
# List kubernetes pods

# Step 4:
# Forward the container port to a host

