module MediaartsScraper
  module Data
    module DataObject
      NULL = Object.new.freeze

      def self.included(klass)
        klass.class_eval do
          attr_reader :raw_data

          def initialize(raw_data)
            @raw_data = raw_data
            @attributes = Hash.new(NULL)
          end

          def attributes
            self.class.attributes
          end

          def attributes_without_copyrighted
            self.class.attributes_without_copyrighted
          end

          def self.attribute(method, en, copyrighted = false)
            attributes << method
            attributes_without_copyrighted << method unless copyrighted

            define_method(method) do
              if @attributes[method] == NULL
                if block_given?
                  @attributes[method] = yield @raw_data[en]
                else
                  @attributes[method] = @raw_data[en]
                end
              end

              @attributes[method]
            end
          end

          def self.attributes
            @_attributes_ = [] unless @_attributes_

            @_attributes_
          end

          def self.attributes_without_copyrighted
            @_attributes_without_copyrighted_ = [] unless @_attributes_without_copyrighted_

            @_attributes_without_copyrighted_
          end

          def to_json(*options)
            to_hash.to_json(*options)
          end

          def to_json_without_copyrighted(*options)
            to_hash_without_copyrighted.to_json(*options)
          end

          def to_hash
            to_hash0(attributes, :to_hash)
          end

          def to_hash_without_copyrighted
            to_hash0(attributes_without_copyrighted, :to_hash_without_copyrighted)
          end

          private

          def to_hash0(attributes, method)
            {}.tap { |hash|
              hash["class"] = self.class.name

              attributes.each do |attr|
                value = send(attr)

                hash[attr] = if value.is_a?(Array)
                               value.map { |item| item.respond_to?(method) ? item.send(method) : item }
                             elsif value.is_a?(Hash)
                               value.transform_values { |item| item.respond_to(method) ? item.send(method) : item }
                             elsif value.respond_to?(method)
                               value.send(method)
                             else
                               value
                             end
              end
            }
          end
        end
      end
    end
  end
end
