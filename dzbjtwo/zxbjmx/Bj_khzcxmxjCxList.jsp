<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String khbh=request.getParameter("khbh");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int xmpx=0;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="110%" height="200" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td width="11%">结构位置</td>
	  <td width="18%">主材升级</td>
	  <td width="7%">主材级别</td>
	  <td width="12%">产品类别</td>
	  <td width="6%">必选项</td>
	  <td width="6%">选择产品</td>
	  <td width="9%">实际数量</td>
	  <td width="7%">限制数量</td>
	  <td width="8%">标准数量</td>
	  <td width="9%">超出部分加价</td>
	  <td width="7%">升级收费</td>
	</tr>
<%
	String jgwzbm=null;
	String tccplbbm=null;
	String tccplbmc=null;
	double sjsl=0;
	double bzsl=0;
	String sfxzsl=null;
	double ccbfjj=0;
	String sfbxx=null;
	String sfyxsj=null;
	String sfyxsjMc=null;
	String bjjbmc=null;
	String khbjjbbm=null;
	String zcbjjbbm=null;
	String tcsjflbm=null;
	String tcsjflmc=null;

	ls_sql="SELECT distinct jgwzbm";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"'";
    ls_sql+=" order by bj_khzcxmxj.jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int row=0;//同房间内行号

		ls_sql="SELECT distinct bj_khzcxmxj.tcsjflbm,tcsjflmc";
		ls_sql+=" FROM bj_khzcxmxj,bj_tcsjflbm ";
		ls_sql+=" where bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
		ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by bj_khzcxmxj.tcsjflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			tcsjflbm=rs2.getString("tcsjflbm");
			tcsjflmc=cf.fillNull(rs2.getString("tcsjflmc"));


			int count1=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_khzcxmxj";
			ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm='"+tcsjflbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count1=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int row1=0;
			
			ls_sql="SELECT bj_khzcxmxj.khbjjbbm,bj_khzcxmxj.bjjbbm,bj_khzcxmxj.tccplbbm,clxlmc,sjsl,bzsl,DECODE(bj_khzcxmxj.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,bj_khzcxmxj.ccbfjj,DECODE(sfbxx,'Y','必选','N','') sfbxx,sfyxsj,DECODE(sfyxsj,'Y','收费','N','否') sfyxsjMc,bjjbmc";
			ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm,bdm_bjjbbm ";
			ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
			ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm='"+tcsjflbm+"'";
			ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khzcxmxj.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				tccplbbm=rs.getString("tccplbbm");
				tccplbmc=rs.getString("clxlmc");
				sjsl=rs.getDouble("sjsl");
				bzsl=rs.getDouble("bzsl");
				sfxzsl=rs.getString("sfxzsl");
				ccbfjj=rs.getDouble("ccbfjj");
				sfbxx=cf.fillNull(rs.getString("sfbxx"));
				sfyxsj=rs.getString("sfyxsj");
				sfyxsjMc=rs.getString("sfyxsjMc");
				bjjbmc=rs.getString("bjjbmc");
				khbjjbbm=rs.getString("khbjjbbm");
				zcbjjbbm=rs.getString("bjjbbm");

				row++;
				row1++;

				if (row%2==0)
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}

				if (!khbjjbbm.equals(zcbjjbbm))
				{
					bjjbmc="<font color=\"#FF0000\"><B>"+bjjbmc+"</B></font>";
				}

				if (row==1)//第一行
				{
					//输出每行数据
					%>
					<tr bgcolor="<%=bgcolor%>" align="center">
					  <td rowspan="<%=count%>"><%=jgwzbm%></td>
					  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>：
						<%
						if (!tcsjflmc.equals(""))
						{
							%>
							  <a href="zcsj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">升级</a>
							  <a href="zcjj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">降级</a>
							  <a href="SaveHyjb.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">还原</a>
							<%
						}	
						%>
					  </td>
					
					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=ccbfjj%></td>
					  <td><%=sfyxsjMc%></td>
					</tr>
					<%
				}
				else{
					if (row1==1)
					{
						//输出每行数据
						%>
						<tr bgcolor="<%=bgcolor%>" align="center">
						  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>：
							<%
							if (!tcsjflmc.equals(""))
							{
								%>
								  <a href="zcsj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">升级</a>
								  <a href="zcjj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">降级</a>
								  <a href="SaveHyjb.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">还原</a>
								<%
							}	
							%>
						  </td>
						
						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=ccbfjj%></td>
						  <td><%=sfyxsjMc%></td>
						</tr>
						<%
					}
					else{
						//输出每行数据
						%>
						<tr bgcolor="<%=bgcolor%>" align="center">
						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=ccbfjj%></td>
						  <td><%=sfyxsjMc%></td>
						</tr>
						<%
					}
				}

			}
			rs.close();
			ps.close();
		}
		rs2.close();
		ps2.close();

		//处理【套餐升级分类编码】为空
		int count1=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm is null";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int row1=0;

		ls_sql="SELECT bj_khzcxmxj.khbjjbbm,bj_khzcxmxj.bjjbbm,bj_khzcxmxj.tccplbbm,clxlmc,sjsl,bzsl,DECODE(bj_khzcxmxj.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,bj_khzcxmxj.ccbfjj,DECODE(sfbxx,'Y','必选','N','') sfbxx,sfyxsj,DECODE(sfyxsj,'Y','收费','N','否') sfyxsjMc,bjjbmc";
		ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm,bdm_bjjbbm ";
		ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
		ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm is null";
		ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khzcxmxj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccplbmc=rs.getString("clxlmc");
			sjsl=rs.getDouble("sjsl");
			bzsl=rs.getDouble("bzsl");
			sfxzsl=rs.getString("sfxzsl");
			ccbfjj=rs.getDouble("ccbfjj");
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfyxsj=rs.getString("sfyxsj");
			sfyxsjMc=rs.getString("sfyxsjMc");
			bjjbmc=rs.getString("bjjbmc");
			khbjjbbm=rs.getString("khbjjbbm");
			zcbjjbbm=rs.getString("bjjbbm");

			row++;
			row1++;

			if (row%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			if (!khbjjbbm.equals(zcbjjbbm))
			{
				bjjbmc="<font color=\"#FF0000\"><B>"+bjjbmc+"</B></font>";
			}

			if (row==1)//第一行
			{
				//输出每行数据
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <td rowspan="<%=count%>"><%=jgwzbm%></td>
				  <td rowspan="<%=count1%>">&nbsp;</td>
				
				  <td><%=bjjbmc%></td>
				  <td><%=tccplbmc%></td>
				  <td><%=sfbxx%></td>
				  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
				  <td><%=sjsl%></td>
				  <td><%=sfxzsl%></td>
				  <td><%=bzsl%></td>
				  <td><%=ccbfjj%></td>
				  <td><%=sfyxsjMc%></td>
				</tr>
				<%
			}
			else{
				if (row1==1)
				{
					//输出每行数据
					%>
					<tr bgcolor="<%=bgcolor%>" align="center">
					  <td rowspan="<%=count1%>">&nbsp;</td>
					
					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=ccbfjj%></td>
					  <td><%=sfyxsjMc%></td>
					</tr>
					<%
				}
				else{
					//输出每行数据
					%>
					<tr bgcolor="<%=bgcolor%>" align="center">
					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=ccbfjj%></td>
					  <td><%=sfyxsjMc%></td>
					</tr>
					<%
				}
			}

		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
      </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

