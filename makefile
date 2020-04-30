# this will build the docker image locally
build:Dockerfile
	docker build -f Dockerfile -t itpp .
#run a container from the image. The `-v` specify a folder which will be sync between the container and the system. Changes in that folder will be remained, but everything else will not be saved after stopping the container.
run:
	docker run -it --rm -v `pwd`/workspace:/root/workspace --name running-itpp itpp
#give the current version a tag for future use
tag:
	docker tag itpp weileizeng/itpp:version1.0
#push the version to docker hub so it is available online. Check image-test to see how to use online image
push:
	docker push weileizeng/itpp:version1.0
clean:
	rm *~
