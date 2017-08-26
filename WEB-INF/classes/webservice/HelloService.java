package webservice;

/** *//**
 * @author Stephen
 * 
 * Test web service
 */
public class HelloService {
    /** *//**
     * ���������ĺ���
     * 
     * @return ����Hello�ַ���
     */
    public String sayHello() {
        return "Hello";
    }

    /** *//**
     * �������ĺ���
     * 
     * @param name
     *            ����
     * @return ���ؼ������ƵĻ�ӭ��
     */
    public String sayHelloToPerson(String name) {
        if (name == null || name.equals("")) {
            name = "nobody";
        }
        return "Hello " + name;
    }
}