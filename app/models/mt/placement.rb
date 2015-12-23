class MT::Placement <ActiveRecord::Base
  include MT::Object
  belongs_to :entry,
             class_name: 'MT::Entry',
             foreign_key: 'placement_entry_id'
  belongs_to :category,
             class_name: 'MT::Category',
             foreign_key: 'placement_category_id'
end