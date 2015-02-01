# Washbullet

Ruby client of [Pushbullet](https://www.pushbullet.com/).

## Installation

```
$ gem install washbullet
```

## Usage

### Setup Client

```ruby
client = Washbullet::Client.new('YOUR_API_KEY')
```

### Push

You can send following list:
- note
- link
- address
- list
- file

```ruby
client.push_note(
  receiver:  :device, # :email, :channel, :client
  identifer: 'abcdefg',
  params: {
    title: 'Title',
    body:  'Contents'
  }
)
```

### Devices

```ruby
# Get own devices
client.devices

# Push to device

device.receive(:note, title: 'Title', body: 'Content')
```

### Contacts

```ruby
# Get friends list
client.contacts

# Push to friend
contact.receive(:link,
  title: 'title',
  url:   'https://www.pushbullet.com',
  body:  'Check it.'
)
```

### Get self info

```
client.me
```

## TODO

- test...

## Contributing

1. Fork it ( http://github.com/hrysd/washbullet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
