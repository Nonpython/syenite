require 'project_root.rb'
module Syenite
    def syenite_dir
        return File.join find_project_root, '.syenite'
    end
end