module Syenite
    def project_root
        Dir.chdir '..' while not File.directory? '.syenite'
        return Dir.pwd
    end
end