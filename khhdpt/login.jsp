<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=null;
//get参数cUserID、cPassword
String yhdlm=request.getParameter("yhdlm").trim();
String yhkl=request.getParameter("yhkl").trim();

//是否投诉报修受理部门
String gzrq=new Date(System.currentTimeMillis()).toString();//工作日期
String ip=request.getRemoteHost();

String kdlbz="";
String hth="";
String sfzhm="";
String khbh="";
String getYhkl="";
String yhmc="";

int logonvalue=0;
//查询用户登陆信息

try {
	conn=cf.getConnection();   //得到连接
//	out.println("<BR>conn="+conn);

//这里是新添加的内容2006-04-21

	sql="select khxm,yhkl,kdlbz,hth,khbh";//合同号为用户名
	sql+=" from crm_khxx";
	sql+=" WHERE  crm_khxx.yhdlm='"+yhdlm+ "'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())//用户存在
	{
		getYhkl=cf.fillNull(rs.getString("yhkl")).trim();
		yhmc=cf.fillNull(rs.getString("khxm")).trim();
		kdlbz=cf.fillNull(rs.getString("kdlbz")).trim();
		hth=cf.fillNull(rs.getString("hth")).trim();
		khbh=cf.fillNull(rs.getString("khbh")).trim();

		//验证密码是否正确
		
		if (getYhkl.equals(yhkl) && !kdlbz.equals("02") )
		{//密码正确

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'1',?,?,SYSDATE) ";//：用户名登陆；2：合同号登陆；3：口令不正确；4：身份证号不正确；5：用户登陆名不存在
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,cf.GB2Uni(yhdlm));
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			
			session.setAttribute("yhdlm",yhdlm);
			session.setAttribute("hth",hth);
			session.setAttribute("khbh",khbh);
			session.setAttribute("yhmc",yhmc);
			session.setAttribute("zgsmc","松下亿达");//公司的显示名称
			response.sendRedirect("khhdpt.html");

			return;
		}
		else
		{

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'3',?,?,SYSDATE) ";//：用户名登陆；2：合同号登陆；3：口令不正确；4：身份证号不正确；5：用户登陆名不存在
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,yhdlm);
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			%>
			<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
			<TR><TD WIDTH="253"></TD><TD WIDTH="385">
			<table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
			  <TR>
				<TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[系统提示]</strong></font></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="51"><div align="center">用户或密码不正确!!</div></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
					<input type="button"  value="返回" onClick="window.history.back()">
				  </div></TD>
			  </TR>
			  </TABLE>
			  </TD><TD WIDTH="339"></TD>
			  <TR>
			</TABLE>
			<%

			return;
			
		}
	}
	rs.close();
	ps.close();


	sql="select khxm,yhkl,kdlbz,hth,khbh,sfzhm";//合同号为用户名
	sql+=" from crm_khxx";
	sql+=" WHERE  crm_khxx.hth='"+yhdlm+ "'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())//用户存在
	{
		getYhkl=cf.fillNull(rs.getString("sfzhm")).trim();
		yhmc=cf.fillNull(rs.getString("khxm")).trim();
		kdlbz=cf.fillNull(rs.getString("kdlbz")).trim();
		hth=cf.fillNull(rs.getString("hth")).trim();
		khbh=cf.fillNull(rs.getString("khbh")).trim();

		//验证密码是否正确
		
		if (getYhkl.equals(yhkl) && !kdlbz.equals("02") )
		{//密码正确

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'2',?,?,SYSDATE) ";//：用户名登陆；2：合同号登陆；3：口令不正确；4：身份证号不正确；5：用户登陆名不存在
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,yhdlm);
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			sql="update crm_khxx set yhkl='"+yhkl+"',yhdlm='"+yhdlm+"' where khbh='"+khbh+"'";
			ps1= conn.prepareStatement(sql);
			ps1.executeUpdate();
			ps1.close();


			session.setAttribute("yhdlm",yhdlm);
			session.setAttribute("hth",hth);
			session.setAttribute("khbh",khbh);
			session.setAttribute("yhmc",yhmc);
			session.setAttribute("zgsmc","松下亿达");//公司的显示名称
			response.sendRedirect("khhdpt.html");

			return;
		}
		else
		{

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'4',?,?,SYSDATE) ";//：用户名登陆；2：合同号登陆；3：口令不正确；4：身份证号不正确；5：用户登陆名不存在
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,yhdlm);
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			%>
			<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
			<TR><TD WIDTH="253"></TD><TD WIDTH="385">
			<table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
			  <TR>
				<TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[系统提示]</strong></font></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="51"><div align="center">用户或密码不正确!!</div></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
					<input type="button"  value="返回" onClick="window.history.back()">
				  </div></TD>
			  </TR>
			  </TABLE>
			  </TD><TD WIDTH="339"></TD>
			  <TR>
			</TABLE>
			<%

			return;
			
		}
	}
	else{

		sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'5',?,?,SYSDATE) ";//：用户名登陆；2：合同号登陆；3：口令不正确；4：身份证号不正确；5：用户登陆名不存在
		ps1= conn.prepareStatement(sql);
		ps1.setString(1,ip);
		ps1.setString(2,yhdlm);
		ps1.setString(3,yhkl);
		ps1.setString(4,khbh);
		ps1.setString(5,yhmc);
		ps1.executeUpdate();
		ps1.close();

		%>
		<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
		<TR><TD WIDTH="253"></TD><TD WIDTH="385">
		<table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
		  <TR>
			<TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[系统提示]</strong></font></TD>
		  </TR>
		  <TR>
			<TD width="100%" height="51"><div align="center">用户或密码不正确!!</div></TD>
		  </TR>
		  <TR>
			<TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
				<input type="button"  value="返回" onClick="window.history.back()">
			  </div></TD>
		  </TR>
		  </TABLE>
		  </TD><TD WIDTH="339"></TD>
		  <TR>
		</TABLE>
		<%
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>


