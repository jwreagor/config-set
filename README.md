ConfigSet
=======

By: Justin Reagor (cheapRoc)

ConfigSet is the only configuration utility you'll ever need for your app, ever (I know it'll be mine). Currently, ConfigSet is just a data structure for storing nested values.

This library came about while building various gems and realizing I needed a level of abstraction to share between them. I really like the functionality of [ahoward/configuration](https://github.com/ahoward/configuration) and I was largely inspired by it, however I noticed that I could implement it six times smaller. I also hope to utilize the base in other forms such as being backed by Redis.


Usage
-----

Extensive samples are in `spec/config_set_spec.rb`, however here is a brief example.

    # Setup your nested configuration items like so...
    App = ConfigSet.for(:development) {
      host "crimesche.me"
      path "/signup"

      ruby {
        path "/ruby"
        port 80
        url "http://#{ host }#{ path }"
      }
    }
    
    # Access your settings
    App.host == "crimesche.me"

    # Parent settings trickle down to nested configuration blocks
    App.ruby.url == "http://crimesche.me/ruby"

    # You can also use regular Ruby accessors outside the block
    App.ruby.path = nil

    # And override existing settings
    App.ruby.url == "http://crimesche.me/signup"


Install
-------

Once I've released it all you have to do is:

`gem install config_set`

In your app...

    require 'rubygems'
    require 'config_set'

    # ...and go to town.

    
Contribute
----------

* Fork the project.
* Make your feature addition or bug fix.
* Messy code is not code, its trash.
* Add specs/tests for it. Your patch or feature won't be looked at otherwise.
* Commit, do not mess with Rakefile, version, gemspec, or spec_helper.
* Send me a pull request on a topic branch in your own repo. I'll include it.
* Commit rights if you have a lot of tested functionality that's relevant to the roadmap.


Copyright
---------

Copyright (c) 2011 Justin Reagor. See LICENSE for details.

