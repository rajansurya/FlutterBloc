mixin A on Animal {
  void test1() {}
}
mixin B {
  void testB() {}
}

class C extends Animal with A, B {
  @override
  void test1() {
    super.test1();
  }

  @override
  void testB() {
    super.testB();
  }
}

class Animal {}
