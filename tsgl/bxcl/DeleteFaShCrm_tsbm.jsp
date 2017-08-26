<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem=cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String cfajlh="";
	String tsjlh="";
	String tsyybm="";
	String getclzt="";
	ls_sql="select cfajlh,tsjlh,tsyybm,clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		cfajlh=cf.fillNull(rs1.getString("cfajlh"));
		tsjlh=cf.fillNull(rs1.getString("tsjlh"));
		tsyybm=cf.fillNull(rs1.getString("tsyybm"));
		getclzt=cf.fillNull(rs1.getString("clzt"));

		if ( !getclzt.equals("9") && !getclzt.equals("A"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
		{
			conn.rollback();
			out.println("错误！处理状态不正确");
			return;
		}


		ls_sql="update crm_tsbxfajl set shsm=null,shr=null,shsj=null,shjl=null,clzt='1' ";
		ls_sql+=" where cfajlh='"+cfajlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="update crm_tsbm set shsm=null,shr=null,shsj=null,clzt='7' ";
		ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_tsbm";
		ls_sql+=" where tsjlh='"+tsjlh+"' and sffswxf='2'";
		ls_sql+=" and clzt in('9','3','B','C','5')";
		//1：未接收；2：已接收等待出方案；4：已接收等待出现场；D：已接收不需出方案；6：已出现场等待方案；7：已出方案等待审核；8：已出方案不需审核；
		//9：方案审核通过；A：方案审核未通过；3：已解决；B：在处理；C：回访未解决；5：结案
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String ddsffswxf="";
		if (count>0)
		{
			ddsffswxf="2";//1：不需赔付；2：发生赔付；3：录入赔付；4：已赔付
		}
		else{
			ddsffswxf="1";
		}

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_tsbm";
		ls_sql+=" where tsjlh='"+tsjlh+"' and sfnbcf='2'";
		ls_sql+=" and clzt in('9','3','B','C','5')";
		//1：未接收；2：已接收等待出方案；4：已接收等待出现场；D：已接收不需出方案；6：已出现场等待方案；7：已出方案等待审核；8：已出方案不需审核；
		//9：方案审核通过；A：方案审核未通过；3：已解决；B：在处理；C：回访未解决；5：结案
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String ddsfnbcf="";
		if (count>0)
		{
			ddsfnbcf="2";//1：不需处罚；2：发生处罚；3：录入处罚；4：已已罚
		}
		else{
			ddsfnbcf="1";
		}

		ls_sql="update crm_tsjl set clzt='6',zrbmclzt='7',sffswxf=?,sfnbcf=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddsffswxf);
		ps.setString(2,ddsfnbcf);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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

