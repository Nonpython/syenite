#!/usr/bin/env ruby -wKU
# encoding: UTF-8
require 'digests/sha2'
require 'lzma'
require 'require_all'
require_all '../utils/*'
include Syenite

module Syenite
    module CreateTreeObj
        def generate_file_obj(filename)
            contents = File.new(filename).read
            blob_id = Digest::SHA2.new << contents
            blob_filename = File.join find_syenite_dir, File.open('branch_active').read, 'blobs', blob_id
            if !File.exists? blob_id
                File.open blob_filename, "w" do
                    |file|
                    file.write LZMA.compress contents
                end
            end
            return blob_id
        end
        
        def generate_tree_obj(path)
            tree = []
            dir = Dir.open path
            dir.each do
                |item|
                if File.directory? item
                    sha = generate_tree_obj File.join path, item
                    tree << "tree #{ sha }"
                else
                    sha = generate_file_obj item
                    tree << "blob #{ sha }"
                end
                if tree.count == 0
                    tree << "empty"
                end
            
            end
        end
        
        def run(path)
                generate_tree_obj path
            end
        end
    end
end