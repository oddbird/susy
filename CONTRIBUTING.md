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

- Write a clear, descriptive commit message
- Include any appropriate unit tests,
  and make sure all tests are passing (`npm run test`)
- Add your changes to the [changelog](CHANGELOG.md)
- Update or write appropriate [SassDoc](http://sassdoc.com/)
  inline documentation for your changes
- Keep it simple: one bug fix or feature per pull request


Development
-----------

Set up your dev environment
with the appropriate ruby and/or js dependencies:

```
# for ruby sass:
gem install bundler
bundle install

# for libsass:
yarn
```


Committing
----------

Linting, testing, and documentation
should be done before every commit:

```
npm run commit
```

They can also be triggered individually:

```
# lint
npm run lint

# test with mocha/node-sass and ruby sass
npm run test

# compile docs
npm run docs
```

Optionally use `npm run test-libsass` for js-only tests,
or `rake test` for ruby-only environments.

Once you've fixed any final errors or typos,
commit your changes, and submit a pull request!
