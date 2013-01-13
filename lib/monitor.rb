require 'happymapper'
require 'net/https'
                                                 

class Monitor
  include HappyMapper
  tag 'AZBFahrplanlage'
  attribute :updated_at, DateTime, :tag=>"Zst"
  element :linie, String, :tag =>'LinienText'
  element :richtung, String, :tag =>'RichtungsText'
  element :ziel, String, :tag => 'ZielHst'
  element :plan, DateTime, :tag => 'AbfahrtszeitAZBPlan'
  element :prognose, DateTime, :tag => 'AbfahrtszeitAZBPrognose'
  
  def self.get(stop)
    uri = URI("http://ogd-createcamp-wienerlinien.at/webservice.ft/getMonitorXml?haltepunkt=#{stop}&sender=createcamp2")
    puts uri
    xml  = Net::HTTP::get(uri)
    if xml.length>2 then 
      file = File.new("lib/assets/getMonitor.#{stop}.xml","w")
      file.write(xml)
      file.close
      monitor = Monitor.parse(xml)
      puts ="#{monitor[0].updated_at.strftime("%H:%M")}"
      monitor.each_with_index do |abfahrt,i|
        if i <=6
          puts "#{abfahrt.plan.strftime("%H:%M:%S")} #{if abfahrt.prognose !=abfahrt.plan then abfahrt.prognose.strftime("%H:%M:%S") else "        " end} #{("  "+abfahrt.linie)[-3..-1]} #{abfahrt.richtung} -> #{abfahrt.ziel}"
        end
      end
    end
  end
end

stops = [4125,4202,483,842,848]
stops.each do |stop|
  puts "====="
  Monitor.get(stop)
end
    
