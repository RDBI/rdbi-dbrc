gem 'rdbi'
require 'rdbi'
require 'yaml'

module RDBI::DBRC
  def self.connect(role)
    role_data = self.roles[role.to_sym]

    unless role_data
      raise ArgumentError, "role '#{role}' does not exist."
    end

    driver = role_data.delete(:driver)

    RDBI.connect(driver, role_data)
  end

  def self.roles
    rcfile = ENV["DBRC"] || File.expand_path(File.join(ENV["HOME"], '.dbrc'))

    # XXX the rc file should only be two levels deep, so instead of mentarbating
    # XXX with recursion, let's just do it the cheap way.

    hash = RDBI::Util.key_hash_as_symbols(YAML.load_file(rcfile))
    hash.each do |key, value|
      hash[key] = RDBI::Util.key_hash_as_symbols(hash[key])
    end

    hash
  end
end
