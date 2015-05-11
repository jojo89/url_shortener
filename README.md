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
Make sure all changes are checked in.
```
$ git push heroku master
```
project is hosted at https://shortenerd.herokuapp.com/


### Notes 

<p>
  I decided to make this project a rails app because I find it the easiest framework to build a proof of concept
quickly, but also gives you everything you need to make the mvp into a product. I used Mongo for my database.
I felt like it was a good choice for the sake of speed and scalability. since the app doesn't require a user login,
it only required one database table and mongo has a pretty robust library on querying an individual table.
At the moment the apps functionality doesn't required complicated querying, but in the event that it did does in the future
mongo is capable of what I would need.(querying based on a user, domain, and creation_date). I'm using jquery 
for my front-end code. I think jquery is very useful in this kind of situation where you have a small rails project
and you're using the rails helpers in the views. I'm using rspec to test my controllers and models. The reason
being it's the most well supported ruby testing suite and I know it pretty well.
</p>

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
3.  If the token doesn't exsist in the db it returns a 404
