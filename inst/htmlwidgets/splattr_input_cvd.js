HTMLWidgets.widget({

  name: "splattr_input_cvd",

  type: "output",

  factory: function(el, width, height) {

    // create our sigma object and bind it to the element
    var cvd = new InputCvd(el.id);

    return {
      renderValue: function(x) {
        cvd.label_text = x.label;
      },

      resize: function(width, height) {
      },

      // return the object
      c: cvd
    };
  }
});
