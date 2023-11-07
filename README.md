# Running Tests with Kind and Helm

This repository includes a Makefile that automates the process of setting up a Kind cluster, building and loading a Docker image, deploying a Helm chart, and running Helm tests. This guide will show you how to use the Makefile for your testing workflow.

## Prerequisites

Before you begin, make sure you have the following prerequisites installed:

- [Docker](https://www.docker.com/)
- [Kind (Kubernetes in Docker)](https://kind.sigs.k8s.io/)
- [Helm](https://helm.sh/)
- Your Helm chart and application code.

## Usage

1. **Clone this repository to your local machine:**

   ```bash
   git clone <repository-url>
   ```

2. **Navigate to the project directory:**

   ```bash
   cd <repository-directory>
   ```

3. **Update the Makefile:**

   - Modify the variables in the Makefile to match your project requirements. Replace placeholders like `RELEASE_NAME`, `CHART_PATH`, `NAMESPACE`, and `APP_IMAGE` with your actual project values.

4. **Run the tests:**

   ```bash
   make all
   ```

5. **Check results:**

   - After running the tests, you can view the test results in the log file specified in the Makefile (by default, it's test-log.txt).

6. **Clean up:**

   ```bash
   make clean
   ```