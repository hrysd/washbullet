# Washbullet

[![Gem Version](https://badge.fury.io/rb/washbullet.svg)](http://badge.fury.io/rb/washbullet)
[![Build Status](https://travis-ci.org/hrysd/washbullet.svg?branch=master)](https://travis-ci.org/hrysd/washbullet)

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
- file

```ruby
client.push_note(
  receiver:   :device, # :email, :channel, :client
  identifier: '<IDENTIFIER>',
  params: {
    title: 'Title',
    body:  'Contents'
  }
)
```

### Devices

```ruby
# Get own active devices
client.devices
```

### Contacts

```ruby
# Get friends list
client.contacts
```

### Get self info

```
client.me
```

## Supported API

detail: https://docs.pushbullet.com/

**Pushes**
  - [X] Push to device
  - [ ] Request push history
  - [ ] Update a push
  - [ ] Deleting a push
  - [ ] Deleting all pushes

**Devices**
  - [X] Get the devices that can be pushed to
  - [ ] Create a new device
  - [ ] Update an existing device
  - [ ] Delete a device

**Contacts**
  - [X] Get your contacts
  - [ ] Create a contact
  - [ ] Update a contact
  - [ ] Delete a contact

**Subscriptions**
  - [ ] Subscribe to a channel
  - [X] List subscriptions
  - [ ] Unsubscribe from a channel
  - [X] Get information about a channel

**Users**
  - [X] Get the current user
  - [ ] Update the current user

**Realtime Event Stream**
  - Not yet

## Contributing

1. Fork it ( http://github.com/hrysd/washbullet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
