require 'FileUtils'
module Syenite
    module Init
        def run(args)
            if not Dir.exists? ".syenite" do
              FileUtils.mkpath ".syenite/branches/main/files"
              File.mkdir ".syenite/branches/main/trees"
              File.mkdir ".syenite/branches/main/commits"
              File.open ".syenite/tip", "w" do
                |file|
                file.write("branches/main/tip")
              end
              File.open ".syenite/branch_active", "w" do
                |file|
                file.write("branches/main")
              end
            end
          end
        end
    end