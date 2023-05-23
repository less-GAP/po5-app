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

### Without Docker

#### Install required tools and dependencies

1. HomeBrew - https://brew.sh/
2. Install required packages: GPG, Mysql8, Redis, ImageMagick, and VIPS

      ```bash
      brew install gpg postgresql redis imagemagick vips
      createuser -P -d postgres
      ```

3. RVM - https://rvm.io/
4. NVM - https://github.com/nvm-sh/nvm
5. Ruby - `rvm install 3.2.0`
6. Node - `nvm install`
7. Yarn - `npm -g install yarn`
8. Install Docker for mac as well

#### Get Source code

get store_outlet and store_outlet_admin_module at the same directory

#### Run setup script
```
docker-compose up mysql redis
rm -rf .env && cp -f .env.sample .env
update file .env
bundle install
yarn install
bin/rails db:create
bin/rails db:migrate
bin/rails log:clear tmp:clear
bundle exec rails db:seed
bin/rails s
```
### Development Setup (JavaScript)

When working on the JavaScript in Spree Dashboard locally, you will need to yarn link your local development copy of `@spree/dashboard`, to the Rails app you are working in, so that your changes are picked up and represented live in the view.


From the root of `spree_backend` run:

```bash
yarn link
```

Next, from the root of the Rails app you are using to develop run:

```bash
yarn link "@spree/dashboard"
```

Once your local Spree Dashboard is linked with the Rails app you are using for development you will need two terminal tabs open,
one at the root of your Rails app, and one at the root of `spree_backend`.

In the terminal window at the root of the `spree_backend` run:

```bash
yarn watch
```

And from the Rails app you are using to run Spree and develop in run the following:

```bash
bin/dev
```


