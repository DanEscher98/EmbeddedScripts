#!/usr/bin/bash
# https://thisdavej.com/consuming-web-api-json-data-using-curl-and-jq/
# prepare-environment

if (( $# < 1 )); then
  echo "Usage: $(basename "$0") location [degreeType]"
  echo "Example: $(basename "$0") \"Monterrey, NL\" C"
  exit 1
fi

# HTML encode string as $20
LOCATION=$(sed -e "s/ /%20/g" <<< $1)
DEG="C"

function current_weather() {
	url=$(echo \
			'https://thisdavej.azurewebsites.net/' \
			'api/weather/current?loc='"$LOCATION"'&deg='"$DEG" \
			| tr -d '[:space:]')

	jq -r '. | "\(.temperature)°\(.degType) \(.skytext)"' \
		<<< $(curl --silent --show-error $url)
}

function forecast_weather() {
	url=$(echo \
			'https://thisdavej.azurewebsites.net/' \
			'api/weather/forecast?loc='"$LOCATION"'&deg='"$DEG" \
			| tr -d '[:space:]')
	curl --silent --show-error $url \
		| jq -r \
		'.|sort_by(.low)|reverse|.[]|select(.precip|tonumber>0)|"\(.shortday) \(.low)-\(.high)°\(.degType) \(.skytextday) ~ Rain:\(.precip)% \(if (.precip | tonumber > 20) then "(Bring umbrella!)" else "" end)"'
}

forecast_weather
