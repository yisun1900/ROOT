<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	String getStr=null;
	String all=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>回访明细（<%=cf.fillNull(hflxmc)%>）
  <BR>(<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1"  cellspacing="0" cellpadding="1"  style='FONT-SIZE:12px' width="1107">
  <tr align="center"> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="10" >设计师满意度</td>
    <td colspan="10" >质检员满意度</td>
    <td colspan="10" >工程质量满意度</td>
    <td rowspan="3" width="98">回访问题</td>
  </tr>
  <tr align="center"> 
    <td>&nbsp;</td>
    <td>客户</td>
    <td>设计师</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
    <td>质检员</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
    <td>施工队</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
  </tr>
  <tr align="center"> 
    <td  width="20">序号</td>
    <td  width="45">姓名</td>
    <td width="45">姓名</td>
    <td width="25" bgcolor="#FF66FF">设计方案</td>
    <td width="25" bgcolor="#FF66FF">后期服务</td>
    <td width="25" bgcolor="#FF66FF">交底清楚</td>
    <td width="25" bgcolor="#9999FF">设计方案</td>
    <td width="25" bgcolor="#9999FF">后期服务</td>
    <td width="25" bgcolor="#9999FF">交底清楚</td>
    <td width="25" bgcolor="#00CC00">设计方案</td>
    <td width="25" bgcolor="#00CC00">后期服务</td>
    <td width="25" bgcolor="#00CC00">交底清楚</td>
    <td width="45" >姓名</td>
    <td width="25" bgcolor="#FF66FF" >服务</td>
    <td width="25" bgcolor="#FF66FF" >到位</td>
    <td width="25" bgcolor="#FF66FF" >尽责</td>
    <td width="25" bgcolor="#9999FF" >服务</td>
    <td width="25" bgcolor="#9999FF" >到位</td>
    <td width="25" bgcolor="#9999FF" >尽责</td>
    <td width="25" bgcolor="#00CC00" >服务</td>
    <td width="25" bgcolor="#00CC00" >到位</td>
    <td width="25" bgcolor="#00CC00" >尽责</td>
    <td width="45" >姓名</td>
    <td width="25" bgcolor="#FF66FF" >服务态度</td>
    <td width="25" bgcolor="#FF66FF" >施工质量</td>
    <td width="25" bgcolor="#FF66FF" >工人素质</td>
    <td width="25" bgcolor="#9999FF" >服务态度</td>
    <td width="25" bgcolor="#9999FF" >施工质量</td>
    <td width="25" bgcolor="#9999FF" >工人素质</td>
    <td width="25" bgcolor="#00CC00" >服务态度</td>
    <td width="25" bgcolor="#00CC00" >施工质量</td>
    <td width="25" bgcolor="#00CC00" >工人素质</td>
  </tr>
  <%
	ls_sql="SELECT rownum,khxm";
	ls_sql+=" ,sjs,DECODE(sjfa,'21','<font color=\"#FF66FF\">★</font>'),DECODE(hqfw,'21','<font color=\"#FF66FF\">★</font>'),DECODE(jdqk,'21','<font color=\"#FF66FF\">★</font>'),DECODE(sjfa,'22','<font color=\"#9999FF\">◆</font>'),DECODE(hqfw,'22','<font color=\"#9999FF\">◆</font>'),DECODE(jdqk,'22','<font color=\"#9999FF\">◆</font>'),DECODE(sjfa,'23','<font color=\"#00CC00\">▲</font>'),DECODE(hqfw,'23','<font color=\"#00CC00\">▲</font>'),DECODE(jdqk,'23','<font color=\"#00CC00\">▲</font>')";
	ls_sql+=" ,zjxm,DECODE(zjyfw,'21','<font color=\"#FF66FF\">★</font>'),DECODE(zjydw,'21','<font color=\"#FF66FF\">★</font>'),DECODE(zjyjz,'21','<font color=\"#FF66FF\">★</font>'),DECODE(zjyfw,'22','<font color=\"#9999FF\">◆</font>'),DECODE(zjydw,'22','<font color=\"#9999FF\">◆</font>'),DECODE(zjyjz,'22','<font color=\"#9999FF\">◆</font>'),DECODE(zjyfw,'23','<font color=\"#00CC00\">▲</font>'),DECODE(zjydw,'23','<font color=\"#00CC00\">▲</font>'),DECODE(zjyjz,'23','<font color=\"#00CC00\">▲</font>')";
	ls_sql+=" ,sgdmc,DECODE(fwsz,'21','<font color=\"#FF66FF\">★</font>'),DECODE(sgzl,'21','<font color=\"#FF66FF\">★</font>'),DECODE(grsz,'21','<font color=\"#FF66FF\">★</font>'),DECODE(fwsz,'22','<font color=\"#9999FF\">◆</font>'),DECODE(sgzl,'22','<font color=\"#9999FF\">◆</font>'),DECODE(grsz,'22','<font color=\"#9999FF\">◆</font>'),DECODE(fwsz,'23','<font color=\"#00CC00\">▲</font>'),DECODE(sgzl,'23','<font color=\"#00CC00\">▲</font>'),DECODE(grsz,'23','<font color=\"#00CC00\">▲</font>')";
	ls_sql+=" ,DECODE(sjshfnr,null,'',sjshfnr,'[设计师]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[质检]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[施工队]：'||sgdhfnr)||DECODE(crm_hfjl.bz,null,'',crm_hfjl.bz,'<BR>[备注]：'||crm_hfjl.bz) as hfnr";
	ls_sql+=" FROM crm_hfjl,sq_sgd,crm_khxx   ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.alignStr[32]="align='left'";

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>