build:
	docker build -t upstride/deep-complex-networks:1.0 -f dockerfile .

build_cpu:
	docker build -t upstride/deep-complex-networks:1.0.cpu -f cpu.dockerfile .

run:
	@docker run -it --rm --gpus all --privileged \
		--name deep-complex-networks \
		-v $$(pwd):/opt \
		-v /tmp/docker:/tmp \
		-e PYTHONPATH=/opt \
		-w /opt \
		upstride/deep-complex-networks:1.0 

run_cpu:
	@docker run -it --rm \
		--name deep-complex-networks \
		-v $$(pwd):/opt \
		-v /tmp/docker:/tmp \
		-e PYTHONPATH:/opt \
		-w /opt \
		upstride/deep-complex-networks:1.0.cpu