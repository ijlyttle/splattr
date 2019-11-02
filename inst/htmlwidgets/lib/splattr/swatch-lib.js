class Swatch {

  /* id `string` id of parent element in which to place the Swatch
   *
   */
  constructor(id) {

    // ref: https://html5rocks.com/en/tutorials/canvas/hidpi/

    // take into account retina displays
    const dpr = window.devicePixelRatio || 1;

    const canvas = document.createElement('CANVAS');
    canvas.style.margin = "0";
    canvas.style.width = "calc(100%)";
    canvas.style.height = "40px";
    canvas.style.imageRendering = "crisp-edges";

    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);

    /* determine parent-element, add canvas */
    const parent = document.getElementById(id);
    parent.appendChild(canvas);

    this.parent = parent;
    this.canvas = canvas;
    this.ctx = ctx;
    this.dpr = dpr;

    this._colors = ["#FF0000", "#00FF00", "#0000FF"];
    this._height = 40;
    this._dx = 10;
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

  /* redraw the Swatch
   */
  redraw() {

    const rect = this.canvas.getBoundingClientRect();
    // Give the canvas pixel dimensions of their CSS
    // size * the device pixel ratio.
    this.canvas.width = rect.width * this.dpr;
    this.canvas.height = rect.height * this.dpr;

    const n = this._colors.length;

    const scale =
      Math.min(rect.width / (n * this._height + (n - 1) * this._dx), 1);

    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
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
