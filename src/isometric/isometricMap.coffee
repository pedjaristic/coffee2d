class window.IsometricMap extends Component
  constructor: (opts) ->
    super()
    # TODO: error checking
    @opts             = opts
    @spriteSheet      = opts.spriteSheet
    @tiles              = opts.tiles
    @tileWidth        = opts.tileWidth
    @tileHeight       = opts.tileHeight
    @tileXOffset      = opts.tileXOffset
    @tileYOffset      = opts.tileYOffset
    @tileBoundingPoly = opts.tileBoundingPoly

    @mapOffset = 0

    @init()


  init: ->
    minX = maxX = 0
    maxY = 0
    i       = 0
    j       = 0
    ii      = 0
    jj      = 0
    xOffset = 0
    yOffset = 0
    rows    = @tiles.length
    cols    = @tiles[0].length
    while i<rows and j<cols
      ii = i
      jj = j
      x = xOffset
      y = yOffset
      while ii<rows and jj<cols
        # check for out of bounds
        if ii<0 or ii>=rows or jj<0 or jj>=cols
          break
        t = @tiles[ii][jj]
        t.position = {x: x, y: y}
        poly = {}
        $.extend poly, @tileBoundingPoly
        t.setBoundingPolygon poly
        t.setup()
        @addChild t
        if x < minX
          minX = x
        if x > maxX
          maxX = x
        if y > maxY
          maxY = y
        ii-=1
        jj+=1
        x += @tileWidth
      
      # increment for next level
      if i+1<cols
        i++
        xOffset -= @tileXOffset
      else
        j++
        xOffset += @tileXOffset
      yOffset += @tileYOffset
      
    # move the map to position
    for row in @tiles
      for t in row
        t.position.x += (-minX)
    @mapOffset = -minX
    @setSize maxX-minX, maxY


  addObject: (obj, i, j) ->
    x = i*-@tileXOffset + j*@tileXOffset + @mapOffset
    y = i*@tileYOffset + j*@tileYOffset
    obj.setPosition x, y
    @addChild obj
