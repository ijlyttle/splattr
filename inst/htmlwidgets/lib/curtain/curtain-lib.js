class Curtain {

   /* id `string` id of parent element in which to place the Curtain
   *
   */
  constructor(id) {

    // the only thing we can provide to the constructor is the id
    //   everything else is set when rendered

    // canvas
    const dpr = window.devicePixelRatio || 1;

    const canvas = document.createElement('CANVAS');
    canvas.style.imageRendering = 'pixelated';

    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);

    // enclosing div
    const div = document.createElement('div');
    div.appendChild(canvas);

    // determine parent-element, add div
    const parent = document.getElementById(id);
    parent.appendChild(div);

  }

  /* colors `string[]`, CSS colors
   *
   */
  set colors(colors) {
    this._colors = colors;
    // set internal colors, will also depend on cvd
    this.redraw();
  }

  get colors() {
    this._colors;
  }

  /* width `number`, canvas-width (pixels)
   *
   */
  set width(width) {
    this._width = width;
    this.canvas.style.width = `${width}px`;
    this.redraw();
  }

  get width() {
    this._width;
  }

  /* height `number`, canvas-height (pixels)
   *
   */
  set height(height) {
    this._height = height;
    this.canvas.style.height = `${height}px`;
    this.redraw();
  }

  get height() {
    this._height;
  }

  /* margin `number`, cmargin around canvas (pixels)
   *
   */
  set margin(margin) {
    this._margin = margin;
    this.canvas.style.margin = `${margin}px`;
    this.redraw();
  }

  get margin() {
    this._margin;
  }

  /* background `string`, CSS color for canvas background (pixels)
   *
   */
  set background(background) {
    this._background = background;
  }

  get background() {
    this._background;
  }

  /* waveWidth `number`, wavelength of the sine wave (pixels)
   *
   */
  set waveWidth(waveWidth) {
    this._waveWidth = waveWidth;
    this.redraw();
  }

  get waveWidth() {
    this._waveWidth;
  }

  /* waveAmplitude `number`, amplitude of the sine wave (pixels)
   *
   */
  set waveAmplitude(waveAmplitude) {
    this._waveAmplitude = waveAmplitude;
    this.redraw();
  }

  get waveAmplitude() {
    this._waveAmplitude;
  }

  /* waveExponent `number`, exponent used for vertical dampening of the sine wave (pixels)
   *
   */
  set waveExponent(waveExponent) {
    this._waveExponent = waveExponent;
    this.redraw();
  }

  get waveExponent() {
    this._waveExponent;
  }

  /* nColorInterp `number`, number of colors interpolated on canvas
   *
   */
  set nColorInterp(nColorInterp) {
    this._nColorInterp = nColorInterp;
  }

  get nColorInterp() {
    this._nColorInterp;
  }

  get colorsInterp() {
    this._colorsInterp;
  }

  /* width, height `string` CSS width and height to resize the curtain
   *
   */
  resize(width, height) {
  }

  recolor(colors, nColorInterp) {

  }

  redraw() {
  }
}
