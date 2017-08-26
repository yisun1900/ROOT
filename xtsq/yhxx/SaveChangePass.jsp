<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010204")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%

String yhdlm=request.getParameter("yhdlm");
String oldpass=request.getParameter("oldpass");
String newyhdlm=request.getParameter("newyhdlm");
String newpass=request.getParameter("newpass");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yhkl="";
int mark=0;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*) from sq_bkymm where yhkl='"+newpass+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("存盘失败！您用的密码【"+newpass+"】可能太简单，系统不许使用！");
		return;
	}

	if (!newyhdlm.equals(yhdlm))
	{
		ls_sql="select count(*) from sq_yhxx where yhdlm='"+newyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("存盘失败！新用户登陆名【"+newyhdlm+"】已被使用！");
			return;
		}


		ls_sql="select count(*) from jxc_ppgysdzb where yhdlm='"+newyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("存盘失败！新用户登陆名【"+newyhdlm+"】已被使用！");
			return;
		}
	}

	//检查密码复杂程度
	int dxzmMark=0;
	int xxzmMark=0;
	int szMark=0;
	byte[] strInt=newpass.getBytes();
	for (int i=0;i<strInt.length ;i++ )
	{
		int asci=strInt[i];
		if (asci>=65 && asci<=90)
		{
			dxzmMark=1;//大写字母
		}
		if (asci>=97 && asci<=122)
		{
			xxzmMark=1;//小写字母
		}
		if (asci>=48 && asci<=57)
		{
			szMark=1;//数字
		}
	}

	if ((dxzmMark+xxzmMark+szMark)<2)
	{
		out.println("存盘失败！『密码』必须是『数字』和『字母』混合使用！");
		return;
	}

	mark=0;
	ls_sql="select yhkl from sq_yhxx where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yhkl=rs.getString("yhkl");
		mark=1;
	}
	rs.close();
	ps.close();

	if (mark==0)
	{
		ls_sql="select yhkl from jxc_ppgysdzb where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			yhkl=rs.getString("yhkl");
			mark=2;
		}
		rs.close();
		ps.close();
	}

	if (mark==0)
	{
		out.println("存盘失败！不存在的用户登陆名！");
		return;
	}

	if (yhkl.equals("111111"))
	{
	}
	else{
		oldpass=cf.makejm(oldpass);
	}

	if (!yhkl.equals(oldpass))
	{
		out.println("存盘失败！旧口令输入不正确！");
		return;
	}

	newpass=cf.makejm(newpass);

	conn.setAutoCommit(false);

	if (mark==1)
	{
		ls_sql="update sq_yhxx set yhdlm='"+newyhdlm+"',yhkl='"+newpass+"',mmxgsj=SYSDATE where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_ppgysdzb set yhdlm='"+newyhdlm+"',yhkl='"+newpass+"',mmxgsj=SYSDATE where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update sq_yhssz set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_yhewqx set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update xz_ggdx set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update xz_ggckjl set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_lzyhssz set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_lzyhewqx set yhdlm='"+newyhdlm+"' where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	session.setAttribute("yhdlm",null);

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改口令成功！请重新登陆系统");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>