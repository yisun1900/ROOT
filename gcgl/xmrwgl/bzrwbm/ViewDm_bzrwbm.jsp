<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String xgytg=null;
String gytgts=null;
String sjcpxx=null;
String sjcpfl=null;
String bjlb=null;
String bjjbbm=null;
String sqtxnr=null;
String sqtxts=null;
String shtxnr=null;
String shtxts=null;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String sfwlcb=null;
String zyrwbm=null;
String rwxh=null;
String jishu=null;
String changdu=null;
String jgchangdu=null;
String jishucd=null;
String gznr=null;
String bz=null;
String ysxm=null;
String whererwbm=null;
whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select rwbm,rwmc,rwflmc,DECODE(zdjkrw,'1','重点监控','2','非重点') zdjkrw,DECODE(xgytg,'Y','是','N','否') xgytg,gytgts,DECODE(sjcpxx,'Y','是','N','否') sjcpxx,sjcpfl,DECODE(bjlb,'1','事前报警','2','事后提醒','3','事前事后都提醒','9','一般记录') bjlb,bjjbmc,sqtxnr,sqtxts,shtxnr,shtxts,DECODE(sfyxhxgq,'Y','影响','N','否') sfyxhxgq,DECODE(sfyxfc,'Y','影响','N','否') sfyxfc,DECODE(sfxys,'Y','验收','N','否') sfxys,DECODE(sfwlcb,'Y','里程碑','N','否') sfwlcb,zyrwmc,rwxh,jishu,changdu,jgchangdu,jishucd,gznr,bz,ysxm ";
	ls_sql+=" from  dm_bzrwbm,dm_rwflbm,dm_zyrwbm,dm_bjjbbm";
	ls_sql+=" where dm_bzrwbm.rwflbm=dm_rwflbm.rwflbm(+) and dm_bzrwbm.zyrwbm=dm_zyrwbm.zyrwbm(+) and dm_bzrwbm.bjjbbm=dm_bjjbbm.bjjbbm(+) and rwbm='"+whererwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflmc"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		xgytg=cf.fillNull(rs.getString("xgytg"));
		gytgts=cf.fillNull(rs.getString("gytgts"));
		sjcpxx=cf.fillNull(rs.getString("sjcpxx"));
		sjcpfl=cf.fillNull(rs.getString("sjcpfl"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		bjjbbm=cf.fillNull(rs.getString("bjjbmc"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwmc"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		jishu=cf.fillNull(rs.getString("jishu"));
		changdu=cf.fillNull(rs.getString("changdu"));
		jgchangdu=cf.fillNull(rs.getString("jgchangdu"));
		jishucd=cf.fillNull(rs.getString("jishucd"));
		gznr=cf.fillNull(rs.getString("gznr"));
		bz=cf.fillNull(rs.getString("bz"));
		ysxm=cf.fillNull(rs.getString("ysxm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
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

<html>
<head>
<title>标准任务</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
.STYLE4 {
	color: #0000FF;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">标准任务（任务编码：<%=rwbm%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE3">任务序号    </span></td>
  <td width="32%" bgcolor="#FFFFFF"><span class="STYLE3"><%=rwxh%> </span></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE3">摘要任务</span></td>
  <td width="32%" bgcolor="#FFFFFF"><span class="STYLE3"><%=zyrwbm%></span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">任务名称</span></td>
  <td colspan="3" bgcolor="#FFFFFF"><span class="STYLE3"><%=rwmc%></span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    任务分类  </td>
  <td width="32%"> 
    <%=rwflbm%>  </td>
  <td align="right" width="18%"> 
    重点监控任务  </td>
  <td width="32%"> 
    <%=zdjkrw%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    需工艺停工  </td>
  <td width="32%"> 
<%=xgytg%>  </td>
  <td align="right" width="18%"> 
    工艺停工天数  </td>
  <td width="32%"> 
    <%=gytgts%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    是否涉及产品信息  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
<%=sjcpxx%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    涉及产品分类  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=sjcpfl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    报警类别  </td>
  <td width="32%"> 
<%=bjlb%>  </td>
  <td align="right" width="18%"> 
    报警级别  </td>
  <td width="32%"> 
<%=bjjbbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">事前提醒天数</td>
  <td width="32%"><%=sqtxts%></td>
  <td align="right" width="18%">事后提醒天数</td>
  <td width="32%"><%=shtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事前提醒内容</td>
  <td colspan="3"><%=sqtxnr%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    事后提醒内容  </td>
  <td colspan="3"> 
    <%=shtxnr%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    是否影响后续工期  </td>
  <td width="32%"> 
    <%=sfyxhxgq%>  </td>
  <td align="right" width="18%"> 
    是否影响复尺  </td>
  <td width="32%"> 
    <%=sfyxfc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    是否需验收  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=sfxys%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    是否为里程碑  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=sfwlcb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">验收项目</td>
  <td colspan="3" bgcolor="#FFFFCC"><%=ysxm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    级数  </td>
  <td width="32%"> 
    <%=jishu%>  </td>
  <td align="right" width="18%"> 
    长度  </td>
  <td width="32%"> 
    <%=changdu%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    间隔长度  </td>
  <td width="32%"> 
    <%=jgchangdu%>  </td>
  <td align="right" width="18%"> 
    级数长度  </td>
  <td width="32%"> 
    <%=jishucd%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">关注内容 </span></td>
  <td colspan="3"><%=gznr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注 </td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>
</body>
</html>
