# Pushbullet

Ruby client of [Pushbullet](https://www.pushbullet.com/) API.

## Installation

```
$ git clone git@github.com:hrysd/pushbullet.git
$ cd path/to/pushbullet
$ bundle install
$ bundle exec rake build
$ bundle exec rake install
```

## Usage

#### Setup Client

```ruby
client = Pushbullet::Client.new('YOUR_API_KEY')
```

#### Push to own device

You can send following list:
- note
- link
- address
- list
- file

```ruby
# get json about own device list
client.devices

client.push_note(DEVICE_ID, 'This is Title', 'This is Body!!!!')
client.push_file(DEVICE_ID, 'File Name', 'path/to/file')
```

#### :secret: Push to Friend's device :secret:

You can send following list:
- note
- link
- address
- list

```ruby
# get json about friend list of Pushbullet
client.contacts

client.push_note_to('friend@email.com', 'Hi!!!', 'This is Body!!!!')
```

## TODO

- test test test...

## Contributing

1. Fork it ( http://github.com/<my-github-username>/pushbullet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
