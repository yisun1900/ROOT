package webservice;

/** *//**
 * @author Stephen
 * 
 * Test web service
 */
public class HelloService {
    /** *//**
     * 不带参数的函数
     * 
     * @return 返回Hello字符串
     */
    public String sayHello() {
        return "Hello";
    }

    /** *//**
     * 带参数的函数
     * 
     * @param name
     *            名称
     * @return 返回加上名称的欢迎词
     */
    public String sayHelloToPerson(String name) {
        if (name == null || name.equals("")) {
            name = "nobody";
        }
        return "Hello " + name;
    }
}