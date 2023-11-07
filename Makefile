# Makefile

# Define the variables
RELEASE_NAME = test-app
CHART_PATH = ./helm/test-app
NAMESPACE = default
APP_IMAGE = ng-lua
KIND_CLUSTER = my-cluster
LOG_FILE = test-log.txt

# Create a Kind cluster
create-kind-cluster:
	kind create cluster --name $(KIND_CLUSTER)

# Build the Docker image
build-docker-image:
	docker build -t $(APP_IMAGE) .

# Load Docker image into Kind cluster
load-image-into-kind:
	kind load docker-image $(APP_IMAGE) --name $(KIND_CLUSTER)

# Deploy the Helm chart
deploy-helm-chart:
	helm upgrade --install $(RELEASE_NAME) $(CHART_PATH) -n $(NAMESPACE) --set image.repository=$(APP_IMAGE),image.tag=1.0

# Run Helm tests
run-helm-tests:
	helm test $(RELEASE_NAME) -n $(NAMESPACE) > $(LOG_FILE)

# Pause after creating Kind cluster
pause:
	sleep 30  # Adjust the duration (in seconds) as needed

# Clean up
clean:
	kind delete cluster --name $(KIND_CLUSTER)
	rm -f $(LOG_FILE)

# Define the default target
.PHONY: all
all: create-kind-cluster pause build-docker-image load-image-into-kind deploy-helm-chart run-helm-tests
