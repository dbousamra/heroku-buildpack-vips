heroku-buildpack-vips
=====================

Heroku buildpack with [libvips](https://github.com/jcupitt/libvips) installed.

Current vips version is 7.38.4 with webp 0.4.0 and orc 0.4.18

## Usage

Point the BUILDPACK_URL config or add to your .buildpacks this:

```
https://github.com/alex88/heroku-buildpack-vips.git
```

or, if you want to stick with a version:

```
https://github.com/alex88/heroku-buildpack-vips.git#7.38.4.0
```

PS: You can even use the `ruby-vips` gem ;)

## Version

Buildpack is tagged with the vips version it uses with the scheme of `vips-mayor`.`vips-minor`.`vips-pl`.`buildpack-pl`

## Contribute

Open a damn issue or pull request (way appreciated) ;)

## Build script

I used the `run.sh` to generate the actual libvips binary. It's what the scripts in `bin` use.