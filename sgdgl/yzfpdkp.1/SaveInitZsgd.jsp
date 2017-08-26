<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="update sq_sgd set mqzsgds=(select count(*) from crm_khxx where crm_khxx.fgsbh='"+ssfgs+"' and crm_khxx.sgd=sq_sgd.sgd and zt='2' and gcjdbm not in('4','5'))";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update sq_bzxx set mqzsgds=0,bzpdjf=0,yygrsl=0,kygrsl=grsl";
	ls_sql+=" where sgd in(select sgd from sq_sgd where ssfgs='"+ssfgs+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double qye=0;
	double guanlif=0;
	double suijin=0;
	String khbh=null;
	String gcjdbm=null;
	String sgd=null;
	String sgbz=null;
	ls_sql="SELECT khbh,sgd,sgbz,qye,guanlif,suijin,gcjdbm";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where crm_khxx.fgsbh='"+ssfgs+"' and zt='2' and gcjdbm not in('4','5')";
	ls_sql+=" and sgd is not null and  sgbz is not null";
	ls_sql+=" order by sgd,sgbz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		sgd=rs.getString("sgd");
		sgbz=rs.getString("sgbz");
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		gcjdbm=rs.getString("gcjdbm");

		qye=qye+guanlif+suijin;

		int zygrsl=0;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_gcjddjjl ";
		ls_sql+=" where khbh='"+khbh+"' and gcjdbm='3' ";//3：中期验收
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//已过中期
		{
			if (qye<=100000)
			{
				zygrsl=1;
			}
			else if (qye>100000 & qye<=200000)
			{
				zygrsl=2;
			}
			else if (qye>200000 & qye<=300000)
			{
				zygrsl=2;
			}
			else
			{
				zygrsl=3;
			}
		}
		else{
			if (qye<=100000)
			{
				zygrsl=2;
			}
			else if (qye>100000 & qye<=200000)
			{
				zygrsl=3;
			}
			else if (qye>200000 & qye<=300000)
			{
				zygrsl=4;
			}
			else
			{
				zygrsl=5;
			}
		}
		
		
		
		
		ls_sql="update sq_bzxx set mqzsgds=mqzsgds+1,yygrsl=yygrsl+"+zygrsl+",kygrsl=kygrsl-"+zygrsl;
		ls_sql+=" where  bzmc ='"+sgbz+"' and sgd ='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	

	
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>