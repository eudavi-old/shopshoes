# Shopshoes

E-Commerce developed to Systems Analysis, Projects and Development with RoR.

### Clone the repository

```shell
git clone https://github.com/Davigl/shopshoes.git
cd shopshoes
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

### Install dependencies


```shell
`bundle install`
```

### Initialize the database

```shell
rails db:create db:migrate
```

## Server

```shell
rails s
```
