## Local Installation

### Using Docker (Recommended)
#### Install required tools and dependencies:

* [Docker](https://www.docker.com/community-edition#/download)

#### Run setup script

```bash
bin/setup-docker
```

#### (Optional) Import sample data such as products, categories, etc

```bash
docker compose run web rake spree_sample:load
```

#### After the setup is finished, launch the webserver with:

```bash
bin/start-docker
```

### Without Docker (not recommended for beginners)

#### Install required tools and dependencies

1. HomeBrew - https://brew.sh/
2. Install required packages: GPG, PostgreSQL, Redis, ImageMagick, and VIPS

      ```bash
      brew install gpg postgresql redis imagemagick vips
      createuser -P -d postgres
      ```

3. RVM - https://rvm.io/
4. NVM - https://github.com/nvm-sh/nvm
5. Ruby - `rvm install 3.2.0`
6. Node - `nvm install`
7. Yarn - `npm -g install yarn`

#### Run setup script

```bash
bin/setup-no-docker
```

or 
```
1. rm -rf .env && cp -f .env.sample .env
2. update file .env
3. bundle install
4. yarn install
5. bin/rails db:create
6. bin/rails db:migrate
7. bin/rails log:clear tmp:clear
8. bundle exec rails db:seed
9. bin/rails s
```

