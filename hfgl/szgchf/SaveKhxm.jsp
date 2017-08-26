<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbhbox=request.getParameterValues("khbhbox");
String[] khbh=request.getParameterValues("khbh");
String[] hflxbm=request.getParameterValues("hflxbm");
String[] hfrqstr=request.getParameterValues("hfrq");
String[] xh=request.getParameterValues("xh");

java.sql.Date hfrq=null;
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

	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}
		if (hfrqstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！序号为["+xh[i]+"]的[回访日期]为空");
			return;
		}
		if (hflxbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！序号为["+xh[i]+"]的[回访类型]为空");
			return;
		}
		

		try{
			hfrq=java.sql.Date.valueOf(hfrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>错误！序号为["+xh[i]+"]的[回访日期]格式输入不正确:【"+hfrqstr[i]+"】");
			return;
		}

		ls_sql="select hfdjbz,NVL(jhjdsj-TRUNC(SYSDATE),1)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
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
			if (hfdjbz.equals("3"))//1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
			{
				conn.rollback();
				out.println("<BR>错误！序号为["+xh[i]+"]的客户全部回访已冻结");
				return;
			}
			else if (hfdjbz.equals("1")){
				if (hflxbm[i].equals("21") || hflxbm[i].equals("22") || hflxbm[i].equals("23") || hflxbm[i].equals("24"))//工程回访
				{
					conn.rollback();
					out.println("<BR>错误！序号为["+xh[i]+"]的客户工程回访已冻结");
					return;
				}
			}
		}
/*
*/
		ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hflxbm[i]);
		ps.setDate(2,hfrq);
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