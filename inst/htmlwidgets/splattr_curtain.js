HTMLWidgets.widget({

  name: 'curtain',

  type: 'output',

  factory: function(el, width, height) {

    // create our curtain object and bind it to the element
    var ctn = new Curtain(el.id);

    // insist on the style of the parent
    el.style.width = "100%";
    el.style.height = "auto";
    el.style.lineHeight = 0; // otherwise a few stray pixels appear at the bottom

    return {

      renderValue: function(x) {

        ctn.colors = x.colors;
        ctn.width = x.width;
        ctn.height = x.height;
        ctn.margin = x.margin;
        ctn.background = x.background;
        ctn.waveWidth = x.waveWidth;
        ctn.waveAmplitude = x.waveAmplitude;
        ctn.waveExponent = x.waveExponent;
        ctn.nColorInterp = x.nColorInterp;

        ctn.redraw();
      },

      resize: function(width, height) {

        ctn.resize(width, height);

        ctn.redraw();
      },

      // return the object
      ctn: ctn
    };
  }
});
