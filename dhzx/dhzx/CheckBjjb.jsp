<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");

Connection conn  = null;
String  ret="";

try {
	conn=cf.getConnection();


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	for (int i=0;i<khbh.length ;i++ )
	{
		out.println("<BR>���ͻ���"+khbh[i]);
		//���������շ���Ŀ�������շѰٷֱ�
		ret=dzbj.checkBjjb(conn,khbh[i],9);
		//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���

		if (ret.equals("0"))
		{
			out.println(ret);
			out.println("<P>�ͻ���"+khbh[i]+"�����ɣ�ȫ����ȷ");
		}
		else{
			out.println(ret);
			out.println("<P>�ͻ���"+khbh[i]+"�����ɣ����ִ���");
		}

	}


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

