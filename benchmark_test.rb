require 'benchmark'

puts "Ruby Version: #{RUBY_VERSION}"

h_num = { 1 => 1 }
h_str = {"a" => 1 }
h_sym = { :a => 1 }

Benchmark.bm do |x|
  x.report("num") { 1_000_000.times { h_num[1]}}
  x.report("str") { 1_000_000.times { h_num["a"]}}
  x.report("sym") { 1_000_000.times { h_num[:a]}}
end