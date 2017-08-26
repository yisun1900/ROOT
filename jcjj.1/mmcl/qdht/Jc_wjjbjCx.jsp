<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%  
String wjjbm = request.getParameter("wjjbm");
String xh = request.getParameter("xh");
String dqbm = request.getParameter("dqbm");

double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String c1=null;
String c2=null;
String xinghao=null;

try {

	conn=cf.getConnection();

	if (xh!=null)
	{
		ls_sql="select xinghao,dj ";
		ls_sql+=" from  jc_wjjbj";
		ls_sql+=" where  xh="+xh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xinghao=cf.fillNull(rs.getString("xinghao"));
			dj=rs.getDouble("dj");
		}
		rs.close();
		ps.close();


		%>
			if ((parent.main.insertform.mmsbsbm.value!="") && ("<%=xinghao%>".indexOf("**")!=-1))
			{
				parent.main.insertform.dj.value="<%=dj%>";
				parent.main.insertform.xinghao1.value="<%=xinghao%>";
				parent.main.insertform.xinghao.value=replace("<%=xinghao%>","**",getSubStr(parent.main.insertform.mmsbsbm));
			}
			else{
				parent.main.insertform.dj.value="<%=dj%>";
				parent.main.insertform.xinghao.value="<%=xinghao%>";
				parent.main.insertform.xinghao1.value="<%=xinghao%>";
			}
		<%

	}
	else if (wjjbm!=null)
	{
		%>
			parent.main.insertform.dj.value="";
			parent.main.insertform.xinghao.value="";
			parent.main.insertform.xh.length=0;
			parent.main.addItem(parent.main.insertform.xh,"","");
		<%

		//Îå½ð¼þ±àÂë
		ls_sql="select xh,wjmc||'£¤:'||dj ";
		ls_sql+=" from jc_wjjbj,jdm_wjjbm";
		ls_sql+=" where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm ";
		ls_sql+=" and jc_wjjbj.wjjbm='"+wjjbm+"' and jc_wjjbj.dqbm='"+dqbm+"'";
		ls_sql+=" order by xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			c1=cf.fillNull(rs.getString(1));
			c2=cf.fillNull(rs.getString(2));

			%>
				parent.main.addItem(parent.main.insertform.xh,"<%=c2%>","<%=c1%>");
			<%
		}
		rs.close();
		ps.close();
	}




}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

//-->
</SCRIPT>
