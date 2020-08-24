module FixedFormatFile
  module Base
    module DSL
      def self.included(base)
        base.extend ClassMethods
        base.include InstanceMethods
      end

      module ClassMethods
        attr_reader :reader_instance, :builder

        def read_line_with(reader_class)
          @reader_instance = reader_class.new
        end

        def build_field_with(builder_class)
          @builder = builder_class
        end

        def fields
          @fields ||= {}
        end

        def field(name, **config)
          fields.merge!(@builder.build(name, **config))
        end

        def before_parse
          @reader_instance.fields = fields
        end

        def do_parse(input)
          @reader_instance.read(input: input)
        end

        def after_parse
        end
      end

      module InstanceMethods
        def parse(input)
          self.class.before_parse
          output = self.class.do_parse(input)
          self.class.after_parse

          output
        end
      end
    end
  end
end
