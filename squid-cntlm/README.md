Docker Squid-Cntlm
==================

Requirements
------------
1. Docker
2. Docker-Compose (Optional)

Quick Start
-----------

1. You can pull from docker hub
	```docker pull budtmo/squid-cntlm```

    OR you can build by yourself:
	```
    docker build -t budtmo/squid-cntlm \
	--build-arg BASE_IMAGE="ubuntu:focal-20220113" \
	--build-arg TOOL_VERSION="4.10-1ubuntu1.5" \
	--build-arg RELEASE_TAG_VERSION="4.10-1ubuntu1.5-p1" .
	```


Development
-----------

1. Run following command to release the docker image
	```
	./release.sh
	```
