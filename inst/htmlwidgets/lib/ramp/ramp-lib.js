class Ramp {

  /* id `string` id of parent element in which to place the Swatch
   *
   */
  constructor(id) {

    // ref: https://html5rocks.com/en/tutorials/canvas/hidpi/

    // take into account retina displays
    const dpr = window.devicePixelRatio || 1;

    const canvas = document.createElement('CANVAS');
    canvas.style.margin = '0';
    canvas.style.width = 'calc(100%)';
    canvas.style.height = '40px';
    canvas.style.imageRendering = 'pixelated';

    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);

    /* determine parent-element, add canvas */
    const parent = document.getElementById(id);
    parent.appendChild(canvas);

    this.parent = parent;
    this.canvas = canvas;
    this.ctx = ctx;
    this.dpr = dpr;

    this._colors = ['#FF0000', '#00FF00', '#0000FF'];
    this._n = 3;
    this._height = 40;
    this._margin = 0;
    this._background = null;

  }

  /* width, height `string` CSS width and height to resize the Swatch
   *
   */
  resize(width, height) {
  }

  /* colors `array` of CSS colors
   *
   */
  set colors(colors) {
    this._colors = colors;
  }

  get colors() {
    this._colors;
  }

  /* height `number` pixels */
  set height(height) {
    this._height = height;
    this.canvas.style.height = height + "px";
  }

  get height() {
    this._height;
  }

  set n(n) {
    this._n = n;
  }

  get n() {
    this._n;
  }

  set margin(margin) {
    this._margin = margin;
    this.canvas.style.margin = margin + "px";
    this.canvas.style.width = `calc(100% - ${2 * margin}px)`;
    this.redraw();
  }

  get margin() {
    this._margin;
  }

  set background(background) {
    this._background = background;
    this.parent.style.background = this._background;
  }

  get background() {
    this.background;
  }

  /* redraw the Swatch
   */
  redraw() {

    const rect = this.canvas.getBoundingClientRect();
    // Give the canvas pixel dimensions of their CSS
    // size * the device pixel ratio.
    this.canvas.width = this._n;
    this.canvas.height = 1;

    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    this.ctx.beginPath();

    const palette = d3v5.interpolateRgbBasis(this._colors);

    for (let i = 0; i < this._n; ++i) {
      this.ctx.fillStyle = palette(i / (this._n - 1));
      this.ctx.fillRect(i, 0, 1, 1);
    }

  }

}
