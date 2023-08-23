# frozen_string_literal: true

module Itamae
  module Plugin
    module Recipe
      module Memcached
        VERSION = '0.1.0'

        MEMCACHED_VERSION = [
          MEMCACHED_VERSION_MAJOR = '1',
          MEMCACHED_VERSION_MINOR = '6',
          MEMCACHED_VERSION_REVISION = '21'
        ].join('.')
      end
    end
  end
end
