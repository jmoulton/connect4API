# Connect 4 API

This Application is the back-end service for Connect4. It scores
the board and tells the client when the game is over. This server also
stores each move and each game played.

https://github.com/jmoulton/connect4

* Ruby version: 2.2.3p173
* Rails version: 5.0.0.1

First run:

`bundle install`

Create new database:

`rake db:create
 rake db:migrate`

Start server on port 3000:

`rails server`

*TODO*

* Compile results of each game and serialize them for the client at the
    end of a match
