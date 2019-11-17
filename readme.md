
```
docker build -t spark-builder -f Dockerfile.build .
docker run -tv "$(pwd)/cache:/mnt" spark-builder

./make-image.sh -m
```
