module MT::Meta
  def self.included(klass)
    meta_class = Class.new(ActiveRecord::Base)
    klass.const_set('Meta', meta_class)
    meta_class.table_name = [klass.table_name, 'meta'].join('_')
    meta_class.class_eval do
      establish_connection  ::MT::Object.connection_configuration
    end

    klass.class_eval do
      has_many :meta,
               class_name: [name, 'Meta'].join('::'),
               foreign_key: [name.split('::').last.underscore, 'meta', primary_key].join('_')

      def get_meta

      end
    end
  end
end