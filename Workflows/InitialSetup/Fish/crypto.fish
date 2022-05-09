function crypto --description 'Get crypto info' --argument crypto fiat
	function format_args --argument value
		# Gives format to the arguments
		echo $value |  sed -e 's/,/%2C/g'
	end

	function simple_price_cg --argument crypto fiat
		# Gets the current ratio between a list of
		# crypto assets and a list of currencies
		# using the API of CoinGecko
		set crypto	(format_args $crypto)
		set fiat	(format_args $fiat)
		set url (echo \
			'https://api.coingecko.com/api/v3/' \
			'simple/price?' \
			'ids='"$crypto"'&vs_currencies='"$fiat" \
			'&include_market_cap=false' \
			'&include_24hr_vol=false' \
			'&include_24hr_change=true' \
			'&include_last_updated_at=false' \
			| tr -d '[:space:]')
		begin 
			curl -sS -X 'GET' $url -H 'accept: application/json'
		end
		or begin
			echo "Network error :/"
		end
	end
	
	simple_price_cg $crypto $fiat | jq
end
