# docker-skeleton-rails
Docker skeleton stack for Rails, providing simple commands and allowing the mapping of the current user.

[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](./CONTRIBUTING.md)

## How to use:
```sh
PROJECT_DIR=
git clone --depth=1 --branch=main git@github.com:thiagosxsantos/docker-skeleton-rails.git $PROJECT_DIR
cd $PROJECT_DIR
rm -Rf .git
docker-compose run --no-deps web rails new . --force --javascript esbuild --css tailwind --database=postgresql
sudo chown -R $USER:$USER .
```