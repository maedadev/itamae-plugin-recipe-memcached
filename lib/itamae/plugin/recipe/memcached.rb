# frozen_string_literal: true

require_relative "memcached/version"

include_recipe './memcached/stop'
include_recipe './memcached/install.rb'
include_recipe './memcached/start'
