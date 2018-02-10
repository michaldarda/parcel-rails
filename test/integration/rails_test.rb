require_relative '../rails_environment'

require 'minitest/autorun'

class RailsIntegrationTest < Minitest::Test
  def test_rails_integration
    require 'pry'; binding.pry
    Config::Application.load_tasks
    refute_empty Rake.application.tasks.grep(/parcel/)
  end
end
