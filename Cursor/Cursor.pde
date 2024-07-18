void setup() {
  size(100, 100);
}

void draw() {
  if (mouseX < 50) {
    cursor(CROSS);//either ARROW, CROSS, HAND, MOVE, TEXT, or WAIT
  } else {
    cursor(HAND);
  }
}
