# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

# test suite for 'lemon'

$:.push("./lib")
covers "mapper"


testcase Mapper do

    setup "Mapper" do
        Mapper::new({:a => :b}, {:c => :d})
    end
    
    unit :some => "returns 'some' reductor" do |mapper|
        mapper.some.assert.kind_of? Mapper::Some
    end
    
    unit :all => "returns 'all' reductor" do |mapper|
        mapper.all.assert.kind_of? Mapper::All
    end
    
end

testcase Mapper::Some do
    
    setup "Mapper::Some (default)" do
        Mapper::new({:a => :b}, {:c => :d}).some
    end
    
    unit :has_key => "existing key (should return true)" do |some|
        some.has_key?(:a).assert === true
    end

    unit :has_key => "non-existing key (should return false)" do |some|
        some.has_key?(:d).assert === false
    end
    
    unit :[] => "non-existing key value (should return nil)" do |some|
        some[:d].assert === nil
    end
    
end

testcase Mapper::Some do
    
    setup "Mapper::Some (negative condition)" do
        Mapper::new({:a => :b}, {:c => :d}).some { |v| !v }
    end
    
    unit :[] => "existing key value (should return :d)" do |some|
        some[:a].assert === :d
    end
    
end

testcase Mapper::All do
    
    setup "Mapper::All" do
        Mapper::new({:a => :b}, {:c => :d}).all
    end
    
    unit :[] => "existing key (should return [:b, nil])" do |all|
        all[:a].assert == [:b, nil]
    end

    unit :[] => "non-existing key (should return [nil, nil])" do |all|
        all[:d].assert == [nil, nil]
    end
    
end
    
