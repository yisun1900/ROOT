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


	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	for (int i=0;i<khbh.length ;i++ )
	{
		out.println("<BR>检查客户："+khbh[i]);
		//更新其它收费项目，调整收费百分比
		ret=dzbj.checkBjjb(conn,khbh[i],9);
		//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别

		if (ret.equals("0"))
		{
			out.println(ret);
			out.println("<P>客户："+khbh[i]+"检查完成！全部正确");
		}
		else{
			out.println(ret);
			out.println("<P>客户："+khbh[i]+"检查完成！出现错误");
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

