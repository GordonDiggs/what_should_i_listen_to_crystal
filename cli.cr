require "./rayons"

count = ARGV.size > 0 ? ARGV[0].to_i : 1

count.times do
  item = Rayons.new.get_random_item
  puts "You should listen to \"#{item.title}\" by #{item.artist}: #{item.url}"
end
