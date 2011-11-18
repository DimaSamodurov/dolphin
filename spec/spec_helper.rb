dir = File.expand_path(File.dirname(__FILE__))

require dir + '/../lib/dolphin'

RSpec.configure do |config|
  config.before { Dolphin.clear! }
end

