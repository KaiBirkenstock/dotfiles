#!/usr/bin/env ruby

# require 'bson_ext'
require 'mongo'
require 'net/ssh/gateway'
require 'date'

include Mongo

gateway = Net::SSH::Gateway.new('errbit.nwwo.de', 'funglaub')
port = gateway.open '127.0.0.1', 27_017, 27_017
db = MongoClient.new("localhost", 27017).db('errbit')

err_id = db.collection('errs')
           .find_one(problem_id: BSON::ObjectId(ARGV.first))['_id']

reduce_function =<<-END
function(obj, prev) { prev.count++; }
END

key_function = <<-END
function(notice) {
  var date = new Date(notice.created_at);
  var dateKey = (date.getDate()+"."+(date.getMonth()+1)+"."+date.getFullYear()+'');
  return { 'day':dateKey };
}
END

res = db.collection('notices').group(
  keyf: key_function,
  cond: { err_id: err_id },
  initial: { count: 0 },
  reduce: reduce_function
)

res.each do |item|
  item['count'] = item['count'].to_i
  item['day'] = Date.parse item['day']
end.sort! { |x, y| x['day'] <=> y['day'] }

res.each do |item|
  puts "#{item['day']}: #{item['count']}"
end
