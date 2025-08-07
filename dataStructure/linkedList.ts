class ListNode<T> {
  value: T;
  next: ListNode<T> | null;

  constructor(value: T) {
    this.value = value;
    this.next = null;
  }
}

class LinkedList<T> {
  head: ListNode<T> | null = null;

  append(value: T): void {
    const newNode = new ListNode(value);
    if (!this.head) {
      this.head = newNode;
      return;
    }

    let current = this.head;
    while (current.next) {
      current = current.next;
    }

    current.next = newNode;
  }

  print(): void {
    let current = this.head;
    while (current) {
      console.log(current.value);
      current = current.next;
    }
  }

  pop(): T | null {
    if (!this.head) return null;

    if (!this.head.next) {
      const value = this.head.value;
      this.head = null;
      return value;
    }

    let current = this.head;
    while (current.next && current.next.next) {
      current = current.next;
    }
    const value = current.next!.value;
    current.next = null;
    return value;
  }

  get(index: number): T | null {
    if (!this.head) return null;

    let current = this.head;
    let i = 0;
    while (current && i < index) {
      current = current.next!;
      i++;
    }

    return current ? current.value : null;
  }

  set(index: number, value: T): boolean {
    if (!this.head) return false;

    let current = this.head;
    let i = 0;
    while (current && i < index) {
      current = current.next!;
      i++;
    }

    if (current) {
      current.value = value;
      return true;
    }

    return false;
  }

  getIndex(value: T): number {
    if (!this.head) return -1;

    let current = this.head;
    let index = 0;

    while (current) {
      if (current.value === value) {
        return index;
      }
      current = current.next!;
      index++;
    }

    return -1;
  }

  length(): number {
    let current = this.head;
    let counter = 0;
    while(current) {
      counter++
      current = current.next!;
    }

    return counter;
  }

  prepend(value: T): void {
    const newNode = new ListNode(value);
    newNode.next = this.head;
    this.head = newNode;
  }

  insertAt(index: number, value: T): void {
    if (index === 0) {
      this.prepend(value);
      return;
    }

    let current = this.head;
    let i = 0;

    while (current && i < index - 1) {
      current = current.next;
      i++;
    }

    if (!current) return;

    const newNode = new ListNode(value);
    newNode.next = current.next;
    current.next = newNode;
  }

  removeAt(index: number): void {
    if (!this.head) return;

    if (index === 0) {
      this.head = this.head.next;
      return;
    }

    let current = this.head;
    let i = 0;

    while (current.next && i < index - 1) {
      current = current.next;
      i++;
    }

    if (!current.next) return;

    current.next = current.next.next;
  }

  toArray(): T[] {
    const array: T[] = [];
    let current = this.head;

    while (current) {
      array.push(current.value);
      current = current.next;
    }

    return array;
  }

  reverse(): void {
    let prev: ListNode<T> | null = null;
    let current = this.head;

    while (current) {
      const next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }

    this.head = prev;
  }
}
