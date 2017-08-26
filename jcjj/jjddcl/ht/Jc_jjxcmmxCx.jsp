<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<%  
String lx = cf.unescape(request.getParameter("lx"));
String xcmlxbm = cf.unescape(request.getParameter("xcmlxbm"));//型材门类型编码
String bklxxh = cf.unescape(request.getParameter("bklxxh"));//边框型号/刀型/门型
String mbcl1 = cf.unescape(request.getParameter("mbcl1"));//材料/花色
String mbcl2 = cf.unescape(request.getParameter("mbcl2"));//材料/花色
String xbpz1 = cf.unescape(request.getParameter("xbpz1"));//芯板配置
String xbpz2 = cf.unescape(request.getParameter("xbpz2"));//芯板配置
if (lx.equals(""))
{
	return;
}

double dj1=0;
double dj2=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //得到连接


	if (lx.equals("1"))
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		<%

		String getBklxxh=null;
		ls_sql="select distinct bklxxh";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"'";
		ls_sql+=" order by bklxxh";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		while (rs.next())
		{  
			getBklxxh=rs.getString("bklxxh");

			%>
			parent.main.addItem(parent.main.insertform.bklxxh,"<%=getBklxxh%>","<%=getBklxxh%>");
			<%
		}
		rs.close();
		ps.close();

		%>
		//-->
		</SCRIPT>
		<%

	}
	else if (lx.equals("2"))
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		<%

		String getMbcl=null;
		String getZsxt=null;
		String getBz=null;
		ls_sql="select distinct mbcl,zsxt,bz";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"'";
		ls_sql+=" order by mbcl";
//		out.println(ls_sql);
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		while (rs.next())
		{  
			getMbcl=rs.getString("mbcl");
			getZsxt=cf.fillNull(rs.getString("zsxt"));
			getBz=cf.fillNull(rs.getString("bz"));

			%>
			parent.main.addItem(parent.main.insertform.mbcl1,"<%=getMbcl%>","<%=getMbcl%>");
			parent.main.addItem(parent.main.insertform.mbcl2,"<%=getMbcl%>","<%=getMbcl%>");
			parent.main.insertform.zsxt.value="<%=getZsxt%>";
			parent.main.insertform.bjbz.value="<%=getBz%>";
			<%
		}
		rs.close();
		ps.close();

		%>
		//-->
		</SCRIPT>
		<%
	}
	else if (lx.equals("3"))
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		<%

		int count=0;
		int count1=0;
		ls_sql="select count(*),count(distinct xbpz)";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"' and xbpz is not null";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			count=rs.getInt(1);
			count1=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (count!=count1)
		{
			%>
			alert("型材门报价错误！可能报价重复，count=<%=count%>;count1=<%=count1%>");
			//-->
			</SCRIPT>
			<%
			return;
		}

		ls_sql="select count(*)";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"' and xbpz is null";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			%>
			alert("型材门报价错误！可能报价重复，count=<%=count%>");
			//-->
			</SCRIPT>
			<%
			return;
		}

		ls_sql="select count(distinct xbpz)";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			count1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count1>0)
		{
			String getXbpz=null;
			ls_sql="select distinct xbpz";
			ls_sql+=" from jc_bgmbj";
			ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"' and xbpz is not null";
			ls_sql+=" order by xbpz";
			ps=conn.prepareStatement(ls_sql);  
			rs=ps.executeQuery();  
			while (rs.next())
			{  
				getXbpz=rs.getString("xbpz");

				%>
				parent.main.addItem(parent.main.insertform.xbpz1,"<%=getXbpz%>","<%=getXbpz%>");
				<%
			}
			rs.close();
			ps.close();
		}
		else{
			double pmdj=0;
			double ymdj=0;
			String jjfs=null;
			String xcmbm=null;
			ls_sql="select pmdj,ymdj,jjfs,xcmbm";
			ls_sql+=" from jc_bgmbj";
			ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"'";
			ps=conn.prepareStatement(ls_sql);  
			rs=ps.executeQuery();  
			if (rs.next())
			{  
				pmdj=rs.getDouble("pmdj");
				ymdj=rs.getDouble("ymdj");
				jjfs=rs.getString("jjfs");
				xcmbm=rs.getString("xcmbm");

				%>
				parent.main.insertform.jjfs1.value="<%=jjfs%>";
				parent.main.insertform.xcmbm1.value="<%=xcmbm%>";

				parent.main.insertform.pmdj1.value="<%=cf.doubleTrimStr(pmdj,2)%>";
				parent.main.insertform.ymdj1.value="<%=cf.doubleTrimStr(ymdj,2)%>";
				parent.main.f_wdzje(parent.main.insertform);
				<%
			}
			rs.close();
			ps.close();
		}
		
		%>
		//-->
		</SCRIPT>
		<%
	}
	else if (lx.equals("4"))
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		<%

		int count=0;
		int count1=0;
		ls_sql="select count(*),count(distinct xbpz)";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"' and xbpz is not null";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			count=rs.getInt(1);
			count1=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (count!=count1)
		{
			%>
			alert("型材门报价错误！可能报价重复，count=<%=count%>;count1=<%=count1%>");
			//-->
			</SCRIPT>
			<%
			return;
		}

		ls_sql="select count(*)";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"' and xbpz is null";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			%>
			alert("型材门报价错误！可能报价重复，count=<%=count%>");
			//-->
			</SCRIPT>
			<%
			return;
		}

		ls_sql="select count(distinct xbpz)";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			count1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count1>0)
		{
			String getXbpz=null;
			ls_sql="select distinct xbpz";
			ls_sql+=" from jc_bgmbj";
			ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"' and xbpz is not null";
			ls_sql+=" order by xbpz";
			ps=conn.prepareStatement(ls_sql);  
			rs=ps.executeQuery();  
			while (rs.next())
			{  
				getXbpz=rs.getString("xbpz");

				%>
				parent.main.addItem(parent.main.insertform.xbpz2,"<%=getXbpz%>","<%=getXbpz%>");
				<%
			}
			rs.close();
			ps.close();
		}
		else{
			double pmdj=0;
			double ymdj=0;
			String jjfs=null;
			String xcmbm=null;
			ls_sql="select pmdj,ymdj,jjfs,xcmbm";
			ls_sql+=" from jc_bgmbj";
			ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"'";
			ps=conn.prepareStatement(ls_sql);  
			rs=ps.executeQuery();  
			if (rs.next())
			{  
				pmdj=rs.getDouble("pmdj");
				ymdj=rs.getDouble("ymdj");
				jjfs=rs.getString("jjfs");
				xcmbm=rs.getString("xcmbm");

				%>
				parent.main.insertform.xcmbm2.value="<%=xcmbm%>";
				parent.main.insertform.jjfs2.value="<%=jjfs%>";

				parent.main.insertform.pmdj2.value="<%=cf.doubleTrimStr(pmdj,2)%>";
				parent.main.insertform.ymdj2.value="<%=cf.doubleTrimStr(ymdj,2)%>";
				parent.main.f_wdzje(parent.main.insertform);
				<%
			}
			rs.close();
			ps.close();
		}
		
		%>
		//-->
		</SCRIPT>
		<%
	}
	else if (lx.equals("5"))
	{
		double pmdj=0;
		double ymdj=0;
		String jjfs=null;
		String xcmbm=null;
		ls_sql="select pmdj,ymdj,jjfs,xcmbm";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"' and xbpz='"+xbpz1+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			pmdj=rs.getDouble("pmdj");
			ymdj=rs.getDouble("ymdj");
			jjfs=rs.getString("jjfs");
			xcmbm=rs.getString("xcmbm");
		}
		rs.close();
		ps.close();


		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.xcmbm1.value="<%=xcmbm%>";
		parent.main.insertform.jjfs1.value="<%=jjfs%>";

		parent.main.insertform.pmdj1.value="<%=cf.doubleTrimStr(pmdj,2)%>";
		parent.main.insertform.ymdj1.value="<%=cf.doubleTrimStr(ymdj,2)%>";
		parent.main.f_wdzje(parent.main.insertform);
		//-->
		</SCRIPT>
		<%
	}
	else if (lx.equals("6"))
	{
		double pmdj=0;
		double ymdj=0;
		String jjfs=null;
		String xcmbm=null;
		ls_sql="select pmdj,ymdj,jjfs,xcmbm";
		ls_sql+=" from jc_bgmbj";
		ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"' and xbpz='"+xbpz2+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			pmdj=rs.getDouble("pmdj");
			ymdj=rs.getDouble("ymdj");
			jjfs=rs.getString("jjfs");
			xcmbm=rs.getString("xcmbm");
		}
		rs.close();
		ps.close();


		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.xcmbm2.value="<%=xcmbm%>";
		parent.main.insertform.jjfs2.value="<%=jjfs%>";

		parent.main.insertform.pmdj2.value="<%=cf.doubleTrimStr(pmdj,2)%>";
		parent.main.insertform.ymdj2.value="<%=cf.doubleTrimStr(ymdj,2)%>";
		parent.main.f_wdzje(parent.main.insertform);
		//-->
		</SCRIPT>
		<%
	}


}
catch(Exception e){
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" +ls_sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

