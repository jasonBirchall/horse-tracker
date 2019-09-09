IMAGE := json0/horse-tracker
TAG := 0.1

build:
	docker build -t $(IMAGE) .

push:
	docker tag $(IMAGE) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)

shell:
	docker run --rm -it \
		-v $${PWD}/spec:/app \
	$(IMAGE):$(TAG) sh

test:
	docker run --rm \
		-v $${PWD}/spec:/app \
	$(IMAGE):$(TAG) rspec
