class Rhomboid extends Shape {
  float _edge, distance, aux;

  Rhomboid(float edge) {
    setEdge(edge);
    distance = edge()/2;
    aux = distance+edge();
  }

  @Override
  void aspect() {
    quad(0,0, distance, distance, aux, distance, edge(), 0);
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
}
