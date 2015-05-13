# Url Shortener

##dependencies
* Ruby version ruby "2.2.1"
* mongodb

### install mongodb with homebrew

```
$ brew update
```

```
$ brew install mongodb
```

```
$ mkdir -p /data/db
```

```
$ cd /data/db
```

```
$ mongod 
```

### Development

from the directory you would like to store the project.

```
$ git clone git@github.com:jojo89/url_shortener.git
```

```
$ cd url_shortener
```

```
$ bundle install
```

```
$ rails s
```
 
 Your Application will be available at localhost:3000
 
### Test

 to run all specs 
```
$ bundle exec rspec
```
to run an individual spec do the same,but add the file extentsion

 i. e.
```
$ bundle exec rspec spec/controllers/links_controller_spec.rb
```

### production

project is hosted at https://shortenerd.herokuapp.com/


### Notes 
  I decided to make this project a rails app because I find it the easiest framework to build a proof of concept
quickly, but it also gives you everything you need to make the mvp into a product. I used Mongo for my database.
I felt like it was a good choice for the sake of speed and scalability. since the app doesn't require a user to login,
it only required one database table and mongo has a pretty robust library on querying an individual table.
At the moment the apps functionality doesn't require complicated querying, but in the event that it does in the future
mongo is capable of what I would need.(querying based on a user, domain, and creation_date). I'm using jquery 
for my front-end code. I think jquery is very useful in this kind of situation where you have a small rails project
and you're using the rails helpers in the views. I'm using rspec to test my controllers and models. The reason
being it's the most well supported ruby testing suite and I know it pretty well.


####The creating a short url process

1.  User types a url into the input and submits
2.  The server looks for a record with the same url
3.  If it finds it and returns the tiny url
4.  If it doesn't find the url it creates a new record and returns the tiny url
5.  It validates the url
6.  If the url is in invalid it return a string suggesting the user may have forgotten the http protocol

####The redirection process

1.  the user visits the tiny url. (The tiny url is a unique token generate for each url concatenated to the application url and "/l/")
2.  The url is then found by it's token and redirects to the original url
3.  If the token doesn't exist in the db it returns a 404

### Struggles
  The two biggest struggles I've had is first preventing the form from submitting and coming up with a 
  way to get a short unique index for the tiny url. I couldn't use mongo's uid because it's so long that it
  defeats the purpose of the tiny url. luckily I found a great gem called mongo_token that gave me just that. 
  As for the form being prematurely submitted It has been behaving lately, but I think the best solution would be using a framework
  with two-way data binding.
  
### Possible Expansion
 I'd like to deploy it like a big boy without heroku. I haven't done a lot of ops stuff, so I think it
 could be a good opportunity to learn. I also think the app is simple enough I could move the front-end into 
 an angular application and just use rails as an api.


