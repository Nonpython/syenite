module Syenite
    def find_project_root
        Dir.chdir '..' while not File.directory? '.syenite'
        return Dir.pwd
    end
end