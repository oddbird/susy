Contributing to Susy
====================

Susy exists because of your contributions.
Bug reports and feature requests are welcome,
but code is even better!

In all cases,
we ask you to follow the
[Sass community guidelines](http://sass-lang.com/community-guidelines).


Pull Requests
-------------

We use the `master` branch for production-ready code,
and side-branches for everything in-progress
or up-for-debate.

When submitting a patch via pull request:

- Write a clear, descriptive commit message with proper grammar
- Include any appropriate unit tests, and make sure all tests are passing
- Add your changes to the [changelog](CHANGELOG.md)
- Update or write appropriate [SassDoc](http://sassdoc.com/)
  inline documentation for your changes
- Keep it simple: one bug fix or feature per pull request


Developement
------------

Set up your dev environment
with the appropriate dependencies:

```
gem install bundler
bundle install
npm install
```

Linting and testing should be done
before every commit:

```
npm run pre-commit
```

They can also be triggered individually:

```
# lint
npm run lint

# test with mocha/node-sass and ruby sass
npm run test

# run benchmark tests
npm run benchmark
```


Documentation
-------------

Build SassDoc:

```
npm install sassdoc -g
sassdoc sass
```
