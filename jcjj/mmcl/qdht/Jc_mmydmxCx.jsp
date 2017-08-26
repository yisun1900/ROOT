<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%  
String dqbm = request.getParameter("dqbm");
String mmdglxbm = request.getParameter("mmdglxbm");//木门订购类型编码
String mlx = request.getParameter("mlx");//1：普通门；2：子母门；3：对开门；4：推拉门 
String mmxh = request.getParameter("mmxh");//木门型号
String ysbm = request.getParameter("ysbm");//油色编码
String mdk = request.getParameter("mdk");//门洞宽
String mdg = request.getParameter("mdg");//门洞高
String qh = request.getParameter("qh");//墙厚
String dbh = request.getParameter("dbh");//地板厚
String tjx = request.getParameter("tjx");//踢脚线/平台上口
String ctbs = request.getParameter("ctbs");//门套/窗套边数
String sfsmjcc = request.getParameter("sfsmjcc");//哑口松木集成材
String mtxbm = request.getParameter("mtxbm");//门套线编码
String mxxbm = request.getParameter("mxxbm");//门芯线编码
String getlx = request.getParameter("getlx");

//out.println(mmdglxbm);

if (sfsmjcc==null)
{
	sfsmjcc="";
}

double dj=0;

if (mmdglxbm==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String c1=null;
String c2=null;

try {

	conn=cf.getConnection();

	if (getlx.equals("1"))//订购类型
	{
		String jjfs="";
		ls_sql="select jjfs";
		ls_sql+=" from jc_mmdglx";
		ls_sql+=" where mmdglxbm='"+mmdglxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjfs=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();
		%>
			parent.main.insertform.jjfs.value="<%=jjfs%>";
		<%

		if (jjfs.equals("11"))//11：木门
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%
		}
		//12：双口哑口；13：双口窗套；14：单口哑口；15：单口窗套
		else if (jjfs.equals("12") || jjfs.equals("13") || jjfs.equals("14") || jjfs.equals("15"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_mtbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_mtbjb,jdm_mmczbm";
			ls_sql+=" where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//21：门连窗;22：门顶窗
		else if (jjfs.equals("21") || jjfs.equals("22"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_mlcbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_mlcbjb,jdm_mmczbm";
			ls_sql+=" where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//31：外飘窗立口
		else if (jjfs.equals("31"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_mtbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_mtbjb,jdm_mmczbm";
			ls_sql+=" where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//32：外飘窗平台上口
		else if (jjfs.equals("32"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_tjxbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_tjxbjb,jdm_mmczbm";
			ls_sql+=" where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//41：平方米计价;42：延米计价
		else if (jjfs.equals("41") || jjfs.equals("42"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_tjxbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_tjxbjb,jdm_mmczbm";
			ls_sql+=" where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//43：分段平方米计价；44：分段延米计价；45：分段按长度计价
		else if (jjfs.equals("43") || jjfs.equals("44") || jjfs.equals("45"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_hjbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_hjbjb,jdm_mmczbm";
			ls_sql+=" where jc_hjbjb.dqbm='"+dqbm+"' and jc_hjbjb.mmdglxbm='"+mmdglxbm+"' and jc_hjbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
	}
	else if (getlx.equals("2"))//木门型号
	{
		%>
			parent.main.insertform.dj.value="";
			parent.main.insertform.ysbm.length=0;
			parent.main.addItem(parent.main.insertform.ysbm,"","");
		<%

		ls_sql="select distinct jc_mmbjb.ysbm,mmczmc";
		ls_sql+=" from  jc_mmbjb,jdm_mmczbm";
		ls_sql+=" where jc_mmbjb.dqbm='"+dqbm+"' and jc_mmbjb.mmxh='"+mmxh+"' and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm ";
		ls_sql+=" order by mmczmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			c1=cf.fillNull(rs.getString(1));
			c2=cf.fillNull(rs.getString(2));

			%>
				parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
			<%
		}
		rs.close();
		ps.close();
	}
	else if (getlx.equals("3"))//标准单价
	{
		dj=jcjj.yzMmbj(dqbm,mmdglxbm,mlx,mmxh,ysbm,mdk,mdg,qh,dbh,tjx,ctbs,sfsmjcc,mtxbm,mxxbm);

		if (dj!=0)//单价不为0
		{
			%>
			parent.main.insertform.dj.value="<%=cf.doubleTrimStr(dj,2)%>";
			//使『存盘』按钮可使用
			parent.main.insertform.bc.disabled=false;
			<%
		}
		else{
			%>
			parent.main.insertform.dj.value="";
			//使『存盘』按钮可使用
			parent.main.insertform.bc.disabled=false;
	//		alert("错误！价格信息不完整，未查到价格信息");
			<%
		}
	}
}
catch(Exception e){
	out.print("发生意外: " + e);
	%>
		parent.main.insertform.dj.value="";
		alert("错误！<%=e%>");
	<%
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

//-->
</SCRIPT>


