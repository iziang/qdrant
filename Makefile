PLATFORMS := linux/amd64
IMAGE_REGISTRY := apecloud-registry.cn-zhangjiakou.cr.aliyuncs.com
IMAGE_TAG := v1.10.0-debug

docker:
	# Create cache directories with proper permissions
	DOCKER_BUILDKIT=1 docker buildx build --platform $(PLATFORMS) \
		--build-arg SOURCES=true \
		--build-arg PACKAGES=linux-perf \
		--build-arg FEATURES=tracing \
		--tag=$(IMAGE_REGISTRY)/apecloud/qdrant:$(IMAGE_TAG) \
		--network=host \
		--load \
		.
