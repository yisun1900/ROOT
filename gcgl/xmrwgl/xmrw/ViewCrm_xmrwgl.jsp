<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=null;
String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String bjlb=null;
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
String jddf=null;
String jhkssj=null;
String jhjssj=null;
String jhgzr=null;
String jdsyts=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;
String sfyq=null;
String yqts=null;
String sfybgd=null;
String sffszg=null;
String sfyfbd=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;

String sjcpxx=null;
String sjcpfl=null;
String ysxm=null;
String bjjbmc=null;
String xgytg=null;
String gytgts=null;
String csjhkssj=null;
String csjhjssj=null;
String csjhgzr=null;
String gznr=null;
String sfxrw=null;
String sfzdyrw=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,sfwlcb,zyrwbm,rwxh,jddf,jhkssj,jhjssj,jhgzr,jdsyts,sjkssj,sjjssj,sjgzr,sfyq,yqts,sfybgd,sffszg,sfyfbd,lrr,lrsj,lrbm,bz ";
	ls_sql+=" ,sjcpxx,sjcpfl,ysxm,bjjbmc,xgytg,gytgts,csjhkssj,csjhjssj,csjhgzr,gznr,sfxrw,sfzdyrw";
	ls_sql+=" from  crm_xmrwgl,dm_bjjbbm";
	ls_sql+=" where crm_xmrwgl.bjjbbm=dm_bjjbbm.bjjbbm(+) and  (khbh='"+wherekhbh+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjcpxx=cf.fillNull(rs.getString("sjcpxx"));
		sjcpfl=cf.fillNull(rs.getString("sjcpfl"));
		ysxm=cf.fillNull(rs.getString("ysxm"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		xgytg=cf.fillNull(rs.getString("xgytg"));
		gytgts=cf.fillNull(rs.getString("gytgts"));
		csjhkssj=cf.fillNull(rs.getDate("csjhkssj"));
		csjhjssj=cf.fillNull(rs.getDate("csjhjssj"));
		csjhgzr=cf.fillNull(rs.getString("csjhgzr"));
		gznr=cf.fillNull(rs.getString("gznr"));
		sfxrw=cf.fillNull(rs.getString("sfxrw"));
		sfzdyrw=cf.fillNull(rs.getString("sfzdyrw"));

		khbh=cf.fillNull(rs.getString("khbh"));
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		jddf=cf.fillNull(rs.getString("jddf"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhgzr=cf.fillNull(rs.getString("jhgzr"));
		jdsyts=cf.fillNull(rs.getString("jdsyts"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=cf.fillNull(rs.getString("sjgzr"));
		sfyq=cf.fillNull(rs.getString("sfyq"));
		yqts=cf.fillNull(rs.getString("yqts"));
		sfybgd=cf.fillNull(rs.getString("sfybgd"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		sfyfbd=cf.fillNull(rs.getString("sfyfbd"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>任务实际情况</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">任务实际情况</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"><%=khbh%></td>
  <td align="right" width="18%">任务编码</td> 
  <td width="32%"><%=rwbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">摘要任务</td>
  <td><%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm",zyrwbm,true);
%>  </td>
  <td align="right">任务序号</td>
  <td><%=rwxh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务名称</td> 
  <td width="32%"><%=rwmc%></td>
  <td align="right" width="18%">任务分类</td> 
  <td width="32%"> 
<%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm",rwflbm,true);
%>  </td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="16%" align="right"><strong>原计划开始时间</strong></td>
  <td width="17%"><strong><%=csjhkssj%></strong></td>
  <td width="17%" align="right"><span class="STYLE1">计划开始时间</span></td>
  <td width="17%"><span class="STYLE1"><%=jhkssj%></span></td>
  <td width="16%" align="right"><span class="STYLE2">实际开始时间</span></td>
  <td width="17%"><%=sjkssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>原计划结束时间</strong></td>
  <td><strong><%=csjhjssj%></strong></td>
  <td align="right"><span class="STYLE1">计划结束时间</span></td>
  <td><span class="STYLE1"><%=jhjssj%></span></td>
  <td align="right"><span class="STYLE2">实际结束时间</span></td>
  <td><%=sjjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>原计划工作日</strong></td>
  <td><strong><%=csjhgzr%></strong></td>
  <td align="right"><span class="STYLE1">计划工作日</span></td>
  <td><span class="STYLE1"><%=jhgzr%></span></td>
  <td align="right"><span class="STYLE2">实际工作日</span></td>
  <td><%=sjgzr%></td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">重点监控任务</td> 
  <td width="32%"> 
<%
	cf.radioToken(out,"1+重点监控&2+非重点监控",zdjkrw,true);
%>  </td>
  <td align="right" width="18%">是否为里程碑</td> 
  <td width="32%"><%
	cf.radioToken(out,"Y+是&N+否",sfwlcb,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">需工艺停工</td>
  <td><%
	cf.radioToken(out,"Y+是&N+否",xgytg,true);
%></td>
  <td align="right">工艺停工天数</td>
  <td><%=gytgts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">报警类别</span></td>
  <td><%
	cf.radioToken(out,"1+事前报警&2+事后提醒&3+事前事后都提醒&9+一般记录",bjlb,true);
%></td>
  <td align="right"><span class="STYLE1">报警级别</span></td>
  <td><%=bjjbmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">事前提醒内容</td> 
  <td width="32%"><%=sqtxnr%></td>
  <td align="right" width="18%">事前提醒天数</td> 
  <td width="32%"><%=sqtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">事后提醒内容</td> 
  <td width="32%"><%=shtxnr%></td>
  <td align="right" width="18%">事后提醒天数</td> 
  <td width="32%"><%=shtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否影响后续工期</td> 
  <td width="32%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfyxhxgq,true);
%>  </td>
  <td align="right" width="18%">是否影响复尺</td> 
  <td width="32%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfyxfc,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">是否涉及产品</span></td>
  <td><%
	cf.radioToken(out,"Y+是&N+否",sjcpxx,true);
%></td>
  <td align="right"><span class="STYLE1">涉及产品</span></td>
  <td><%=sjcpfl%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">是否需验收</span></td> 
  <td width="32%"> 
<%
	cf.radioToken(out,"Y+是&N+否",sfxys,true);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">验收项目</span></td> 
  <td width="32%"><%=ysxm%></td>
</tr>



<tr bgcolor="#FFFFFF">
  <td align="right">关注内容</td>
  <td colspan="3"><%=gznr%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否开工后新增任务</td>
  <td><%
	cf.radioToken(out,"Y+是&N+否",sfxrw,true);
%></td>
  <td align="right">是否自定义任务</td>
  <td><%
	cf.radioToken(out,"Y+是&N+否",sfzdyrw,true);
%></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">是否延期</td>
  <td><%
	cf.radioToken(out,"Y+是&N+否",sfyq,true);
%></td>
  <td align="right">延期天数</td>
  <td><%=yqts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有工期变更单</td> 
  <td width="32%"><%
	cf.radioToken(out,"Y+有&N+无",sfybgd,true);
%></td>
  <td align="right" width="18%">节点顺延天数</td> 
  <td width="32%"><%=jdsyts%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否发生整改</td> 
  <td width="32%"><%
	cf.radioToken(out,"Y+是&N+否",sffszg,true);
%></td>
  <td align="right" width="18%">是否有返补单</td> 
  <td width="32%"><%
	cf.radioToken(out,"Y+有&N+无",sfyfbd,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><%=lrr%></td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门</td>
  <td>
	  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>  </td>
  <td align="right">节点得分</td>
  <td><%=jddf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><%=bz%></td>
</tr>
</table>

</body>
</html>

