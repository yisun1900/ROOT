<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
//把转出款记录拆分成两笔
String fkxh=null;
String khbh=null;
String fklxbm=null;
String newfkxh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="alter table crm_zxkhxx add (sjfbz char(1) null,sjf number(16,2) null,jsjfsj date NULL)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set sjfbz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="alter table crm_zxkhxx modify (sjfbz char(1) not null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select fkxh,khbh,fklxbm";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fklxbm in('53') and scbz='N'";//53:设计费
	ls_sql+=" order by fkxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		fkxh=rs1.getString("fkxh");
		khbh=rs1.getString("khbh").trim();
		fklxbm=rs1.getString("fklxbm");


		double sfke=0;
		double maxsfke=0;
		java.sql.Date jsjfsj=null;
		String sjfbz="N";
		ls_sql="select sum(fkje),max(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//设计费
			maxsfke=rs.getDouble(2);//最大设计费
			jsjfsj=rs.getDate(3);//交设计费时间
		}
		rs.close();
		ps.close();

		if (sfke>0)
		{
			sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
		}
		else 
		{
			if (maxsfke>0)
			{
				sjfbz="T";
			}
			else{
				sjfbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjfbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jsjfsj);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


	conn.commit();
	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>