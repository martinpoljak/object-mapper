#!/usr/bin/ruby
# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

$:.push("./lib")
require "mapper"
require "riot"

context "Mapper" do
    setup { Mapper[{:a => :b}, {:c => :d}] }
    asserts("returns 'some' reductor") { topic.some.kind_of? Mapper::Some }
    asserts("returns 'all' reductor") { topic.all.kind_of? Mapper::All }
end

context "Mapper::Some (default)" do
    setup { Mapper[{:a => :b}, {:c => :d}].some }
    asserts("existing key (should return true)") { topic.has_key?(:a) === true }
    asserts("non-existing key (should return false)") { topic.has_key?(:d) === false }
    asserts("non-existing pair under key (should return nil)") { topic[:d] === nil }
end

context "Mapper::Some (negative condition, special configuration)" do
    setup do 
        h1 = {:a => :b}
        h2 = {:c => :d}
        h2.default = :default
        
        Mapper[h1, h2].some { |v| !v } 
    end
    
    asserts("existing key value (should return :default)") { topic[:a] === :default }
end

context "Mapper::All" do
    setup { Mapper::new({:a => :b}, {:c => :d}).all }
    asserts("existing key (should return [:b, nil])") { topic[:a] == [:b, nil] }
    asserts("non-existing key (should return [nil, nil])") { topic[:d] == [nil, nil] }
end

