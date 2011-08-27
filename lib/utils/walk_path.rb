#!/usr/bin/env ruby -wKU
# encoding: UTF-8

module Syenite
    def walk_path(path, name=nil)
        data = {:name => (name || path)}
        data[:children] = children = []
        Dir.foreach(path) do |entry|
        next if (entry == '..' || entry == '.')
        full_path = File.join(path, entry)
        if File.directory?(full_path)
          children << walk_path(full_path, entry)
        else
          children << entry
        end
        end
        return data
    end
end