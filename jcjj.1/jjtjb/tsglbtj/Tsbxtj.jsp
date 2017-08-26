<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
//设置显示合并列

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String sjfw=null;
	String sjfw2=null;
	String crm_tsbm_dwbh=null;

	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		if (!(sjfw.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.slbm in(select dwbh from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	crm_tsbm_dwbh=request.getParameter("crm_tsbm_dwbh");
	if (crm_tsbm_dwbh!=null)
	{
		crm_tsbm_dwbh=cf.GB2Uni(crm_tsbm_dwbh);
		if (!(crm_tsbm_dwbh.equals("")))	wheresql+=" and  (crm_tsbm.dwbh='"+crm_tsbm_dwbh+"')";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>客户服务中心日报表(<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="2%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检</td>
	<td  width="3%">投诉记录号</td>
	<td  width="2%">是否特殊情况</td>
	<td  width="2%">受理方式</td>
	<td  width="3%">严重程度</td>
	<td  width="15%">投诉报修内容</td>
	<td  width="3%">客户要求解决时间</td>
	<td  width="3%">是否需回访</td>
	<td  width="3%">受理时间</td>
	<td  width="3%">结案状态</td>
	<td  width="3%">投诉报修小类</td>
	<td  width="6%">投诉报修原因</td>
	<td  width="5%">责任部门</td>
	<td  width="4%">处理状态</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">回访结果</td>
	<td  width="15%">处理情况</td>
	<td  width="3%">投诉品牌</td>
</tr>
<%

	ls_sql="SELECT rownum,crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','特殊','N','否') sftsqk,slfsmc,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj, DECODE(crm_tsjl.sfxhf,'Y','需回访','N','不需回访') sfxhf,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') jazt,tsxlmc,tsyymc,b.dwmc zrbm, DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,crm_tsbm.lrr,crm_tsbm.lrsj,hfjgmc,'（'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk clqk,gysmc tspp  ";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,crm_tspp,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_sgd,sq_dwxx b,sq_gysxx c,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+) ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+) and crm_tspp.tspp=c.gysbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in ('12','23') ";
    ls_sql+=wheresql;
    ls_sql+=" order by rownum,crm_tsjl.tsjlh,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
	
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

//设置显示列
	String[] disColName={"rownum","khxm","fwdz","sjs","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","slsj","jazt","tsxlmc","tsyymc","zrbm","clzt","lrr","lrsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);

	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[22]="align='left'";

	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	spanColHash.put("sftsqk","1");//列参数对象加入Hash表
	spanColHash.put("slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("yzcdmc","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("yqjjsj","1");//列参数对象加入Hash表
	spanColHash.put("sfxhf","1");//列参数对象加入Hash表
	spanColHash.put("slsj","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	spanColHash.put("tsxlmc","1");//列参数对象加入Hash表
	spanColHash.put("tsyymc","1");//列参数对象加入Hash表
	spanColHash.put("zrbm","1");//列参数对象加入Hash表
	spanColHash.put("clzt","1");//列参数对象加入Hash表clqk
	spanColHash.put("lrr","1");//列参数对象加入Hash表clqk
	spanColHash.put("lrsj","1");//列参数对象加入Hash表clqk
	spanColHash.put("hfjgmc","1");//列参数对象加入Hash表clqk
	spanColHash.put("clqk","1");//列参数对象加入Hash表clqk
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
	pageObj.out=out;
	pageObj.getDate(1);
	

	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>

</body>
</html>