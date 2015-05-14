require 'pry'
require 'json'

require 'washbullet'
require 'webmock/rspec'
require 'vcr'

def test_api_key
  ENV.fetch('API_KEY', '<API_KEY>')
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data('<API_KEY>') do
    test_api_key
  end

  config.before_record do |interaction|
    next if interaction.response.body.empty?

    response = JSON.parse(interaction.response.body)

    response['iden'] = '<IDENTIFIER>' if response.has_key?('iden')

    response['devices'] = response['devices'].map {|device|
      device.merge!({'iden' => '<IDENTIFIER>'})

      if device['fingerprint']
        device['fingerprint'] = JSON.parse(device['fingerprint'])
        device['fingerprint'].merge!({'android_id' => '<ANDROID_ID>'})
      end

      device
    } if response['devices']

    interaction.response.body = response.to_json
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!
  config.warnings = true
end
