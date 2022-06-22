#!/bin/bash

echo "starting!"
curl http://127.0.0.1:5000/api/timeline_post

echo "first post coming up!"
curl --request POST http://127.0.0.1:5000/api/timeline_post -d 'name=mario&email=mario@gmail.com&content=first endpoint!'

echo "second post coming up!"
curl --request POST http://127.0.0.1:5000/api/timeline_post -d 'name=mario&email=mario@gmail.com&content=second endpoint!'

echo "second get!"
curl http://127.0.0.1:5000/api/timeline_post