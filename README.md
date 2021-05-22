# Predict-buston-housing-price
The project will deploy and operationalize machine learning model built to predict the price of houses in Buston

[![CircleCI](https://circleci.com/gh/tutugodfrey/predict-buston-housing-price.svg?style=svg)](https://circleci.com/gh/tutugodfrey/predict-buston-housing-price)


# Deploy with Docker

# Deploy with Kubernetes

Create a Deployment and Service of the application.

```bash
kubectl create -f k8s-deployment-template.yml

```

The service is expose via NodePort, therefore you want to get the node IP of the cluster to test the deployment.

```bash
kubectl get node -o wide

```
Copy the public IP of a node and use it for the test as shown below.

To test provide the Port number 31000 and NodeIP to the make-prediction script

```bash
export HOSTP=HOST_IP
export PORT=31000

```
or 

```bash
HOST=HOST_IP
PORT=31000

```

```bash
./make_prediction.sh $PORT $HOST

```
If all goes well, you see the prediction by the model.

### View Logs

To view logs by the application

get the Pod

```bash
kubectl get pod

```

Replace POD_NAME in the command below with the name of the Pod created.

```bash
kubectl logs POD_NAME --container boston-house-model

```
