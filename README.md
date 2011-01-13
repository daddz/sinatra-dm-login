# sinatra-dm-login - A simple login example with Sinatra and Datamapper

## Update

I updated all files to work with the new gem versions and ruby 1.9.2
I'm sorry for doing it that late!

## Ideas

If you have anything you want to see in this example, go ahead and let me know!

## Requirements

- sinatra

- datamapper

- do_sqlite3

- rake

- rack

## Usage

- `rake db:migrate`

- `rake db:testusers`

- `ruby app.rb`

- visit http://localhost:4567

## Test users

The following dummy users get created:

- name: test | password: pw

- name: foo  | password: bar

## Thanks

I used the model authentication code from a very very old blog post but I don't remember where it was. Thanks to the guy who wrote the blog post.
If someone knows the link let me know so I can add it here.