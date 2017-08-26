<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>

<%  
String sql = null;
Connection conn  = null;
Statement stmt = null;
ResultSet rs = null;

String bsczbm = null;
String ggbm = null;
String jb = null;
double zl = 0;
double rkdj = 0;
String bh = request.getParameter("bh");
String xh = request.getParameter("xh");
String sl = request.getParameter("sl");
if (sl!=null)
{	
	sl=sl.trim();
}
String bsjbbm = request.getParameter("bsjbbm");
String lrzl = request.getParameter("zl");
if ((lrzl!=null) && lrzl.equals(""))
{
	lrzl="-1";
}
//out.println(lrzl);
String plbm = request.getParameter("plbm");
String plmc = null;
String jldm = request.getParameter("jldm");
String bkbh = null;
String gcbh = request.getParameter("gcbh");
String gckh = request.getParameter("gckh");

String ylmc=null;
String sjczbm=null;
double jldj=0;
double cd=0;

double jgf=0.0;
double dkjgf=0.0;
double dksh=0.0;
double lsjxs=0;
double bqjxs=0;
String csmc=null;

String bsjb = request.getParameter("bsjb");
String[] bsbh = request.getParameterValues("bsbh");
String[] bszl = request.getParameterValues("bszl");
String[] bssl = request.getParameterValues("bssl");
String[] csxh = request.getParameterValues("csxh");
/*
for (int j=0;j<bsbh.length ;j++ )
{
	out.println("csxh="+csxh[j]);
}
*/
int count=0;

String jjfs=null;
double bsgmdj=0;
double bsbzdj=0;

try {
	conn=cf.getConnection();    //得到连接
	stmt = conn.createStatement();

	if (gckh!=null)
	{
		//检查：单件加工费、单克加工费、单克损耗、版库编号
		sql = "select bkbh from bk_khdzb ";
		sql+= "  where gckh='"+gckh+"' and dwbh='"+gcbh+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs.next())                            
		{
			bkbh = rs.getString("bkbh");//版库编号
		}
		else{
			bkbh = "B9999999999";//版库编号
		}
		//判断工厂款号对应多个版库编号
		if (rs.next())                            
		{
			bkbh = "";//版库编号
		}
		rs.close();
%>
		<SCRIPT language=javascript >
		<!--
			parent.main.insertform.bkbh.value="<%=bkbh%>";
		//-->
		</SCRIPT>
<%
	}
	else if (jldm!=null)
	{
		//检查分货单编号是否存在
		sql = "select ylmc,cpjldj,sjczbm,cd from yl_jldmb ";
		sql += " where yldm='"+jldm+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs.next())                            
		{
			ylmc=rs.getString("ylmc");
			jldj=rs.getDouble("cpjldj");
			sjczbm=rs.getString("sjczbm");
			cd=rs.getDouble("cd");
		}
		rs.close();
%>
		<SCRIPT language=javascript >
		<!--
			parent.main.insertform.jlmc.value="<%=ylmc%>";
			parent.main.insertform.bzdj.value="<%=jldj%>";
			parent.main.insertform.sjczbm.value="<%=sjczbm%>";
			parent.main.insertform.cd.value="<%=cd%>";
			parent.main.insertform.bzdj.select();
		//-->
		</SCRIPT>
<%
	}
	else if (bh!=null)
	{
		if (bh.startsWith("W") ||bh.startsWith("w"))
		{
			if (sl.equals("0"))//按个数计价
			{
				%>
				<SCRIPT language=javascript >
				<!--
					parent.main.insertform.bsczbm<%=xh%>.value="XD";
					parent.main.insertform.gg<%=xh%>.value="0014";
					parent.main.insertform.bsczbm<%=xh%>.select();
				//-->
				</SCRIPT>
				<%
			}
			else{
				sql = " select ggbm";
				sql += " from xt_zlggb ";
				sql += " where xt_zlggb.zl=round("+lrzl+"*100/"+sl+")";
	//			out.println(sql);
				rs = stmt.executeQuery(sql);
				if (rs.next())                            
				{
					ggbm=rs.getString(1);
					%>
					<SCRIPT language=javascript >
					<!--
						parent.main.insertform.bsczbm<%=xh%>.value="XD";
						parent.main.insertform.gg<%=xh%>.value="<%=ggbm%>";
						parent.main.insertform.bsczbm<%=xh%>.select();
					//-->
					</SCRIPT>
					<%
				}
			}
			return;
		}
		//取得宝石采购价格
		sql = " select yl_bsdmb.bsczbm,yl_bsdmb.ggbm,yl_bsrkd.rkdj,jjfs ";
		sql += " from yl_bsdmb,yl_bsrkd ";
		sql += " where yl_bsrkd.ylbh='"+bh+"' and yl_bsrkd.yldm=yl_bsdmb.yldm(+)";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs.next())                            
		{
			bsczbm=rs.getString(1);
			ggbm=rs.getString(2);
//			out.println("zl="+zl);
			rkdj=rs.getDouble(3);
			jjfs=rs.getString(4);

			if (jjfs.equals("s"))
			{
				bsgmdj=rkdj*Double.parseDouble(sl);
			}
			else{
				bsgmdj=rkdj*Double.parseDouble(lrzl);
			}
			rs.close();
			bsbzdj=bsgmdj;
			if (!sl.equals("0"))//按个数计价
			{
				//取得宝石标准价格
				sql = " select sc_bsjgb.jg ";
				sql += " from sc_bsjgb ";
				sql += " where sc_bsjgb.bsczbm='"+bsczbm+"' ";
				sql += " and sc_bsjgb.zl=ROUND(100*"+lrzl+"/"+sl+")/100";
				sql += " and  sc_bsjgb.bsjbbm='"+bsjbbm+"'";
//				out.println(sql);
		//		sql += " and yl_bsdmb.bsczbm in('XD','XB')";
				rs = stmt.executeQuery(sql);
				if (rs.next())                            
				{
					bsbzdj=rs.getDouble(1);
					bsbzdj=bsbzdj*Integer.parseInt(sl);
				}
				else{//无价格对照表
					if (bsczbm.equals("YD")||bsczbm.equals("MD")||bsczbm.equals("ND")||bsczbm.equals("SD")||bsczbm.equals("TD"))
					{
						bsbzdj=bsgmdj*1.1;
					}
				}
				rs.close();
			}
			%>
			<SCRIPT language=javascript >
			<!--
	//			alert(<%=lrzl%>);
				parent.main.insertform.bsczbm<%=xh%>.value="<%=bsczbm%>";
	//			parent.main.insertform.bsjbbm<%=xh%>.value="<%=jb%>";
				parent.main.insertform.gg<%=xh%>.value="<%=ggbm%>";
	//			parent.main.insertform.zl<%=xh%>.value="<%=lrzl%>";
				parent.main.insertform.jg<%=xh%>.value="<%=bsbzdj%>";
				parent.main.insertform.gmjg<%=xh%>.value="<%=bsgmdj%>";
				parent.main.jsjg(parent.main.insertform);
			//-->
			</SCRIPT>
			<%
		}
		else{
			%>
			<SCRIPT language=javascript >
			<!--
				parent.main.insertform.bsczbm<%=xh%>.value="";
	//			parent.main.insertform.bsjbbm<%=xh%>.value="";
				parent.main.insertform.gg<%=xh%>.value="";
	//			parent.main.insertform.zl<%=xh%>.value="";
				parent.main.insertform.jg<%=xh%>.value="";
				parent.main.insertform.gmjg<%=xh%>.value="";
				alert("原料包号不存在！");
			//-->
			</SCRIPT>
			<%
		}
	}
	else if (bsjb!=null)
	{
		for (int j=0;j<bsbh.length ;j++ )
		{
			bssl[j]=bssl[j].trim();
			if (!bssl[j].equals("0"))
			{
				//取得宝石标准价格
				sql = " select sc_bsjgb.jg ";
				sql += " from yl_bsdmb,yl_bsrkd,sc_bsjgb ";
				sql += " where yl_bsrkd.ylbh='"+bsbh[j]+"' and yl_bsrkd.yldm=yl_bsdmb.yldm";
				sql += " and yl_bsdmb.bsczbm=sc_bsjgb.bsczbm ";
				sql += " and sc_bsjgb.zl=ROUND(100*"+bszl[j]+"/"+bssl[j]+")/100";
				sql += " and  sc_bsjgb.bsjbbm='"+bsjb+"'";
//				out.println(sql);
				rs = stmt.executeQuery(sql);
				if (rs.next())                            
				{
					bsbzdj=rs.getDouble(1);
					bsbzdj=bsbzdj*Integer.parseInt(bssl[j]);
		%>
					<SCRIPT language=javascript >
					<!--
						parent.main.insertform.jg<%=csxh[j]%>.value="<%=bsbzdj%>";
						parent.main.jsjg(parent.main.insertform);
					//-->
					</SCRIPT>
		<%
				}
				rs.close();
			}
		}
	}
	else if (plbm!=null)
	{
		//检查：单件加工费、单克加工费、单克损耗、版库编号
		sql = "select plmc from xt_plbm ";
		sql+= "  where plbm='"+plbm+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs.next())                            
		{
			plmc = rs.getString("plmc");//版库编号
%>
			<SCRIPT language=javascript >
			<!--
				parent.main.insertform.plmc.value="<%=plmc%>";
			//-->
			</SCRIPT>
<%
		}
		else{
%>
			<SCRIPT language=javascript >
			<!--
				alert("品名不存在！");
				parent.main.insertform.plbm.select();
				parent.main.insertform.plmc.value="";
			//-->
			</SCRIPT>
<%
		}
		rs.close();
	}
}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
	out.print("SQL=" + sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>


