class MT::Field <ActiveRecord::Base
  include MT::Object
  belongs_to :blog,
             class_name: 'MT::Blog',
             foreign_key: 'field_blog_id'
end