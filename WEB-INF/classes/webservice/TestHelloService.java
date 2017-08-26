package webservice;

import java.io.IOException;
import java.net.MalformedURLException;

import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;


/**
 * @author Stephen
 * 
 * ≤‚ ‘µ˜”√WebService
 */
public class TestHelloService {
    
    private static final String HELLO_SERVICE_ENDPOINT = "http://localhost:8090/services/HelloService?wsdl";
	public TestHelloService()
	{
	}
    public static void main(String[] args) {
        TestHelloService tester = new TestHelloService();
        
       tester.callSayHelloToPerson();
    }

    public void callSayHello() {
        try {
            Service service = new Service();
            Call call = (Call) service.createCall();
            call.setTargetEndpointAddress(new java.net.URL(
                    HELLO_SERVICE_ENDPOINT));
            call.setOperationName(new QName("http://webservice.sinosoft.com/",
                    "sayHello"));
            call.setReturnType(org.apache.axis.Constants.XSD_STRING);
            try {
                String ret = (String) call.invoke(new Object[] {});
                System.out.println("The return value is:" + ret);
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        //log.error("call sayHello service error!");
    }

    public void callSayHelloToPerson() {
        try {
            Service service = new Service();
            Call call = (Call) service.createCall();
            call.setTargetEndpointAddress(new java.net.URL(
                    HELLO_SERVICE_ENDPOINT));
            call.setOperationName(new QName("http://webservice.sinosoft.com/",
                    "sayHelloToPerson"));
            call.addParameter("name", org.apache.axis.Constants.XSD_STRING,
                    javax.xml.rpc.ParameterMode.IN);
            call.setReturnType(org.apache.axis.Constants.XSD_STRING);
            try {
                String ret = (String) call.invoke(new Object[] { "Stephen" });
                System.out.println("The return value is:" + ret);
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        //log.error("call sayHello service error!");
    }
}

