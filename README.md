ruby-wikipedia-pornstars
========================

ruby wikipedia ponrstars sraping script.
Support ruby version over 2.0

## How to use?

1. Setup sqlite3 database.

    ~~~ sh
        $ sqlite3 ./db/wikipedia_pornstar.db
        $ read ./etc/inital_tables.sql
    ~~~

2. Bundle install
    --- sh
        $ bundle install --path vendor/bundle
    ---

3. Execute
    --- sh
        $ bundle exec -- ruby wikipedia-pornstars.rb
    --- 