class MT::Blog <ActiveRecord::Base
  include MT::Object
  has_many :entries,
      class_name: 'MT::Entry',
      foreign_key: 'entry_blog_id'
end