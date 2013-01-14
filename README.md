# WTA Wiener Transport Authority

*Wrapping the XML API of the Wiener Linien realtime "monitor" data into friendly ruby objects.*

This is a simple rails project that had access to the Wienerlinien, well, API. It might oneday become a ruby wrapper gem.

Wiener Linien treats their data like gold. They are very careful about releasing their data. This project was written during the createcamp weekend when there was a chance have a go at the ad hoc API. It was a very controlled environment, but no NDAs were signed.

## What it does

The realtime API comes back with XML and shows the data as seen on these overhead displays you find in the stations. The data for the Ubahn only shows the next two trains and for a tram stop the next 70 minutes. They source that data internally from different systems.

Data is mapped into a usable form with unhappymapper into ruby objects.

Run to see the XML parsed and displayed as a sort of CLI station monitor:

    ruby lib/monitor.rb
    
You might have to bundle update to get the required gems - unhappymapper
    
    bundle update
    
All stuff happens in the lib directory. Some of the XML as returned from the API you can find in the lib/assets folder. like this one, which is the most interesting one as it has some slight delays of line 6 and 18.

https://raw.github.com/smtm/wta/master/lib/assets/getMonitor.483.xml

Oh yeah and there is this CSV which gives you an idea how the stations (Haltestellen) are named and organized                           

https://raw.github.com/smtm/wta/master/lib/assets/haltepunkte.csv

Now - as per 14.1.2013 - the Wiener Linien IT guys will consult with the suits (lawyers, management), so expect a lengthy wait. In the meantime have a look at the files and feel free to extend the mapping as you please.

## My App Project

My goal is to build a display of interesting destinations for tourists in the city and which can be tuned to the guests staying in the hotel. It is a display that would be visible in the lobby and reception area of the hotels.
If the hotels has, say people going to a Fair or Congress, they would show the directions to the Messe or the Austria Center or the Hofburg. On other days it would be more generic places like Schönbrunn or the Belvedere. I want to offer this apps to hotels of Vienna especially the customers of my online Hotelsoftware http://igumbi.com.

The real interesting data -the Fahrplan- the schedules are held and deliverd by the Verkehrsverbund. The ÖBB and the Wiener Linien just subscribe to that data. As we say in German: "andere Baustelle". At the createcamp there were some adventourous attempts to parse the PDFs for each line. Discussion inputs were to OCR(sic) them. 

## Also check out
                   
Meanwhile have a look over at the New York City MTA API and see what's possible once we get our hands on the data.  
The API docs http://www.mta.info/developers/
Some awsome visualizations: http://data.fabernovel.com/nyc-subway/

