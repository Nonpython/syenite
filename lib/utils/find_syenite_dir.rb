require 'find_project_root.rb'
module Syenite
    def find_syenite_dir
        return File.join find_project_root, '.syenite'
    end
end