require 'happymapper'
            
xml = File.read('lib/assets/getMonitor.483.xml')

class Monitor
  include HappyMapper
  tag 'AZBFahrplanlage'
  attribute :updated_at, DateTime, :tag=>"Zst"
  element :linie, String, :tag =>'LinienText'
  element :richtung, String, :tag =>'RichtungsText'
  element :ziel,String, :tag => 'ZielHst'
  element :plan,DateTime, :tag => 'AbfahrtszeitAZBPlan'
  element :prognose,DateTime, :tag => 'AbfahrtszeitAZBPrognose'
end
      
monitor = Monitor.parse(xml)

puts ="#{monitor[0].updated_at.strftime("%H:%M")}"
monitor.each do |abfahrt|
   puts "#{abfahrt.plan.strftime("%H:%M")} #{if abfahrt.prognose !=abfahrt.plan then abfahrt.prognose.strftime("%H:%M") else "     " end} #{("  "+abfahrt.linie)[-3..-1]} #{abfahrt.richtung} -> #{abfahrt.ziel}"
end     