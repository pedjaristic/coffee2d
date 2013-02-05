(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  window.Tile = (function(_super) {

    __extends(Tile, _super);

    function Tile(spriteSheet, index) {
      var tile, _i, _len, _ref;
      this.spriteSheet = spriteSheet;
      Tile.__super__.constructor.call(this);
      this.heightTiles = [];
      this.baseTiles = [];
      this.baseTiles.push(new SpriteImage(spriteSheet, index));
      _ref = this.baseTiles;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        tile = _ref[_i];
        this.addChild(tile);
      }
    }

    Tile.prototype.addHeightIndex = function(index) {
      var sprite;
      sprite = new SpriteImage(this.spriteSheet, index);
      sprite.position.y = -this.heightTiles.length * 32;
      console.log(sprite.position.y);
      this.heightTiles.push(sprite);
      return this.addChild(sprite);
    };

    return Tile;

  })(Component);

}).call(this);