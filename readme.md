
```
docker build -t spark-builder -f Dockerfile.build .
docker run -tv "$(pwd)/cache:/mnt" spark-builder v2.4.4

./make-image.sh -m
```
