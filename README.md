# Twitter Clone

This is the sample application for [*Ruby on Rials Tutorial: Learn Web 
Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](http//www.michaelhartl.com).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting Started

To get started with the app, clone the repo and then install the needed gems:

```sh
$ bundle install --without production
```

Next, migrate the database:

```sh
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```sh
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local erver:
```sh
$ rails s
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).