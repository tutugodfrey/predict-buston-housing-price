#!/usr/bin/env bash

IMAGE_REPO=tutug
IMAGE_NAME=boston-house-model
CONTAINER_NAME=buston-house-app
PORT=8082

function run_docker_help() {
  echo """
    Get help by providing the flags "-h" or "--help"

    To build and run images run the following functions
    build_image: accepts 2 optional arguments to override the default. ARG 1 IMAGE_REPO, ARG 2 IMAGE_NAME. 

    run_container: Accept 2 optional arguments to override the defaults. ARG 1 PORT 
    ARG 2 CONTAINER_NAME.
    
    list_images: List the available docker images, no arguments required
    
   """
}

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
  echo "Hello arg $1"
  run_docker_help
  return 0;
fi

# Build image with tag
function build_image () {
  if [[ $# == 2 ]]; then
    IMAGE_REPO=$1
    IMAGE_NAME=$2
  elif [[ $# == 1 ]]; then
    IMAGE_REPO=$1
  fi
 
  docker build -t $IMAGE_REPO/$IMAGE_NAME .
}

# List docker images
function list_images () {
  docker images
}

# Run flask app
function run_container () {
  if [[ $# == 2 ]]; then
    PORT=$1
    CONTAINER_NAME=$2
  elif [[ $# == 1 ]]; then
    PORT=$1
  fi

  docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_REPO/$IMAGE_NAME python3 app.py | tee output_txt_files/run_container_output.txt
  grep "already in use" output_txt_files/run_container_output.txt
  echo $? last commandss
  if [[ $? == 0 ]]; then
    docker container stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_REPO/$IMAGE_NAME python3 app.py | tee output_txt_files/run_container_output.txt
  fi
}

# Using IMAGE REPO and the image name to upload to repository
function upload_image () {
  docker push $IMAGE_REPO/$IMAGE_NAME
}
