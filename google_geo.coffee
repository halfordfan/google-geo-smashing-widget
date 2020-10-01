class Dashing.GoogleGeo extends Dashing.Widget

  ready: ->
    container = $(@node).parent()
  # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey"))

    colors = null
    if @get('colors')
      colors = @get('colors').split(/\s*,\s*/)

    @chart = new google.visualization.GeoChart($(@node).find(".chart")[0])

    @options =
      height: height
      width: width
      backgroundColor: 'transparent'
      datalessRegionColor: '#228b22'
      domain: 'IN'
      colorAxis:
        colors: colors
      legend: 'none'
        #textStyle:
          #color: '#000000'
      resolution: @get('resolution')
      region: @get('region')

    if @get('points')
      @data = google.visualization.arrayToDataTable @get('points')
    else
      @data = google.visualization.arrayToDataTable []

    @chart.draw @data, @options

  onData: (data) ->
    if @chart
      @data = google.visualization.arrayToDataTable data.points
      @chart.draw @data, @options

