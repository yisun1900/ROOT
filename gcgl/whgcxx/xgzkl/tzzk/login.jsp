<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;


String yhdlm=request.getParameter("yhdlm").trim();
String yhkl=request.getParameter("yhkl").trim();
String khbh=request.getParameter("khbh");

String getYhkl="";


try {
	conn=cf.getConnection();   //�õ�����



	int count=0;
	sql="select yhkl";
	sql+=" from sq_yhxx ";
	sql+=" WHERE yhdlm='"+ yhdlm + "' and kdlxtbz='Y' and sq_yhxx.sfzszg in('Y','N','C')";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		getYhkl=rs.getString(1);
	}
	rs.close();
	ps.close();

	getYhkl=cf.makejm(getYhkl);

	if (!getYhkl.equals(yhkl))
	{
		out.println("�����û������벻��ȷ");
		return;
	}

	//�����ͻ��ۿ�:Ȩ��
	sql="select count(*)";
	sql+=" from v_sqxx";
	sql+=" where  yhdlm='"+yhdlm+"' and cdbh='033301'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		response.sendRedirect("/dhzx/tzzk/InsertCrm_tzzkjl.jsp?khbh="+khbh);
	}
	else{
		out.println("������Ȩ�޵��ۿ�");
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%>


