HTMLWidgets.widget({

  name: "swatch",

  type: "output",

  factory: function(el, width, height) {

    // create our sigma object and bind it to the element
    var swt = new Swatch(el.id);

    return {
      renderValue: function(x) {
        swt.colors = x.colors;
        swt.dx = x.dx;
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
