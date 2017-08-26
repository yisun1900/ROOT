<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String sgdmc=null;
String sgbz=null;
String htgcf=null;
String htqtsf=null;
String gcfzjx=null;
String qtsfzjx=null;
String qtfsm=null;
String htsgcb=null;
String zjxsgcb=null;
String ljclf=null;
String ljrgf=null;
String ssk=null;
String jsyh=null;
String khpck=null;
String yqf=null;
String khqk=null;
String jsjsmc=null;
String htjsjs=null;
String zjxjsjs=null;
String sdljsfs=null;
String sdlqz=null;
String sdlje=null;
String sdljsbl=null;
String sdljsje=null;
String zjxjffs=null;
String zjxbhfw=null;
String zjxsjd=null;
String ljzjxxs=null;
String ljzjxje=null;
String zxxs=null;
String zxje=null;
String jxxs=null;
String jxje=null;
String sfkyqpc=null;
String kyqf=null;
String kkhpck=null;
String kkhqk=null;
String zcsfjs=null;
String zcjehqfs=null;
String zcjsblkg=null;
String zcjsbl=null;
String zcje=null;
String zcjsje=null;
String jsjsze=null;
String jsbl=null;
String tzjsbl=null;
String jsje=null;
String rgfjse=null;
String flfjse=null;
String sfkclk=null;
String clf=null;
String sfkgdyp=null;
String gdyp=null;
String sfkyfgf=null;
String yfgf=null;
String sfkzbj=null;
String kzbjjs=null;
String kzbjbl=null;
String kzbj=null;
String sfkclfk=null;
String clfk=null;
String sfkclyf=null;
String clyf=null;
String sfkzckk=null;
String zckk=null;
String sfjzcjl=null;
String zcjl=null;
String sfkfkje=null;
String fkje=null;
String sfjjlje=null;
String jlje=null;
String sfjqtje=null;
String qtje=null;
String yfje=null;
String jsrq=null;
String spztmc=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String jsjsxjje=null;

String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String khjl=null;
String zjxm=null;

String jsjlh=request.getParameter("jsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();


	ls_sql =" SELECT cw_sgdwgjsty.jsjlh,cw_sgdwgjsty.khbh,sgdmc,cw_sgdwgjsty.sgbz,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,cw_sgdwgjsty.htgcf,cw_sgdwgjsty.htqtsf,cw_sgdwgjsty.gcfzjx,cw_sgdwgjsty.qtsfzjx,cw_sgdwgjsty.qtfsm";
	ls_sql+=" ,cw_sgdwgjsty.htsgcb,cw_sgdwgjsty.zjxsgcb,cw_sgdwgjsty.ljclf,cw_sgdwgjsty.ljrgf,cw_sgdwgjsty.ssk,cw_sgdwgjsty.jsyh";
	ls_sql+=" ,cw_sgdwgjsty.khpck,cw_sgdwgjsty.yqf,cw_sgdwgjsty.khqk,dm_jsjsbm.jsjsmc,cw_sgdwgjsty.htjsjs,cw_sgdwgjsty.zjxjsjs,cw_sgdwgjsty.jsjsxjje";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.sdljsfs,'1','不独立结算','2','独立比例不可改','3','独立比例可改','4','手工录入结算金额') sdljsfs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.sdlqz ,'1','折前','2','折后','3','施工成本价') sdlqz,cw_sgdwgjsty.sdlje,cw_sgdwgjsty.sdljsbl";
	ls_sql+=" ,cw_sgdwgjsty.sdljsje,DECODE(cw_sgdwgjsty.zjxjffs,'1','不奖罚','2','累计折后增减项金额','3','累计增减项施工成本','4','折后增项金额减项金额','5','增项施工成本减项施工成本','6','增项施工成本折后减项金额','7','折后增项金额减项施工成本') zjxjffs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zjxbhfw,'1','工程','2','其它费','3','工程＋其它费','4','工程(含水电)','5','工程＋其它费(含水电)') zjxbhfw";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zjxsjd,'1','全部','2','开工前','3','开工后') zjxsjd,cw_sgdwgjsty.ljzjxxs,cw_sgdwgjsty.ljzjxje";
	ls_sql+=" ,cw_sgdwgjsty.zxxs,cw_sgdwgjsty.zxje,cw_sgdwgjsty.jxxs,cw_sgdwgjsty.jxje,DECODE(cw_sgdwgjsty.sfkyqpc,'Y','自动获取','S','人工录入','N','否') sfkyqpc";
	ls_sql+=" ,cw_sgdwgjsty.kyqf,cw_sgdwgjsty.kkhpck,cw_sgdwgjsty.kkhqk,DECODE(cw_sgdwgjsty.zcsfjs,'1','不结算','2','按比例结算','3','人工录入') zcsfjs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zcjehqfs,'1','自动获取','2','人工录入') zcjehqfs,DECODE(cw_sgdwgjsty.zcjsblkg,'1','可修改','2','不可修改') zcjsblkg";
	ls_sql+=" ,cw_sgdwgjsty.zcjsbl,cw_sgdwgjsty.zcje,cw_sgdwgjsty.zcjsje,cw_sgdwgjsty.jsjsze,cw_sgdwgjsty.jsbl,cw_sgdwgjsty.tzjsbl";
	ls_sql+=" ,cw_sgdwgjsty.jsje,cw_sgdwgjsty.rgfjse,cw_sgdwgjsty.flfjse,DECODE(cw_sgdwgjsty.sfkclk,'Y','是','N','否') sfkclk";
	ls_sql+=" ,cw_sgdwgjsty.clf,DECODE(cw_sgdwgjsty.sfkgdyp,'Y','是','N','否') sfkgdyp,cw_sgdwgjsty.gdyp,DECODE(cw_sgdwgjsty.sfkyfgf,'Y','是','N','否') sfkyfgf";
	ls_sql+=" ,cw_sgdwgjsty.yfgf,DECODE(cw_sgdwgjsty.sfkzbj,'Y','扣质保金比例不可改','M','扣质保金比例可改','N','不扣质保金') sfkzbj";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.kzbjjs,'1','结算基数','2','结算总额') kzbjjs,cw_sgdwgjsty.kzbjbl,cw_sgdwgjsty.kzbj,DECODE(cw_sgdwgjsty.sfkclfk,'Y','自动获取','S','人工录入','N','否') sfkclfk ";
	ls_sql+=" ,cw_sgdwgjsty.clfk,DECODE(cw_sgdwgjsty.sfkclyf,'Y','自动获取','S','人工录入','N','否') sfkclyf,cw_sgdwgjsty.clyf,DECODE(cw_sgdwgjsty.sfkzckk,'Y','自动获取','S','人工录入','N','否') sfkzckk,cw_sgdwgjsty.zckk,DECODE(cw_sgdwgjsty.sfjzcjl,'Y','自动获取','S','人工录入','N','否') sfjzcjl";
	ls_sql+=" ,cw_sgdwgjsty.zcjl,DECODE(cw_sgdwgjsty.sfkfkje,'Y','自动获取','S','人工录入','N','否') sfkfkje,cw_sgdwgjsty.fkje,DECODE(cw_sgdwgjsty.sfjjlje,'Y','自动获取','S','人工录入','N','否') sfjjlje,cw_sgdwgjsty.jlje,DECODE(cw_sgdwgjsty.sfjqtje,'Y','自动获取','S','人工录入','N','否') sfjqtje,cw_sgdwgjsty.qtje,cw_sgdwgjsty.yfje";
	ls_sql+=" ,cw_sgdwgjsty.jsrq,DECODE(cw_sgdwgjsty.spzt,'1','未审批','2','审批同意','3','审批不同意') spztmc,cw_sgdwgjsty.spr,cw_sgdwgjsty.spsj,cw_sgdwgjsty.spyj,cw_sgdwgjsty.lrr,cw_sgdwgjsty.lrsj,sq_dwxx.dwmc,cw_sgdwgjsty.bz  ";
	ls_sql+=" FROM crm_khxx,cw_sgdwgjsty,sq_sgd,sq_dwxx,bdm_bjjbbm,dm_jsjsbm  ";
    ls_sql+=" where cw_sgdwgjsty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdwgjsty.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjsty.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and cw_sgdwgjsty.jsjs=dm_jsjsbm.jsjsbm(+)";
	ls_sql+=" and cw_sgdwgjsty.jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		htgcf=cf.fillNull(rs.getString("htgcf"));
		htqtsf=cf.fillNull(rs.getString("htqtsf"));
		gcfzjx=cf.fillNull(rs.getString("gcfzjx"));
		qtsfzjx=cf.fillNull(rs.getString("qtsfzjx"));
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		htsgcb=cf.fillNull(rs.getString("htsgcb"));
		zjxsgcb=cf.fillNull(rs.getString("zjxsgcb"));
		ljclf=cf.fillNull(rs.getString("ljclf"));
		ljrgf=cf.fillNull(rs.getString("ljrgf"));
		ssk=cf.fillNull(rs.getString("ssk"));
		jsyh=cf.fillNull(rs.getString("jsyh"));
		khpck=cf.fillNull(rs.getString("khpck"));
		yqf=cf.fillNull(rs.getString("yqf"));
		khqk=cf.fillNull(rs.getString("khqk"));
		jsjsmc=cf.fillNull(rs.getString("jsjsmc"));
		htjsjs=cf.fillNull(rs.getString("htjsjs"));
		zjxjsjs=cf.fillNull(rs.getString("zjxjsjs"));
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sdlqz=cf.fillNull(rs.getString("sdlqz"));
		sdlje=cf.fillNull(rs.getString("sdlje"));
		sdljsbl=cf.fillNull(rs.getString("sdljsbl"));
		sdljsje=cf.fillNull(rs.getString("sdljsje"));
		zjxjffs=cf.fillNull(rs.getString("zjxjffs"));
		zjxbhfw=cf.fillNull(rs.getString("zjxbhfw"));
		zjxsjd=cf.fillNull(rs.getString("zjxsjd"));
		ljzjxxs=cf.fillNull(rs.getString("ljzjxxs"));
		ljzjxje=cf.fillNull(rs.getString("ljzjxje"));
		zxxs=cf.fillNull(rs.getString("zxxs"));
		zxje=cf.fillNull(rs.getString("zxje"));
		jxxs=cf.fillNull(rs.getString("jxxs"));
		jxje=cf.fillNull(rs.getString("jxje"));
		sfkyqpc=cf.fillNull(rs.getString("sfkyqpc"));
		kyqf=cf.fillNull(rs.getString("kyqf"));
		kkhpck=cf.fillNull(rs.getString("kkhpck"));
		kkhqk=cf.fillNull(rs.getString("kkhqk"));
		zcsfjs=cf.fillNull(rs.getString("zcsfjs"));
		zcjehqfs=cf.fillNull(rs.getString("zcjehqfs"));
		zcjsblkg=cf.fillNull(rs.getString("zcjsblkg"));
		zcjsbl=cf.fillNull(rs.getString("zcjsbl"));
		zcje=cf.fillNull(rs.getString("zcje"));
		zcjsje=cf.fillNull(rs.getString("zcjsje"));
		jsjsze=cf.fillNull(rs.getString("jsjsze"));
		jsbl=cf.fillNull(rs.getString("jsbl"));
		tzjsbl=cf.fillNull(rs.getString("tzjsbl"));
		jsje=cf.fillNull(rs.getString("jsje"));
		rgfjse=cf.fillNull(rs.getString("rgfjse"));
		flfjse=cf.fillNull(rs.getString("flfjse"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		clf=cf.fillNull(rs.getString("clf"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		gdyp=cf.fillNull(rs.getString("gdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		yfgf=cf.fillNull(rs.getString("yfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		kzbjbl=cf.fillNull(rs.getString("kzbjbl"));
		kzbj=cf.fillNull(rs.getString("kzbj"));
		sfkclfk=cf.fillNull(rs.getString("sfkclfk"));
		clfk=cf.fillNull(rs.getString("clfk"));
		sfkclyf=cf.fillNull(rs.getString("sfkclyf"));
		clyf=cf.fillNull(rs.getString("clyf"));
		sfkzckk=cf.fillNull(rs.getString("sfkzckk"));
		zckk=cf.fillNull(rs.getString("zckk"));
		sfjzcjl=cf.fillNull(rs.getString("sfjzcjl"));
		zcjl=cf.fillNull(rs.getString("zcjl"));
		sfkfkje=cf.fillNull(rs.getString("sfkfkje"));
		fkje=cf.fillNull(rs.getString("fkje"));
		sfjjlje=cf.fillNull(rs.getString("sfjjlje"));
		jlje=cf.fillNull(rs.getString("jlje"));
		sfjqtje=cf.fillNull(rs.getString("sfjqtje"));
		qtje=cf.fillNull(rs.getString("qtje"));
		yfje=cf.fillNull(rs.getString("yfje"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		spztmc=cf.fillNull(rs.getString("spztmc"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
		bz=cf.fillNull(rs.getString("bz"));
		jsjsxjje=cf.fillNull(rs.getString("jsjsxjje"));
	
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,hth,sjs,khjl,zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khjl=cf.fillNull(rs.getString("khjl"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
<title>完工结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
.STYLE5 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 完工结算(结算记录号:<%=jsjlh%>)</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    施工队  </td>
  <td width="32%"> 
    <%=sgdmc%>  </td>
  <td align="right" width="18%"> 
    现场负责人  </td>
  <td width="32%"> 
    <%=sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><input type="button" onClick="window.open('/dzbj/dybj.jsp?khbh=<%=khbh%>')" value="电子报价">
      <input type="button" onClick="window.open('/khxx/ViewZxsgcbj.jsp?khbh=<%=khbh%>')"  value="最新施工成本价">
      <input type="button" onClick="window.open('/khxx/ViewZxSdl.jsp?khbh=<%=khbh%>')"  value="查看水电路">
      <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
      <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
      <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">合同工程费</span></td>
  <td><%=htgcf%></td>
  <td align="right"><span class="STYLE4">工程费增减项</span></td>
  <td><%=gcfzjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">合同其它费</span></td>
  <td><%=htqtsf%></td>
  <td align="right"><span class="STYLE4">其它费增减项</span></td>
  <td><%=qtsfzjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">合同施工成本</span></td>
  <td><%=htsgcb%></td>
  <td align="right"><span class="STYLE4">增减项施工成本</span></td>
  <td><%=zjxsgcb%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">其它费说明</span></td>
  <td colspan="3"><%=qtfsm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">累计材料费</span></td>
  <td><%=ljclf%></td>
  <td align="right"><span class="STYLE4">累计人工费</span></td>
  <td><%=ljrgf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">实收款</span></td>
  <td><%=ssk%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户结算优惠  </td>
  <td width="32%"> 
    <%=jsyh%>  </td>
  <td align="right" width="18%"> 
    客户赔偿款  </td>
  <td width="32%"> 
    <%=khpck%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    延期费  </td>
  <td width="32%"> 
    <%=yqf%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户欠款</td>
  <td colspan="3"><%=khqk%>客户欠款=最新报价总额-结算优惠-客户赔偿款-延期费-实收款</td>
  </tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算基数  </td>
  <td width="32%"> 
    <%=jsjsmc%>  </td>
  <td align="right"> 结算基数金额 </td>
  <td><%=jsjsxjje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">合同结算基数 </td>
  <td width="32%"><%=htjsjs%></td>
  <td align="right" width="18%">增减项结算基数</td>
  <td width="32%"><%=zjxjsjs%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">水电路结算方式</td>
  <td><%=sdljsfs%>(<%=sdlqz%>)</td>
  <td align="right">水电路结算比例 </td>
  <td><%=sdljsbl%>%</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">水电路金额</td>
  <td width="32%"><%=sdlje%></td>
  <td align="right" width="18%"> 
    水电路结算金额  </td>
  <td width="32%"> 
    <%=sdljsje%>  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    增减项奖罚方式  </td>
  <td width="32%"> 
    <%=zjxjffs%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">增减项包含范围</td>
  <td><%=zjxbhfw%></td>
  <td align="right">增减项时间点</td>
  <td><%=zjxsjd%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">增项系数</td>
  <td width="32%"><%=zxxs%></td>
  <td align="right" width="18%">增项金额</td>
  <td width="32%"><%=zxje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">减项系数</td>
  <td><%=jxxs%></td>
  <td align="right">减项金额</td>
  <td><%=jxje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">累计增减项系数</td>
  <td width="32%"><%=ljzjxxs%></td>
  <td align="right" width="18%">累计增减项 </td>
  <td width="32%"><%=ljzjxje%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣延期费赔偿款</td>
  <td width="32%"><%=sfkyqpc%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    扣延期费  </td>
  <td width="32%"> 
    <%=kyqf%>  </td>
  <td align="right" width="18%"> 
    扣客户赔偿款  </td>
  <td width="32%"> 
    <%=kkhpck%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    扣客户欠款  </td>
  <td width="32%"> 
    <%=kkhqk%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算基数总额</td>
  <td><%=jsjsze%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 结算比例 </td>
  <td><%=jsbl%>% </td>
  <td align="right"> 调整结算比例 </td>
  <td><%=tzjsbl%>% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 结算总额 </td>
  <td><%=jsje%> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">人工费结算额 </td>
  <td><%=rgfjse%></td>
  <td align="right">辅料费结算额</td>
  <td><%=flfjse%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">主材是否结算 </td>
  <td><%=zcsfjs%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    主材金额获取方式  </td>
  <td width="32%"> 
    <%=zcjehqfs%>  </td>
  <td align="right" width="18%"> 
    主材结算比例可修改  </td>
  <td width="32%"> 
    <%=zcjsblkg%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">主材金额</td>
  <td width="32%"><%=zcje%></td>
  <td align="right" width="18%"> 
    主材结算比例  </td>
  <td width="32%"><%=zcjsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    主材结算金额  </td>
  <td width="32%"> 
    <%=zcjsje%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣材料款</td>
  <td width="32%"><%=sfkclk%></td>
  <td align="right" width="18%">材料费</td>
  <td width="32%"><%=clf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣工地用品 </td>
  <td width="32%"><%=sfkgdyp%></td>
  <td align="right" width="18%">工地用品</td>
  <td width="32%"><%=gdyp%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣已付工费</td>
  <td width="32%"><%=sfkyfgf%></td>
  <td align="right" width="18%">已付工费</td>
  <td width="32%"><%=yfgf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣质保金 </td>
  <td width="32%"><%=sfkzbj%></td>
  <td align="right" width="18%">扣质保金 </td>
  <td width="32%"><%=kzbj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    扣质保金基数  </td>
  <td width="32%"> 
    <%=kzbjjs%>  </td>
  <td align="right" width="18%"> 
    扣质保金比例  </td>
  <td width="32%"> 
    <%=kzbjbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣辅材罚款</td>
  <td width="32%"><%=sfkclfk%></td>
  <td align="right" width="18%">辅材罚款</td>
  <td width="32%"><%=clfk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣材料运费 </td>
  <td width="32%"><%=sfkclyf%></td>
  <td align="right" width="18%">材料运费</td>
  <td width="32%"><%=clyf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣主材扣款</td>
  <td width="32%"><%=sfkzckk%></td>
  <td align="right" width="18%">主材扣款</td>
  <td width="32%"><%=zckk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否加主材奖励 </td>
  <td width="32%"><%=sfjzcjl%></td>
  <td align="right" width="18%">主材奖励 </td>
  <td width="32%"><%=zcjl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣罚款金额</td>
  <td width="32%"><%=sfkfkje%></td>
  <td align="right" width="18%">罚款金额</td>
  <td width="32%"><%=fkje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否加奖励金额</td>
  <td width="32%"><%=sfjjlje%></td>
  <td align="right" width="18%">奖励金额</td>
  <td width="32%"><%=jlje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否加其它金额</td>
  <td width="32%"><%=sfjqtje%></td>
  <td align="right" width="18%">其它金额 </td>
  <td width="32%"><%=qtje%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="23" colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">应付金额</td>
  <td width="32%"><%=yfje%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算日期  </td>
  <td width="32%"> 
    <%=jsrq%>  </td>
  <td align="right" width="18%"> 
    审批状态  </td>
  <td width="32%"> 
    <%=spztmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    审批人  </td>
  <td width="32%"> 
    <%=spr%>  </td>
  <td align="right" width="18%"> 
    审批时间  </td>
  <td width="32%"> 
    <%=spsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    审批意见  </td>
  <td colspan="3"> 
    <%=spyj%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><%=lrr%></td>
  <td align="right">录入时间</td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门 </td>
  <td width="32%"><%=lrbm%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    备注  </td>
  <td colspan="3"> 
    <%=bz%>  </td>
  </tr>
</table>
</body>
</html>
