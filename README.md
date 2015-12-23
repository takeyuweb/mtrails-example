Movable Type + Ruby on Rails 4 Example
===

## Configuration

config/initializers/mt.rb

```ruby
Rails.application.config.to_prepare do
  MT::Object.connection_configuration = {
      adapter:  'mysql2',
      encoding: 'utf8',
      host:     'localhost',
      username: 'root',
      database: 'mt62',
      socket: '/var/lib/mysql/mysql.sock'
  }
end
```

OR

```ruby
Rails.application.config.to_prepare do
  MT::Object.connection_configuration = :mt
end
```

## Objects

### MT::Entry

```ruby
entry = MT::Entry.first
entry.blog # => #<MT::Blog blog_id: 1, ...>
entry.category # => #<MT::Category category_id: 1, ...>
entry.categories # => #<ActiveRecord::Associations::CollectionProxy [#<MT::Category category_id: 1 ...>, ...]>
entry.entry_title # => "TITLE"
entry.entry_status # => "release"
```

### Query Interface

Active Record defautls.

```ruby
MT::Entry.all
MT::Entry.first
```

### Scope

```ruby
MT::Entry.release
```

### Metadata / Custom Fields

```ruby
entry.meta # => #<ActiveRecord::Associations::CollectionProxy [#<MT::Entry::Meta entry_meta_entry_id: 12, entry_meta_type: "field.data1",  ...>, ...]>
entry.meta.pluck(:entry_meta_type) # => ["field.data1", "field.data2", "revision"]
```

#### Custom Field Search

```ruby
entry_meta = MT::Entry::Meta.arel_table
cond1 = MT::Entry
            .joins(:meta)
            .where(
                entry_meta[:entry_meta_type].eq('field.data1')
                    .and(entry_meta[:entry_meta_vchar_idx].in(100..200)))

MT::Entry.release.merge(cond1)
```

### MT::Blog



### MT::Category



### MT::Author



