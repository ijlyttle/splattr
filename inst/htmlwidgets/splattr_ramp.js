HTMLWidgets.widget({

  name: "splattr_ramp",

  type: "output",

  factory: function(el, width, height) {

    // create our ramp object and bind it to the element
    var rmp = new Ramp(el.id);

    // insist on the style of the parent
    el.style.width = "100%";
    el.style.height = "auto";
    el.style.lineHeight = 0; // otherwise a few stray pixels appear at the bottom

    return {
      renderValue: function(x) {

        el.style.background = x.background;

        rmp.colors = x.colors;
        rmp.n = x.n;
        rmp.height = x.height;
        rmp.margin = x.margin;
        rmp.background = x.background;

        rmp.redraw();
      },

      resize: function(width, height) {
        rmp.resize(width, height);
        rmp.redraw();
      },

      // return the object
      rmp: rmp
    };
  }
});
