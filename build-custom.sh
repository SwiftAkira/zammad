#!/bin/bash

# Zammad Custom Build Script
# This script builds and optionally pushes a custom Zammad Docker image

set -e

# Configuration
DOCKER_REPO="${DOCKER_REPO:-yourdockeruser/zammad-custom}"
CUSTOM_VERSION="1.0.0"
BUILD_DATE=$(date +%Y%m%d)
COMMIT_SHA=$(git rev-parse --short HEAD)
TAG="${TAG:-${CUSTOM_VERSION}-${BUILD_DATE}-${COMMIT_SHA}}"

echo "🚀 Building Zammad Custom Docker Image"
echo "======================================"
echo "Repository: ${DOCKER_REPO}"
echo "Tag: ${TAG}"
echo "Commit SHA: $(git rev-parse HEAD)"
echo "Build Date: $(date)"
echo "======================================"

# Build the image
echo "📦 Building Docker image..."
docker build \
  --build-arg COMMIT_SHA=$(git rev-parse HEAD) \
  --tag ${DOCKER_REPO}:${TAG} \
  --tag ${DOCKER_REPO}:latest \
  .

echo "✅ Build completed successfully!"
echo ""
echo "🏷️  Tagged as:"
echo "   ${DOCKER_REPO}:${TAG}"
echo "   ${DOCKER_REPO}:latest"
echo ""

# Ask if user wants to push
read -p "📤 Push images to registry? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📤 Pushing images..."
    docker push ${DOCKER_REPO}:${TAG}
    docker push ${DOCKER_REPO}:latest
    echo "✅ Images pushed successfully!"
    echo ""
    echo "🎯 Deployment command:"
    echo "helm upgrade zammad-release zammad/zammad-helm \\"
    echo "  --set image.repository=${DOCKER_REPO} \\"
    echo "  --set image.tag=${TAG}"
else
    echo "⏭️  Skipping push. Run manually with:"
    echo "   docker push ${DOCKER_REPO}:${TAG}"
    echo "   docker push ${DOCKER_REPO}:latest"
fi

echo ""
echo "🎉 Build process completed!" 