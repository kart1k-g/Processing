void setup() {
  fill(0);
  size(500,500);
}

void draw() {
  background(204);
  if (mousePressed) {
    if (mouseX < width/2) {
      rect(0, 0, width/2, height); // Left
    } else {
      rect(width/2, 0, width/2, height); // Right
    }
  }
}
