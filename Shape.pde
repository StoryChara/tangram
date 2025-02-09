abstract class Shape {
  float _rotation;                                       // Rotacion actual de la pieza
  float _scaling;                                        // Escala actual de la pieza
  PVector _position;                                     // Posicion actual de la pieza
  color _hue;                                            // Color actual de la pieza
  boolean _use = false;                                  // Interruptor de uso
  float[] grades = {0, PI/4, PI/2, 3/4*PI, PI, 5/4*PI, 3/2*PI, 7/4*PI, 2*PI};
  float[] scales = {-1, 1};

/*--------------------------------------------------------------------------------------------------*/

  Shape() {
    _position = new PVector(random(200, width-200), random(200, height-200));
    _rotation = grades[(int) random(grades.length)];
    _scaling = 1;
    _hue = color(random(0, 255), random(0, 255), random(0, 255));
  }

  Shape(PVector position, float rotation,float scaling, color hue) {
    setPosition(position);
    setRotation(rotation);
    setScaling(scaling);
    setHue(hue);
  }

/*--------------------------------------------------------------------------------------------------*/

  void draw() {
    push();                                                
    fill(hue());                                           // Rellena la pieza con el color
    translate(position().x, position().y);                 // Mueve la pieza a la posicion
    rotate(rotation());                                    // Rota la figura segun la rotacion
    scale(scaling(), 1);                                   // Escala actual de la pieza
    if (!_use) { strokeWeight(1); stroke(0,5,75); }        // Grosor y Color Linea Sin Uso
    else { strokeWeight(2); stroke(255,0,0); }             // Grosor y Color Linea En Uso
    aspect();
    pop();
  }

/*--------------------------------------------------------------------------------------------------*/

  abstract void aspect();                                  // Crea la pieza

/*--------------------------------------------------------------------------------------------------*/
 
  void contains(color comparison) {                        // Compara un color con el de la
    if (comparison == _hue) {                              // pieza, si son iguales cambia
      _use = !_use; }                                      // de estado el interruptor de uso
  }
  
  boolean use(){                                           // Devuelve el estado del
    return _use;                                           // interruptor de uso
  }

  void changeUse(){                                        // Cambia el estado del
    _use = !_use;                                          // interruptor de uso
  }

/*--------------------------------------------------------------------------------------------------*/

  float rotation() {
    return _rotation;                                      // Devuelve la rotacion actual
  }

  void setRotation(float rotation) {
    _rotation = rotation;                                  // Fija la rotacion a una dada
  }

/*--------------------------------------------------------------------------------------------------*/

  PVector position() {
    return _position;                                      // Devuelve la posicion actual
  }

  void setPosition(PVector position) {
    _position = position;                                  // Fija la posicion a una dada
  }

/*--------------------------------------------------------------------------------------------------*/

  color hue() {
    return _hue;                                           // Devuelve el color actual
  }

  void setHue(color hue) {
    _hue = hue;                                            // Fija el color a uno dado
  }

/*--------------------------------------------------------------------------------------------------*/

 float scaling() {
    return _scaling;                                       // Devuelve la escala actual
  }

  void setScaling(float scaling) {
    _scaling = scaling;                                    // Fija la escala a una dada
  }
  
  void changeScaling(){
    _scaling *= -1;                                        // Invierte la escala para la reflexion
  }
}
