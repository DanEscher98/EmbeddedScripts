function weather --argument LOCATION
		
	#if count $argv
	#  echo "Usage:" (basename $argv[0]) "location [degreeType]"
	#  echo "Example:" (basename $argv[0]) "\"Monterrey, NL\" C"
	#  exit 1
	#else
	# HTML encode
	set LOCATION (echo $LOCATION | sed -e "s/ /%20/g")
	set DEG "C"
	#end
	
	function current_weather --argument LOCATION DEG
		set url (echo \
				'https://thisdavej.azurewebsites.net/' \
				'api/weather/current?loc='"$LOCATION"'&deg='"$DEG" \
				| tr -d '[:space:]')
		curl --silent --show-error $url \
			| jq -r '. | "\(.temperature)°\(.degType) \(.skytext)"'
	end

	function forecast_weather
		set url (echo \
				'https://thisdavej.azurewebsites.net/' \
				'api/weather/forecast?loc='"$LOCATION"'&deg='"$DEG" \
				| tr -d '[:space:]')
		curl --silent --show-error $url \
			| jq -r \
			'.|sort_by(.low)|reverse|.[]|select(.precip|tonumber>0)|"\(.shortday) \(.low)-\(.high)°\(.degType) \(.skytextday) ~ Rain:\(.precip)% \(if (.precip | tonumber > 20) then "(Bring umbrella!)" else "" end)"'
	end
	
	#if ping -c 5 'thisdavej.azurewebsites.net' &> /dev/null
	current_weather $LOCATION $DEG
	#else
	#	echo "Network connection failed"
	#end
end
