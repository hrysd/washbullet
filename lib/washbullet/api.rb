require 'washbullet/api/contacts'
require 'washbullet/api/devices'
require 'washbullet/api/pushes'
require 'washbullet/api/me'

module Washbullet
  module API
    include Contacts
    include Devices
    include Pushes
    include Me
  end
end
