# Spree-checkout

An Ember.js application to handle Spree checkout.

## Prerequisites

You'll need a Spree store running at on [localhost on port 3001](http://localhost:3001).

* `cd Code/my_spree_store`
* `bundle exec rails server -p 3001`

For now, authentication stuff is not yet ready. You'll need your user to have
the following spree_api_key:

`f1d12fc2051b5f596d7460a35561a1f1a8a5bb2fb26f695d`

You can easily set it with something like this on the rails console:

```
Spree::User.first.update_attribute(:spree_api_key, 'f1d12fc2051b5f596d7460a35561a1f1a8a5bb2fb26f695d')
```

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `npm install -g ember-cli`
* `npm install -g bower`
* `npm install -g phantomjs`
* `ember install`

## Running / Development

* `ember server`
* Visit your app at [http://localhost:4200](http://localhost:4200).

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details

### Running Tests

* `ember test`
* `ember test --server`

### Building

* `ember build` (development)
* `ember build --environment production` (production)

### Deploying

Specify what it takes to deploy your app.
