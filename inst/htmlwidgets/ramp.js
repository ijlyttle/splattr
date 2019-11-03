HTMLWidgets.widget({

  name: "ramp",

  type: "output",

  factory: function(el, width, height) {

    // create our sigma object and bind it to the element
    var rmp = new Ramp(el.id);

    return {
      renderValue: function(x) {
        rmp.colors = x.colors;
        rmp.n = x.n;
        rmp.height = x.height;
        rmp.redraw();
      },

      resize: function(width, height) {
        rmp.resize(width, height);
        rmp.redraw();
      },

      // return the object
      r: rmp
    };
  }
});
