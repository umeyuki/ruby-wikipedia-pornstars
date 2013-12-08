ruby-wikipedia-pornstars
========================

ruby wikipedia ponrstars sraping script.

[AV女優一覧](http://ja.wikipedia.org/wiki/AV%E5%A5%B3%E5%84%AA%E4%B8%80%E8%A6%A7)

Support ruby version over 2.0

## How to use?

1. Setup sqlite3 database.

    ~~~ sh
        $ sqlite3 ./db/pornstar.db
        sqlite>.read ./etc/inital_tables.sql
        sqlite>.q
    ~~~

2. Bundle install.

    --- sh
        $ bundle install 
    ---

3. Execute script.

    --- sh
        $ bundle exec \-\- ruby wikipedia-pornstars.rb
    --- 