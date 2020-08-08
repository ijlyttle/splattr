class Swatch {

  /* id `string` id of parent element in which to place the Swatch
   *
   */
  constructor(id) {

    // ref: https://html5rocks.com/en/tutorials/canvas/hidpi/

    // take into account retina displays
    const dpr = window.devicePixelRatio || 1;

    // canvas
    const canvas = document.createElement('CANVAS');
    canvas.style.width = "calc(100%)";
    canvas.style.imageRendering = "crisp-edges";

    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);

    // enclosing div
    const div = document.createElement('div');
    div.appendChild(canvas);

    /* determine parent-element, add div */
    const parent = document.getElementById(id);
    parent.appendChild(div);

    this.parent = parent;
    this.div = div;
    this.canvas = canvas;
    this.ctx = ctx;
    this.dpr = dpr;

    this.colors = ["#FF0000", "#00FF00", "#0000FF"];
    this.height = 40;
    this.dx = 10;
    this.margin = 0;
    this.background = null;
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

  set dx(dx) {
    this._dx = dx;
  }

  get dx() {
    this._dx;
  }

  set margin(margin) {
    this._margin = margin;
    this.canvas.style.margin = margin + "px";
    this.redraw();
  }

  get margin() {
    this._margin;
  }

  set background(background) {
    this._background = background;
    this.div.style.background = background;
  }

  get background() {
    this.background;
  }

  /* redraw the Swatch
   */
  redraw() {

    const n = this._colors.length;

    // work out the maximum width for the enclosing div
    const widthMax = 2 * this._margin + n * this._height + (n - 1) * this._dx;
    this.div.style.maxWidth = `${widthMax}px`;

    const rect = this.canvas.getBoundingClientRect();
    // Give the canvas pixel dimensions of their CSS
    // size * the device pixel ratio.
    this.canvas.width = rect.width * this.dpr;
    this.canvas.height = rect.height * this.dpr;

    const scale =
      Math.min((rect.width - 2 * this._margin) / (n * this._height + (n - 1) * this._dx), 1);

    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    this.ctx.beginPath();

    // colors
    this._colors.map((x, index) => ({
      color: x,
      coords: [
        index * (this._height + this._dx) * this.dpr * scale,
        0,
        this._height * this.dpr * scale,
        this._height * this.dpr
      ]
    })).map(x => {
      this.ctx.fillStyle = x.color;
      this.ctx.fillRect(...x.coords);
    });

  }

}
