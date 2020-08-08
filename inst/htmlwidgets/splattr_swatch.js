HTMLWidgets.widget({

  name: "splattr_swatch",

  type: "output",

  factory: function(el, width, height) {

    // create our sigma object and bind it to the element
    var swt = new Swatch(el.id);

    // insist on the style of the parent
    el.style.width = "100%";
    el.style.height = "auto";
    el.style.lineHeight = 0; // otherwise a few stray pixels appear at the bottom

    return {
      renderValue: function(x) {
        swt.colors = x.colors;
        swt.dx = x.dx;
        swt.height = x.height;
        swt.margin = x.margin;
        swt.background = x.background;
        swt.redraw();
      },

      resize: function(width, height) {
        swt.resize(width, height);
        swt.redraw();
      },

      // return the object
      s: swt
    };
  }
});
