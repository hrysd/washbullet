require 'washbullet/api/contacts'
require 'washbullet/api/devices'
require 'washbullet/api/me'
require 'washbullet/api/pushes'
require 'washbullet/api/subscriptions'

module Washbullet
  module API
    include Contacts
    include Devices
    include Pushes
    include Me
    include Subscriptions
  end
end
