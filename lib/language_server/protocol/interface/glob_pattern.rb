module LanguageServer
  module Protocol
    module Interface
      #
      # The glob pattern. Either a string pattern or a relative pattern.
      #
      # @since 3.17.0
      #
      class GlobPattern
        def initialize(base_uri:, pattern:)
          @attributes = {}

          @attributes[:baseUri] = base_uri
          @attributes[:pattern] = pattern

          @attributes.freeze
        end

        #
        # A workspace folder or a base URI to which this pattern will be matched
        # against relatively.
        #
        # @return [WorkspaceFolder | URI]
        def base_uri
          attributes.fetch(:baseUri)
        end

        #
        # The actual glob pattern;
        #
        # @return [Pattern]
        def pattern
          attributes.fetch(:pattern)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end