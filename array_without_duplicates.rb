require "benchmark"

def random_array size
  Array.new(size) { rand(1..size) }
end

def check_for_dupilicated_in_array check_array, final_array
  check_array.each do |element|
    final_array.push element if !final_array.include? element 
  end
end

Benchmark.bm do |bm|
  bm.report("1E4: ") { check_for_dupilicated_in_array(random_array(1000), Array.new) }
  bm.report("1E5: ") { check_for_dupilicated_in_array(random_array(10000), Array.new) }
  bm.report("1E6: ") { check_for_dupilicated_in_array(random_array(100000), Array.new) }
end

def create_hash_from_unique check_array, new_hash
  check_array.each do |element|
    new_hash[element.to_s] = "1"
  end
  new_hash
end

Benchmark.bm do |bm|
  bm.report("1E4: ") { create_hash_from_unique(random_array(1000), Hash.new) }
  bm.report("1E5: ") { create_hash_from_unique(random_array(10000), Hash.new) }
  bm.report("1E6: ") { create_hash_from_unique(random_array(100000), Hash.new) }
end

Benchmark.bm do |bm|
  bm.report("1E4: ") { random_array(1000).uniq! }
  bm.report("1E5: ") { random_array(10000).uniq! }
  bm.report("1E6: ") { random_array(100000).uniq! }
end
