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
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsjl.slbm='"+dwbh+"'";
	}
	
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>客户家居投拆报修报表(<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="5%">严重程度</td>
	<td  width="7%">客户姓名</td>
	<td  width="4%">来源</td>
	<td  width="12%">地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="4%">质检员</td>
	<td  width="6%">完工日期</td>
	<td  width="16%">投诉报修内容</td>
	<td  width="8%">投诉报修备注</td>
	<td  width="18%">处理情况</td>
	<td  width="18%">处理状态</td>
	<td  width="18%">处理人</td>
	<td  width="18%">处理时间</td>
	<td  width="18%">投诉品牌</td>
	<td  width="5%">责任部门</td>
	<td  width="5%">原因</td>
</tr>
<%

	ls_sql=" SELECT rownum,yzcdmc,khxm,slfsmc,fwdz,sjs,sgd,zjxm,sjjgrq,tsnr,bz,clqk,clzt,clr,clsj,gysmc,dwmc,tsxlmc";
	ls_sql+=" from (";

	ls_sql+=" SELECT '09' yzcdbm,'特殊情况' yzcdmc,crm_tsjl.lx,khxm||'('||lxfs||')' khxm,slfsmc,fwdz,sjs,sgdmc sgd,zjxm,NVL2(crm_tsbm.clqk,'（录入：'||TO_CHAR(crm_tsbm.lrsj,'YYYY-MM-DD')||'，'||crm_tsbm.lrr||'）'||'（处理：'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk,'') clqk,TO_CHAR(sjjgrq,'YYYY-MM-DD') sjjgrq,'（'||slr||'：'||TO_CHAR(slsj,'YYYY-MM-DD HH:MM:SS')||'）：'||tsnr tsnr,crm_tsjl.bz,DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,crm_tsbm.clr clr,crm_tsbm.clsj clsj,gysmc,b.dwmc,tsxlmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm,crm_tsbm,dm_tsxlbm,sq_dwxx b,sq_gysxx,crm_tspp  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.sftsqk='Y'";//Y：是；N：否
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in('12','23')";//23：家居投诉 12：家居报修
	ls_sql+=wheresql;

	ls_sql+=" union";

	ls_sql+=" SELECT crm_tsjl.yzcdbm,yzcdmc,crm_tsjl.lx,khxm||'('||lxfs||')' khxm,slfsmc,fwdz,sjs,sgdmc sgd,zjxm,NVL2(crm_tsbm.clqk,'（录入：'||TO_CHAR(crm_tsbm.lrsj,'YYYY-MM-DD')||'，'||crm_tsbm.lrr||'）'||'（处理：'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk,'') clqk,TO_CHAR(sjjgrq,'YYYY-MM-DD') sjjgrq,'（'||slr||'：'||TO_CHAR(slsj,'YYYY-MM-DD HH:MM:SS')||'）：'||tsnr tsnr,crm_tsjl.bz,DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,crm_tsbm.clr clr,crm_tsbm.clsj clsj,gysmc,b.dwmc,tsxlmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm,crm_tsbm,dm_tsxlbm,sq_dwxx b,sq_gysxx,crm_tspp  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.lx='1'";
    ls_sql+=" and crm_tsjl.sftsqk='N'";//Y：是；N：否
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in('12','23')";//23：家居投诉 12：家居报修
	ls_sql+=wheresql;

	ls_sql+=" union";

	ls_sql+=" SELECT '00' yzcdbm,'报修' yzcdmc,crm_tsjl.lx,khxm||'('||lxfs||')' khxm,slfsmc,fwdz,sjs,sgdmc sgd,zjxm,NVL2(crm_tsbm.clqk,'（录入：'||TO_CHAR(crm_tsbm.lrsj,'YYYY-MM-DD')||'，'||crm_tsbm.lrr||'）'||'（处理：'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk,'') clqk,TO_CHAR(sjjgrq,'YYYY-MM-DD') sjjgrq,'（'||slr||'：'||TO_CHAR(slsj,'YYYY-MM-DD HH:MM:SS')||'）：'||tsnr tsnr,crm_tsjl.bz,DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,crm_tsbm.clr clr,crm_tsbm.clsj clsj,gysmc,b.dwmc,tsxlmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm,crm_tsbm,dm_tsxlbm,sq_dwxx b,sq_gysxx,crm_tspp  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.lx='2'";
    ls_sql+=" and crm_tsjl.sftsqk='N'";//Y：是；N：否
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in('12','23')";//23：家居投诉 12：家居报修
	ls_sql+=wheresql;
    ls_sql+=" order by yzcdbm desc";

	ls_sql+=" )";
	
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.setDateType("long");
	pageObj.alignStr[4]="align='left'";
	pageObj.alignStr[9]="align='left'";
	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[11]="align='left'";

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("yzcdmc","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("sjjgrq","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>

</body>
</html>