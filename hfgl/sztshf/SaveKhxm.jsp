<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] tsjlhbox=request.getParameterValues("khbhbox");
String[] tsjlh=request.getParameterValues("tsjlh");
String[] hfsjstr=request.getParameterValues("hfsj");

java.sql.Date hfsj=null;
String ls=null;

String hfdjbz=null;
int jdsj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<tsjlh.length ;i++ )
	{
		if (!cf.searchArray(tsjlhbox,tsjlh[i]))
		{
			continue;
		}
		if (hfsjstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！受理序号为["+tsjlh[i]+"]的[回访日期]为空");
			return;
		}
		

		try{
			hfsj=java.sql.Date.valueOf(hfsjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>错误！受理序号为["+tsjlh[i]+"]的[回访日期]格式输入不正确:"+hfsjstr[i]);
			return;
		}

		ls_sql="select hfdjbz,NVL(jhjdsj-TRUNC(SYSDATE),1)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
			jdsj=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (jdsj>0)
		{
			if (hfdjbz.equals("Y"))//1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
			{
				conn.rollback();
				out.println("<BR>错误！受理序号为["+tsjlh[i]+"]的记录回访已冻结");
				return;
			}
		}
/*
*/
		ls_sql="update crm_tsjl set sfxhf='Y',hfsj=?";
		ls_sql+=" where  tsjlh='"+tsjlh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,hfsj);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>