package 인터페이스활용;

public class CustomerTest {
    public static void main(String[] args) {
//        Customer customer = new Customer();
//        Buy buyer = customer; //customer 타입의 customer 참조변수를 Buy 인터페이스형 BUY 참조 변수에 대입(형 변환)
//        buyer.buy(); //buyer 는 Buy 인터페이스의 메소드만 호출 가능
//
//        Sell sell = customer; //자동 형변환이 일어 남
//        sell.sell();
//
//        Customer customer1 = (Customer) sell; // 다시 역으로 형 변환 (다운 캐스팅)
//        customer1.buy();
//        customer1.sell();


        Customer customer = new Customer();
        Buy buyer = customer;
        buyer.buy();
        buyer.order(); //재정의된 메소드가 호출 됨

        Sell seller = customer;
        seller.sell();
        seller.order();

    }
}
