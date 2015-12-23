class MT::Category <ActiveRecord::Base
  include MT::Object
  belongs_to :author,
             class_name: 'MT::Author',
             foreign_key: 'entry_author_id'
end