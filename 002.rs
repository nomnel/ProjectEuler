struct FibonacciNumbers {
    a: u32,
    b: u32
}

impl FibonacciNumbers {
    fn new() -> FibonacciNumbers {
        FibonacciNumbers { a: 1, b: 2 }
    }
}

impl Iterator for FibonacciNumbers {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        let c = self.a + self.b;
        self.a = self.b;
        self.b = c;

        Some(self.a)
    }
}

fn main() {
    let numbers = FibonacciNumbers::new();
    let answer: u32 = numbers.take_while(|&n| n < 4000000).filter(|&n| n % 2 == 0).sum();
    println!("answer: {}", answer);
}