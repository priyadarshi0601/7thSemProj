import java.util.*;
public class test{
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);
        int d=sc.nextInt();
        System.out.println(d);
        for (int p=0;p<d;p++){
            String k=sc.nextLine();
            System.out.println(k.length());
            if(k.length()>0 && k.charAt(0)=='U'){
                System.out.println('P');
            }
            
        }
    }
}