# Pushbullet

Ruby client of [Pushbullet](https://www.pushbullet.com/).

## Installation

```
$ gem install pushbullet-ruby
```

## Usage

#### Setup Client

```ruby
require 'pushbullet'

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
# Get own device list
client.devices

# note
client.push_note(device_iden, 'Title of note', 'A note\'s content')

# link
client.push_link(device_iden, 'Title of link', 'https://www.pushbullet.com', 'This website is awesome.')

# address
client.push_address(device_iden, 'Name of address', 'Addrss of place')

# list
client.push_list(device_iden, 'Title of lists', [{text: 'Buy milk', checked: true}, {text: 'Buy Soy milk', checked: false}])

# file
client.push_file(device_iden, 'File name', 'path/to/file', 'An optional message')

# Get friend list of Pushbullet
client.contacts

# Get self info
client.me
```

## TODO

- push friend's device
- test...

## Contributing

1. Fork it ( http://github.com/<my-github-username>/pushbullet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
