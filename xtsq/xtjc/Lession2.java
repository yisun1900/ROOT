//����Java��������÷Ƿ������ǳ��õ���Set,List��Map���֣���������Ϥһ��Set���ر���HashSet��ʹ�� 


package collection.lession2;
import java.util.HashSet;
import java.util.Set;
/**
 * ������JAVA��߽̳�(2)-��ʶSet����֮HashSet��<br>
 * Set�������治�����ظ������ݡ��������κζ������͡�<br>
 * JDK5�Ժ������Ϳ���ͨ��autobox ����Set���档
 * 
 * @author ������ JAVA������(java2000.net)
 * 
 */
public class Lession2 {
  public static void main(String[] args) {
    // ��ͨ����
    testNormal();
    // ����HashSet��������
    testForHashSet();
    testForHashSet2();
  }
  /**
   * ���Ա��������͵�����.
   */
  public static void testNormal() {
    System.out.println("----- testNormal -----------");
    // Set�ж��ʵ�֣������ȿ�����õ�HashSet
    Set set = new HashSet();
    // ���һ���ַ���
    set.add("�ַ���");
    // ���һ����������
    set.add(new Integer(1));
    // ����JDK5�����ԣ�����һ��������
    set.add(123.45);
    // ���ǿ�����������������
    System.out.println(set.size());
    // ���ǳ�������һ���ظ����ַ���
    set.add("�ַ���");
    // �����ٴο�����������������
    System.out.println(set.size());
    // ���������Կ����Ƿ񼯺��������ĳ������
    System.out.println(set.contains(123.45));
    // ���Ǵ���������������ɾ��
    set.remove(123.45);
    // �����ٴο�����������������
    System.out.println(set.size());
  }
  /**
   * ר�����HashSet�Ĳ��ԡ�
   */
  public static void testForHashSet() {
    System.out.println("----- testForHashSet -----------");
    HashSet<MyObject> set = new HashSet<MyObject>();
    // ����һ��null����
    set.add(null);
    // �����ٴο�����������������
    System.out.println(set.size());
    // �ٴ�����һ��null����
    set.add(null);
    // �����ٴο�����������������
    System.out.println(set.size());
    MyObject obj = new MyObject("java2000", 2);
    set.add(obj);
    obj = new MyObject("csdn", 10);
    set.add(obj);
    // �����ٴο�����������������
    System.out.println(set.size());
    // �ж��Ƿ����ĳ������
    System.out.println(set.contains(obj));
    obj = new MyObject("java2000_net", 2);
    set.add(obj);
    // �����ٴο�����������������
    System.out.println(set.size());
    // ���ǳ��԰�obj�ٴη���set����
    // ��û�����ӣ���Ϊ���ظ���
    set.add(obj);
    System.out.println(set.size());
    // ���ǹ���һ���µĶ������ݺ�ǰ�����ͬ
    obj = new MyObject("java2000_net", 2);
    set.add(obj);
    System.out.println(set.size());
    // �����޸�һ��obj��������䣬�ٿ���
    obj.setAge(3);
    // �����ٲ��Կ����Ƿ�����˶���
    // ��ע�⣬�������obj��ǰ���obj��ͬһ������
    // ���ǽ����޸���һ�����ǵ�����
    System.out.println(set.contains(obj));
    // ���ǳ��԰�obj�ٴη���set����
    // �����������˳���
    set.add(obj);
    System.out.println(set.size());
  }
  /**
   * ר�����HashSet�Ĳ���2��
   */
  public static void testForHashSet2() {
    System.out.println("----- testForHashSet2 -----------");
    HashSet<MyObject2> set = new HashSet<MyObject2>();
    MyObject2 obj = null;
    for (int i = 0; i < 3; i++) {
      obj = new MyObject2("java2000" + i, i);
      set.add(obj);
      System.out.println(set.size());
    }
  }
}
class MyObject {
  private int age;
  private String name;
  public int getAge() {
    return age;
  }
  public void setAge(int age) {
    this.age = age;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  MyObject(String name, int age) {
    this.name = name;
    this.age = age;
  }
  public boolean equals(Object obj) {
    System.out.println("equals");
    if (obj == null || !(obj instanceof MyObject)) {
      return false;
    }
    MyObject o = (MyObject) obj;
    return this.age == o.age && this.name.equals(o.name);
  }
  public int hashCode() {
    int hashCode = name.hashCode() + String.valueOf(age).hashCode();
    return hashCode;
  }
}
class MyObject2 {
  private int age;
  private String name;
  public int getAge() {
    return age;
  }
  public void setAge(int age) {
    this.age = age;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  MyObject2(String name, int age) {
    this.name = name;
    this.age = age;
  }
  public boolean equals(Object obj) {
    System.out.println("equals");
    if (obj == null || !(obj instanceof MyObject2)) {
      return false;
    }
    MyObject2 o = (MyObject2) obj;
    return this.age == o.age && this.name.equals(o.name);
  }
  public int hashCode() {
    return 1;
  }
}
class MyObject3 {
  private int age;
  private String name;
  // ����һ���������п���
  // һ��������hashCode,���ٱ䶯
  private int HASHCODE = Integer.MIN_VALUE;
  public int hashCode() {
    if (HASHCODE == Integer.MIN_VALUE) {
      // �������ɱ����hashCode
      HASHCODE = name.hashCode() + String.valueOf(age).hashCode();
    }
    return HASHCODE;
  }
}
