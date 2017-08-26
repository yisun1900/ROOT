<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");
String[] hfrqstr=request.getParameterValues("hfrq");

java.sql.Date hfrq=null;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String gcjdbm=null;
String sjkgrq=null;
String ls_sql=null;

String jsfxhf=null;
String xsfxhf=null;
java.sql.Date jhfrq=null;
String xhfrq=null;
String jhflxbm=null;
String xhflxbm=null;

String hfdjbz=null;
int jdsj=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		try{
			hfrq=java.sql.Date.valueOf(hfrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>序号为["+(i+1)+"]的[回访日期]格式输入不正确:"+hfrqstr[i]);
			return;
		}

		ls_sql="SELECT gcjdbm,sjkgrq,sfxhf,hfrq,hflxbm,hfdjbz,NVL(jhjdsj-TRUNC(SYSDATE),1) jdsj";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
			jsfxhf=cf.fillNull(rs.getString("sfxhf"));
			jhfrq=rs.getDate("hfrq");
			jhflxbm=cf.fillNull(rs.getString("hflxbm"));
			hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
			jdsj=rs.getInt("jdsj");
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		ps.close();
		rs.close();


		if (jdsj>0)
		{
			if (hfdjbz.equals("3"))//1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
			{
				conn.rollback();
				out.println("<BR>错误！序号为["+(i+1)+"]的客户全部回访已冻结");
				return;
			}
			else if (hfdjbz.equals("1")){
				conn.rollback();
				out.println("<BR>错误！序号为["+(i+1)+"]的客户工程回访已冻结");
				return;
			}
		}

		if (!gcjdbm.equals("2"))
		{
			out.println("<BR>！！！警告，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]工程进度不正确");
		}
		if (sjkgrq.equals(""))
		{
			out.println("<BR>！！！警告，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]实开工日期不存在");
		}


		ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?,skghfbz='Y'";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"21");
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