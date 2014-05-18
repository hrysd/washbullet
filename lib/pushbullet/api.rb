require 'pushbullet/api/contacts'
require 'pushbullet/api/devices'
require 'pushbullet/api/pushes'
require 'pushbullet/api/me'

module Pushbullet
  module API
    include Contacts
    include Devices
    include Pushes
    include Me
  end
end
