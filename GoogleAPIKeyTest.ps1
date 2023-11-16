# Test Google Maps API Key

function RequestMaps {
	param (
		[string]$url,
		[string]$endpoint
	)
	try
	{
		$response = curl -uri $url
		if ($response.StatusCode -eq 200)
		{	
			if ($response.Content -like "*DENIED*")
			{
				echo "[-] $endpoint Failed"
			}
			else
			{
				echo "[+] $endpoint Successful: $url"
			}

		}
	}
	catch
	{
		echo "[-] $endpoint Failed"
	}
}

$key = $args[0]
RequestMaps -url "https://maps.googleapis.com/maps/api/staticmap?center=45%2C10&zoom=7&size=400x400&key=$key" -endpoint "Static Maps"
RequestMaps -url "https://maps.googleapis.com/maps/api/streetview?size=400x400&location=40.720032,-73.988354&fov=90&heading=235&pitch=10&key=$key" -endpoint "Streetview"
RequestMaps -url "https://www.google.com/maps/embed/v1/place?q=place_id:ChIJyX7muQw8tokR2Vf5WBBk1iQ&key=$key" -endpoint "Embed"
RequestMaps -url "https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood4&key=$key" -endpoint "Directions"
RequestMaps -url "https://maps.googleapis.com/maps/api/geocode/json?latlng=40,30&key=$key" -endpoint "Geocoding"
RequestMaps -url "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=40.6655101,-73.89188969999998&destinations=40.6905615%2C-73.9976592%7C40.6905615%2C-73.9976592%7C40.6905615%2C-73.9976592%7C40.6905615%2C-73.9976592%7C40.6905615%2C-73.9976592%7C40.6905615%2C-73.9976592%7C40.659569%2C-73.933783%7C40.729029%2C-73.851524%7C40.6860072%2C-73.6334271%7C40.598566%2C-73.7527626%7C40.659569%2C-73.933783%7C40.729029%2C-73.851524%7C40.6860072%2C-73.6334271%7C40.598566%2C-73.7527626&key=$key" -endpoint "Distance Matrix"
RequestMaps -url "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=$key" -endpoint "Find Place from Text"
RequestMaps -url "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Bingh&types=%28cities%29&key=$key" -endpoint "Autocomplete"
RequestMaps -url "https://maps.googleapis.com/maps/api/elevation/json?locations=39.7391536,-104.9847034&key=$key" -endpoint "Elevation"
RequestMaps -url "https://maps.googleapis.com/maps/api/timezone/json?location=39.6034810,-119.6822510&timestamp=1331161200&key=$key" -endpoint "Timezone"
RequestMaps -url "https://roads.googleapis.com/v1/nearestRoads?points=60.170880,24.942795|60.170879,24.942796|60.170877,24.942796&key=$key" -endpoint "Roads"

