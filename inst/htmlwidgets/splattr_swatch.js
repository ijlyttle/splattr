HTMLWidgets.widget({

  name: "splattr_swatch",

  type: "output",

  factory: function(el, width, height) {

    // create our sigma object and bind it to the element
    var swt = new Swatch(el.id);

    // insist on the style of the parent
    el.style = "width: 100%; height: auto;";

    return {
      renderValue: function(x) {
        swt.colors = x.colors;
        swt.dx = x.dx;
        swt.height = x.height;
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
