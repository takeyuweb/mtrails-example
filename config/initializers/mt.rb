require_dependency 'mt/object'

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
