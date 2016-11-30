# How does the web work

## Domains and Hosts
- How does the browser know where to go when "theironyard.com" go?
  - Domain names, host names, TLDs
    - _Top Level Domains_ (TLDs) allocated by ICANN
    - Domains registered with a domain registrar
      - Domain ownership specifies a number of things
        - Contact information
        - Main DNS (more on that later)
    - Host names come before the domain name
      - Controlled by the domain owner
  - DNS
    - Domain Name Service
    - Translates a host name, eventually, into an IP address.
  - Lookups and TTLs for DNS
    - DNS results come with a _Time To Live_ (expiry time)
    - Propagating DNS queries
    - This way new DNS entries can be updated
  - How to use `dig`, a tool to look up DNS

    ```sh
    dig gstark.com
    dig online.theironyard.com
    dig amazon.com
    ```

  - Load balancing (multiple A records), fault tolerance
  - Special name for referencing our own host:
    - `localhost` resolves to `127.0.0.1`

## Making Connections
- What happens after resolving the address of a server?
  - Connect to a `service` over a `socket`
  - What service are we talking about (web, email, etc)
  - How does the server know? PORTS
  - Unencrypted web is port 80
    - e.g. http://gstark.com:80
  - Encrypted web is port 443
- How do we connect to one of these ports?
  - Try it like the browser does!
  - Use the tool: `telnet`
  - Now that we are connected, how do we talk?
  - http protocol
    - [documented](https://tools.ietf.org/html/rfc2616)

### HTTP
- GET a page

  ```
  GET / HTTP/1.1
  Host: gstark.com

  ```

  (blank line after Host:)

- Spits back a webpage (and some other stuff)
  - Also headers
  - status codes (404 not found, 500 errors, ...)
  - https://http.cat
- What are other HTTP headers?
  - Date
    _Timestamp on Server_
  - Content-Type
    _How should this content be interpreted_
  - Content-Length
    _How long is this content in bytes_
  - Last-Modified
    _When was this content last modified_
  - ETag
    _A checksum of the content, would be the same value for the same content_

- Other tools
  - curl
  - http (httpie)
- http amazon.com
  - Get back a 301 redirect
  - redirects to `https://amazon.com`
  - which redirects to `https://www.amazon.com`

# Making our first web app

## Sinatra

- Gem for producing web applications

- Initial sinatra (hello world) app

  ```ruby
  require 'sinatra'

  get '/' do
    "Hello, World"
  end
  ```

- Breaking down the sinatra code
  `require 'sinatra'` - require the sinatra library
  `get '/' do` - defines a block of code to run whenever we `GET` the `/` URL
  `"Hello World"` - Whatever the block returns returns becomes the body of the page

- Lets make an _APP_

  ```ruby
  require 'sinatra'

  get '/' do
    %{
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="utf-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <title></title>

          <!-- Bootstrap -->
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

          <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
          <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
          <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->
        </head>
        <body>
          <div class="container">
            <div class="jumbotron">
              <h1>Hello, world!</h1>
              <p>Welcome to our first app!</p>
            </div>
          </div>
          <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
          <!-- Include all compiled plugins (below), or include individual files as needed -->
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        </body>
      </html>
    }
  end
  ```

- HTML is still crammed into our code
- Sinatra views

### Views

- Move all the text from our `get '/' do` to a file `views/home.erb`
- Change block to

  ```ruby
  get '/' do
    erb :home
  end
  ```

- Now our content renders from a specific file (template)
- What is `erb`?

### ERB

- `E`mbedded `R`u`B`y
- Allows us to embed ruby inside of text!
- Simiar to how `#{}` string interpolation works but better!
- Inserting value from a variable

  ```erb
  This is some text from an instance variable: <%= @word %>
  ```

- Evaluating ruby, even a loop

  ```erb
  <% ["How", "Now", "Brown", "Cow"].each do |word| %>
  This is some text from a local variable: <%= word %>
  <% end %>
  ```

- Lets use this in our app!

### Parsing parameters

- How can we send information to our application
- Simplest way is via _query parameters_
- We can tack these on to the end of our URLS: `http://localhost:4567?word=ruby`

  ```ruby
  get '/' do
    @word = params["word"]

    erb :home
  end
  ```

- Add some `ERB` tags to our view

  ```erb
  <div class="well">
    The word you supplied was <%= @word %>
  </div>
  ```

### Links
- This is interesting, but lets add some links to our application
- Multiple _routes_ (URLs) in our application
- see `app_with_links`

### What about forms?
- Lets update our application to show a form where the user can enter a word!
- see `app_with_forms`
- The `action` of a form says what URL the form data is sent to
- The `method` of a form says which HTTP `verb` is used
  - `GET` - Used when the page is `idempotent`
  - `POST` - Used when we might be changing something on the server, or supplying many parameters

### Lets save some data!
- Combining `SQL` + `pg` + `sinatra`
- Lets add the 'pg' gem to our sinatra app
- `require 'pg'`
- Lets create a database:

  ```sh
  createdb words
  ```

- Then lets create a table to store our words

  ```sql
  CREATE TABLE words(id serial, word text);
  ```

- Lets update our `app_with_forms` to show us the words in our database
- Update `get '/show'` to load the words from the database

  ```ruby
  get '/show' do
    database = PG.connect(dbname: "words")
    @rows = database.exec("SELECT * FROM words")

    erb :show
  end
  ```

- Then lets update the `show.erb` template to *display* those words

  ```erb
  <% if @rows.any? %>
    <ul class="list-group">
      <% @rows.each do |row| %>
        <li class="list-group-item">
          <%= row["word"] %>
        </li>
      <% end %>
    </ul>
  <% end %>
  ```

- Then lets update `post '/show'` to *save* the word

  ```ruby
  post '/show' do
    word = params["word"]

    database = PG.connect(dbname: "words")
    database.exec("INSERT INTO words(word) VALUES($1)", [word])

    @rows = database.exec("SELECT * FROM words")

    erb :show
  end
  ```

### Tired of stopping and starting Sinatra after each code change?
- Install the `sinatra-contrib` gem and use the `reloader` it provides
  - `gem install sinatra-contrib`
  - `require 'sinatra/reloader' if development?`
