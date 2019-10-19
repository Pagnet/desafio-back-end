RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

module FactoryBot
  module Strategy
    class Find
      def association(runner)
        runner.run
      end

      def result(evaluation)
        build_class(evaluation).where(get_overrides(evaluation)).first
      end

      private

      def build_class(evaluation)
        evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@build_class)
      end

      def get_overrides(evaluation = nil)
        return @overrides unless @overrides.nil?
        evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@evaluator).instance_variable_get(:@overrides).clone
      end
    end

    class FindOrCreate
      def initialize
        @strategy = FactoryBot.strategy_by_name(:find).new
      end

      delegate :association, to: :@strategy

      def result(evaluation)
        found_object = @strategy.result(evaluation)

        if found_object.nil?
          @strategy = FactoryBot.strategy_by_name(:create).new
          @strategy.result(evaluation)
        else
          found_object
        end
      end
    end
  end

  register_strategy(:find, Strategy::Find)
  register_strategy(:find_or_create, Strategy::FindOrCreate)
end
