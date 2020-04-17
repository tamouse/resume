# Statically built personal resume. #

Utilizing Middleman and Twitter Bootstrap 3.

## Configuration ##

The build script will manage everything needed to make a static site from middleman.

The deploy script will change the name of the build directory do docs, add everything that's updated, commit the changes with a timestamp and push to master in the repo defined by origin.

## Development ##

### Prerequisites ###

- bundler
- rake

### Initialize ###

make sure to perform a `bundle install`
- you may need to update bundler; if so it will tell you to run `bundle update --bundler`

### Dev Server ###

    rake
	
or

    rake serve

### Build the site ###

    rake build

### Deploy the site ###

    rake deploy

(This will also run `rake build`)
