#!/bin/bash

imageId=$(docker inspect registry.heroku.com/digger-app/web:latest --format={{.Id}})
payload='{"updates":[{"type":"web","docker_image":"'"$imageId"'"}]}'
curl -n -X PATCH https://api.heroku.com/apps/digger-app/formation \
-d "$payload" \
-H "Content-Type: application/json" \
-H "Accept: application/vnd.heroku+json; version=3.docker-releases" \
-H "Authorization: Bearer 654c0172-24a9-43f2-996a-4f01e5248918"
