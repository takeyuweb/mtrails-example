require_dependency 'mt'

module MT::Object
  extend ActiveSupport::Concern

  def self.connection_configuration=(spec)
    @connection_configuration = spec
  end

  def self.connection_configuration
    @connection_configuration
  end

  def self.included(klass)
    klass.class_eval do
      self.table_name_prefix = 'mt_'
      self.table_name = ['mt', name.split('::').last.underscore].join('_')
      self.primary_key = [name.split('::').last.underscore, 'id'].join('_')
      self.establish_connection ::MT::Object.connection_configuration
    end
  end

end
