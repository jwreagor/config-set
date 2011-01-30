
ConfigSet
=========

ConfigSet is the only configuration utility you'll ever need for your app, ever (I know it'll be mine).

At a glance, ConfigSet is just a data structure for storing settings values. I'm hoping that ConfigSet will continue to stay tiny at its core while becoming a general framework for handling configurations using various patterns; persisted, exportable, etc.

This library came about while building various gems and realizing I needed a level of abstraction to share between them. I really like the functionality of [ahoward/configuration](https://github.com/ahoward/configuration) and I was largely inspired by it, however I noticed I could do the same thing in six times the size. I also hope to utilize the base in other forms such as being backed by Redis.

Install
-------

Once I've released it all you have to do is:

`gem install config_set`


Contribute
----------

* Fork the project.
* Make your feature addition or bug fix.
* Messy code is not code, its trash.
* Add specs/tests for it. Your patch or feature won't be looked at otherwise.
* Commit, do not mess with Rakefile, version, gemspec, or spec_helper.
* Send me a pull request on a topic branch in your own repo. I'll include it.
* Commit rights if you have a lot of tested functionality that's relevant to the roadmap.
