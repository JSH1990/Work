package 접근제한자;

public class ParentRest {
    public String name; //누구나 접근 가능
    String money; //동일패키지와 다른 패키지의 상속 관계가 있으면 접근가능
    String addr; //default 접근 제한자는 동일 패키지 내에서 접근가능
    public ParentRest(){
        name = "곰돌이 사육사";
        money = "100억";
        addr = "수원";
    }
}
