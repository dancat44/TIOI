# TIOI
```
docker build -t image-lr1 .

docker run --rm --name lr1-2020-4-04 -p 8000:80 image-lr1

sudo docker build --build-arg PROXY=http://LOGIN:PASSWD@192.168.232.1:3128 -t image-lr1 .

docker build -t image-lr1 .

docker run --rm -v "${PWD}/app":/code/app --name lr1-2020-4-04 -p 8000:80 image-lr1
```