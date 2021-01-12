RSpec.configure do |config|

config.before(:each ) do |example|
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: { args: ['no-sandbox'] } if example.metadata[:type] == :system
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups




  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!


  if config.files_to_run.one?

    config.default_formatter = "doc"
  end


  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
