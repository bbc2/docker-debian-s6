IMAGE_TARGETS = wheezy jessie

.PHONY: all $(IMAGE_TARGETS)

all: $(IMAGE_TARGETS)

$(IMAGE_TARGETS):
	docker build -t "bbc2/debian-s6:$@" "docker/$@"
