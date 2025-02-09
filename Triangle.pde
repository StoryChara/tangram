class Triangle extends Shape {
  float _edge;

  Triangle(float edge) {
    setEdge(edge);
  }

  @Override
  void aspect() {
    triangle (0, 0, edge(), 0, edge(), edge());
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
}
