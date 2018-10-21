# Package configuration
PROJECT = travis-helm-deploy-test

# Including ci Makefile
CI_REPOSITORY ?= https://github.com/src-d/ci.git
CI_PATH ?= $(shell pwd)/.ci
CI_BRANCH ?= v1

# Deployment
HELM_RELEASE = travis-helm-deploy-test
HELM_CHART = bblfshd
HELM_ARGS = "--repo https://src-d.github.io/charts/ --dry-run --debug"

MAKEFILE := $(CI_PATH)/Makefile.main
$(MAKEFILE):
	git clone --quiet --depth 1 --branch $(CI_BRANCH) $(CI_REPOSITORY) $(CI_PATH);

-include $(MAKEFILE)
