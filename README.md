# Susy [a Compass plugin]

Susy is a semantic CSS grid system with a responsive twist.

The web is a responsive place,
from your lithe & lively development process
to your end user's super-tablet-multi-magic-lap-phone.
You need grids that are powerful, but custom;
reliable, but responsive.

Susy grids are fluid on the inside,
ready to respond at any moment,
but contained in the candy shell of your choice,
so they respond how and when and where you want them to.

This isn't another one-size-fits-all grid framework
that will make your sites look identical
and litter your markup with meaningless "col2of5" jargon.
We don't design your site or write your markup,
we just do the math and get out of your way.

## Resources
- [Website](http://susy.oddbird.net)
- [Changelog](https://github.com/ericam/susy/blob/master/CHANGELOG.mkdn)
- [Tutorial](http://susy.oddbird.net/guides/getting-started/)
- [Reference](http://susy.oddbird.net/guides/reference/)
- [Sites using Susy](http://susy.oddbird.net/sites-using-susy/)
- [Twitter @CompassSusy](http://twitter.com/compasssusy/)

## Contributing

We love contributions,
both as ideas and pull requests.
The core of Susy is all in the `/sass/` directory.

Once you make changes,
you can test them by building the gem
and installing it somewhere to test.
We also have unit tests that you can run.

### Building the gem

You'll need Rake and Echoe installed:

```bash
# command line
gem install rake
gem install echoe
```

It might be helpful to bump the version number in `VERSION`,
but any changes you make there
should not be committed.

Then you can build:

```bash
# command line
rake build
```

Your new gem will appear in
a folder called `pkg`.
You can install it for testing
directly from there.

```bash
# command line
gem install <path-to-file>
```

### Building the docs

If you are adding features
or changing how a current feature works,
your changes should be documented.
Or you might be helping us maintain the docs.
In either case,
you'll need to run the docs dev server
in order to see your changes.

In the `docs` folder:

```bash
# command line
gem install bundler
bundle install
```

The site is built with
[middleman](http://middlemanapp.com/).
To run the development server:

```bash
# command line
middleman
```

The server should now be running at `localhost:4567`.

Make any changes you need
under the `source` directory,
then commit your changes
and submit a pull request when you are done!

### Tests

The tests we have are very basic at this point.
Simply go into the `test` directory
(with the latest Sass and Compass gems installed)
and run `compass compile --force`.

There should be no changes.
If there are changes,
go back and find what caused the change.
If the change was intentional,
simply commit the changed test files.
If it was not intentional,
go back and find what caused the problem.

Use `git diff` to see the changes.
