

require 'docile'
require 'ostruct'
require_relative '../lib/test_dsl_lib'
require 'dsl/maker'
RSpec.configure do |_config|
  include ::TestDslLib
:do_nothing
end
