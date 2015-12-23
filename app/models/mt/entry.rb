class MT::Entry <ActiveRecord::Base
  include MT::Object
  include MT::Meta
  belongs_to :blog,
             class_name: 'MT::Blog',
             foreign_key: 'entry_blog_id'
  belongs_to :author,
             class_name: 'MT::Author',
             foreign_key: 'entry_author_id'
  has_one :placement,
          ->{ where(placement_is_primary: 1) },
          class_name: 'MT::Placement',
          foreign_key: 'placement_entry_id'
  has_many :placements,
           class_name: 'MT::Placement',
           foreign_key: 'placement_entry_id'
  has_one :category,
          class_name: 'MT::Category',
          through: :placement,
          source: :category
  has_many :categories,
           class_name: 'MT::Category',
           through: :placements,
           source: :category

  enum entry_status: {
      hold: 1,
      release: 2,
      review: 3,
      future: 4,
      junk: 5,
      unpublish: 6
  }
end
