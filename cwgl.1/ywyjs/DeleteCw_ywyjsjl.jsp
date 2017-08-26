<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh=request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String spbz="";
		ls_sql="select spbz";
		ls_sql+=" from  cw_ywyjsjl";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			spbz=rs.getString("spbz");
		}
		else{
			conn.rollback();
			out.println("错误！结算记录号："+jsjlh[i]+"不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!spbz.equals("1") && !spbz.equals("2"))
		{
			conn.rollback();
			out.println("错误！结算记录号："+jsjlh[i]+"结算状态不正确");
			return;
		}

		String khbh="";
		String tclx="";
		ls_sql="select khbh,tclx";
		ls_sql+=" from  cw_ywyjsmx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			tclx=rs.getString("tclx");

			String ywyjsjlh="";
			String ywyjsbz="";
			ls_sql="select ywyjsjlh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ywyjsjlh=cf.fillNull(rs1.getString("ywyjsjlh"));
			}
			rs1.close();
			ps1.close();

			if (ywyjsjlh.equals(""))
			{
				ywyjsbz="0";
			}
			else{
				ywyjsbz="1";
			}

			if (tclx.equals("1"))//1：签单提成；2：完工提成；3：设计客户；4：退单
			{
				ls_sql=" update crm_khxx set ywyjsbz='0',ywyqdjsbl=null,ywyqdjsje=null,ywyjsjlh=null";
				ls_sql+=" where crm_khxx.khbh='"+khbh+"' ";//0：未结算；1：签单结算；2：完工结算
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (tclx.equals("2"))//1：签单提成；2：完工提成；3：设计客户；4：退单
			{
				ls_sql=" update crm_khxx set ywyjsbz='1',ywywgjsbl=null,ywywgjsje=null,ywywgjsjlh=null";
				ls_sql+=" where crm_khxx.khbh='"+khbh+"' ";//0：未结算；1：签单结算；2：完工结算
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (tclx.equals("4"))//1：签单提成；2：完工提成；3：设计客户；4：退单
			{
				ls_sql=" update crm_khxx set ywyjsbz='"+ywyjsbz+"',ywywgjsbl=null,ywywgjsje=null,ywywgjsjlh=null";
				ls_sql+=" where crm_khxx.khbh='"+khbh+"' ";//0：未结算；1：签单结算；2：完工结算
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

		}
		rs.close();
		ps.close();

		ls_sql="delete from cw_ywyjsmx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_ywyqtfymx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_ywyjsjl";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


	}


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
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
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