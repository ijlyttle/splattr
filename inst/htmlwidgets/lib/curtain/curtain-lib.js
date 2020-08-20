class Curtain {

   /* id `string` id of parent element in which to place the Curtain
   *
   */
  constructor(id) {

  }

  /* colors `string[]`, CSS colors
   *
   */
  set colors(colors) {
    this._colors = colors;
  }

  get colors() {
    this._colors;
  }

  /* width `number`, canvas-width (pixels)
   *
   */
  set width(width) {
    this._width = width;
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

  /* waveExponent `number`, exponent used for vertical dampening of the sine wave (pixels)
   *
   */
  set nColorInterp(nColorInterp) {
    this._nColorInterp = nColorInterp;
    this.redraw();
  }

  get nColorInterp() {
    this._nColorInterp;
  }

  /* width, height `string` CSS width and height to resize the Swatch
   *
   */
  resize(width, height) {
  }

  redraw() {
  }
}
