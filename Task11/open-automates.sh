for dir in */ ; do
  echo "Running Docker Compose in $dir"
  cd "$dir"
  docker-compose up -d
  cd ..
done
