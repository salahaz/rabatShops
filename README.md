# Nearby Shops

This web application is intended to display restaurents that are near to the user, and allows the user to have a set of favorites.

The following link contains a live demo and to any further updates:
`https://rabatshops2l19.herokuapp.com/`


## Built With

* Ruby on Rails -- server-side framework

* MongoDB -- NoSQL database

* Bootstrap -- CSS Framework

## Deploying Locally

Import the BSON file to the local collection 

```shell
$ mongorestore --drop -d rabat_shops_development -c shops <file path>
```

To make sure the connection has been establsihed run Rails Console to call the Shop class methods

```ruby
$ bundle install

$ rails c
Loading development environment (Rails 5.2.3)
> Shop.collection
 => #<Mongo::Collection:0x70181725138340 namespace=nearby_shops_development.shops> 

> Shop.collection.find.count
 => 341

> Shop.all.first
 => {"_id"=>BSON::ObjectId('5a0c6711fb3aac66aafe26c7'), "picture"=>"http://placehold.it/150x150", "name"=>"Canopoly", "email"=>"leilaware@canopoly.com", "city"=>"Rabat", "location"=>{"type"=>"Point", "coordinates"=>[-6.77404, 33.80354]}}

``` 

To run on the browser run on the root folder of the project

```shell
$ rails s
```

Go to the following URL:

`http://localhost:3000/`