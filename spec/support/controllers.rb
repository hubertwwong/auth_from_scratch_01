# load controller helpers.
RSpec.configure do |config|
  config.include Controllers::SessionHelpers, type: :controller
end