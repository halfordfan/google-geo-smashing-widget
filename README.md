# Google Geo Chart Widget for Smashing

The [Smashing dashboard](https://github.com/Smashing/smashing) is a convenient way to visualize a variety of data sets in a kiosk-type mode.  This is a [Google Geo Visualization](https://developers.google.com/chart/interactive/docs/gallery/geochart) widget to create heat maps or activity blooms on a variety of maps.  I use this widget to show geo-locations of users of an Internet-based service.

## Installation

Add the following to your ```layout.erb``` above the line for ```application.js```:
```html
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {packages:['corechart']});
</script>
```

If you get an ```Internal Error``` message when sending a lot of datapoints, you probably need to increase your Rake parameter depth limit in ```config.ru``` just before running Sinatra like so:

```ruby
Rack::Utils.param_depth_limit = 200 // Or more
```

## Usage

Add one of the following as an element to your dashboard:

For a globe view, use the ```alttitle``` data property to slide the title over to the right and avoid covering any land masses.
```html
<div data-id="worlduserheatmap"
data-alttitle="Worldwide User Heat Map"
data-colors="ffff00, ff4000"
data-view="GoogleGeo"
data-moreinfo=""></div>
```

For a US view, use the ```title``` data property and set the resolution to ```provinces```.
```html
<div data-id="ususerheatmap"
data-title="United States User Heat Map"
data-region="US"
data-colors="ffff00, ff4000"
data-resolution="provinces"
data-view="GoogleGeo" data-moreinfo="">
```

Send point data in one of a number of formats.  The formats presented here do NOT require an API key from Google to work.

The following is based on values for countries/provinces by two-character country (ISO-3166):
```js
{
"points" : [ 
[ "Country" , "User Count" ],
[ "US" , 11 ], 
[ "VN" , 1 ], 
[ "DE" , 12 ] 
]
}
```

The following works with provinces-level resolution and two letter country and state codes (US only):
```js
{
"points" : [
[ "State", "User Count" ]
[ "US-AZ" , 11 ],
[ "US-WA" , 17 ],
[ "US-NC" , 211 ]
]
}
```

The following specifies coordinates in latitude/longitude format.
```js
{
"points" : [
[ "Latitude", "Longitude", "Hits" ],
[ 40.12312, 116.75673 , 1242],
[ 5.15346 , 3.75673 , 394],
[ 1.45234 , 104.75673 , 313]
]
}
```

Other input formats are available using APIs for lookup, but you'll need to get an key from Google and associated it with a GCP billing account.

## Contributing
I may or may not respond to pull requests or issue submissions.

## License
[MIT](https://choosealicense.com/licenses/mit/)

