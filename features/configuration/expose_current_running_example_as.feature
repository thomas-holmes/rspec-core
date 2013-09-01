Feature: expose_current_running_example_as

  Use `config.expose_current_running_example_as` to create a new example group
  method that provides accessing to the currently running example

  Scenario: Use expose_current_running_example_as to expose currently running example as current_example
    Given a file named "expose_current_running_example_as_spec.rb" with:
    """ruby
    RSpec.configure do |c|
      c.expose_current_running_example_as :current_example
    end

    describe "integration tests", type: :integration do
      it "can access the current example" do
        expect(current_example.metadata[:type]).to eq(:integration)
      end
    end
    """
    When I run `rspec expose_current_running_example_as_spec.rb`
    Then the output should contain "1 example, 0 failures"
