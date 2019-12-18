class InputCvd {

  constructor(id) {

    /* determine parent-element */
    const parent = document.getElementById(id);

    /* internal methods */
    const create_label = function(id) {

      const label = document.createElement('label');

      label.setAttribute(id, `${id}-label`);
      label.innerText = '';

      return label;
    };

    const create_radio = function(id) {

      const id_radio = `${id}-radio`;

      /* container */
      const container = document.createElement('div');
      container.setAttribute(id, id_radio);

      /* label */
      const label = document.createElement('label');
      label.setAttribute(`for`, id_radio);
      label.innerText = "Condition:";

      /* buttons */
      const values = ['none', 'protan', 'deutan', 'tritan'];

      values.Map

      container.appendChild(label);

      return container;
    };


    /* add elements */
    /* label */
    this.label = create_label(id);

    /* radio input */
    this.radio = create_radio(id);

    /* slider input */
    /* slider output */

    /* add to parent */
    parent.appendChild(this.label);
    parent.appendChild(this.radio);

  }

  set label_text(text) {
    this.label.innerText = text;
  }

  get label_text() {
    this.label.innerText;
  }

  set radio_value(condition) {
    this.radio
  }

  get radio_value() {

  }

}
