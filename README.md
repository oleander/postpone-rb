# Postpone

A [Beanstalkd](http://kr.github.com/beanstalkd/) backed asynchronous priority queue.

## Why beanstalkd?

In contrast to other asynchronous priority queues Beanstalkd doesn't use  
polling behind the scene. This means that your jobs will start faster.

## Installation

Add this line to your application's Gemfile:
``` ruby
gem "postpone"
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```    
$ gem install postpone
```

## Invoke

Call `postpone` on any given object to *postpone* the execution.

``` ruby
User.first.postpone.notify!
```

*Postpone* **cannot** postpone blocks. Why is explained [here](http://stackoverflow.com/a/38588/560073).

``` ruby
User.first.postpone.notify! { "How do you do?" }
```

## Worker

*Postpone* is build on top of [beanstalkd](http://kr.github.com/beanstalkd/) and [stalker](https://github.com/adamwiggins/stalker) which means that you need an external worker.

### Creating a worker

Create a file called `jobs.rb` and add the following code to it

``` ruby
require "postpone/worker"
```

Add your own worker to the same file, if you have any.  
Take a look at the [official stalker repo](https://github.com/han/stalker) for more information.

``` ruby
Stalker::job "email.send" do |args|
  Pony.send(to: args['to'], subject: "Hello there")
end
```

Start your worker using `stalk jobs.rb`

## Hint

Keep in mind that the object you are trying to *postpone* needs to be available on both sides.
So if you're trying to *postpone* an operation on a rails object you need to load the rails environment on the worker side too.

``` ruby
# Loading rails
require File.expand_path("../environment", __FILE__)

# Loading postpone
require "postpone/worker"
```

## Alternatives

- [Delayed job](https://github.com/tobi/delayed_job) 
- [resque](https://github.com/defunkt/resque)

## Testing

Start by installing [rspec](https://github.com/dchelimsky/rspec).  
Then, run the tests using `rspec .`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

*Postpone* is released under the *MIT License*.