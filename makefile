IMAGE := json0/horse-tracker
TAG := 0.2

build:
	docker build -t $(IMAGE) .

push:
	docker tag $(IMAGE) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)

shell:
	docker run --rm -it \
		-v $${PWD}:/app \
	$(IMAGE) bash

test:
	docker run --rm \
		-v $${PWD}/spec:/app \
	$(IMAGE):$(TAG) rspec
