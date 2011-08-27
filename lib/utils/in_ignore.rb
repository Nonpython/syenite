require 'project_root.rb'
require 'Psych'
include Syenite

module Syenite
    def in_ignore?(name, is_dir=false)
        ignore = Psych.load File.new(File.join project_root, '.syeniteignore')
        if is_dir
            name += '/'
        end
        return not ignore.includes name
    end
end