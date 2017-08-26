<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单统计</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%">施工队</td>
    <td  width="7%">班组数</td>
    <td  width="7%">质保金</td>
    <td  width="8%">未开工工地数</td>
    <td  width="12%">未开工施工额</td>
    <td  width="8%">在施工地数</td>
    <td  width="12%">在施工总额</td>
    <td  width="10%">在施工平均单额</td>
    <td  width="8%">今年已完工数</td>
    <td  width="12%">今年已完工总额</td>
    <td  width="10%">今年已完工平均单额</td>

  </tr>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql=" SELECT sgd,sgdmc,bzs,zbj,sum(wkgsl) wkgsl,sum(wkgqye) wkgqye,sum(wwgsl) sl,sum(wwgqye) wwgqye,TO_CHAR(sum(wwgpjde)) wwgpjde,sum(wgsl) wgsl,sum(wgqye) wgqye,TO_CHAR(sum(wgpjde)) wgpjde";
	ls_sql+=" from";
	ls_sql+=" (";

	//未开工工地数
	ls_sql+=" SELECT crm_khxx.sgd,sgdmc,bzs,zbj,count(*) wkgsl,sum(qye) wkgqye,0 wwgsl,sum(qye) wwgqye,ROUND(sum(qye)/count(*),0) wwgpjde,0 wgsl,0 wgqye,0 wgpjde";
	ls_sql+=" FROM sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and sq_sgd.cxbz='N'";
	ls_sql+=" and sq_sgd.ssfgs='"+ssfgs+"' and gcjdbm='1'";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,bzs,zbj";

	ls_sql+=" union";

	//在施工地数
	ls_sql+=" SELECT crm_khxx.sgd,sgdmc,bzs,zbj,0 wkgsl,0 wkgqye,count(*) wwgsl,sum(qye) wwgqye,ROUND(sum(qye)/count(*),0) wwgpjde,0 wgsl,0 wgqye,0 wgpjde";
	ls_sql+=" FROM sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and sq_sgd.cxbz='N'";
	ls_sql+=" and sq_sgd.ssfgs='"+ssfgs+"' and gcjdbm not in('1','5')";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,bzs,zbj";

	ls_sql+=" union";

	//今年已完工数
	ls_sql+=" SELECT crm_khxx.sgd,sgdmc,bzs,zbj,0 wkgsl,0 wkgqye,0 wwgsl,0 wwgqye,0 wwgpjde,count(*) wgsl,sum(qye) wgqye,ROUND(sum(qye)/count(*),0) wgpjde";
	ls_sql+=" FROM sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and sq_sgd.cxbz='N'";
	ls_sql+=" and sq_sgd.ssfgs='"+ssfgs+"' and gcjdbm='5'";
	ls_sql+=" and pdsj>=TO_DATE('"+cf.firstOfYear()+"','YYYY-MM-DD') and pdsj<=SYSDATE";
	ls_sql+=" group by crm_khxx.sgd,sgdmc,bzs,zbj";

	ls_sql+=" union";

	//无工数施工队
	ls_sql+=" SELECT sgd,sgdmc,bzs,zbj,0 wkgsl,0 wkgqye,0 sl,0,0,0,0,0";
	ls_sql+=" FROM sq_sgd";
	ls_sql+=" where sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' ";

	ls_sql+=" )";
	ls_sql+=" group by sgd,sgdmc,bzs,zbj";

	ls_sql+=" order by sl desc";
//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//设置显示列
	String[] disColName1={"sgdmc","bzs","zbj","wkgsl","wkgqye","sl","wwgqye","wwgpjde","wgsl","wgqye","wgpjde"};
	pageObj.setDisColName(disColName1);
/*
*/

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sgd"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewPdTjb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sgdmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_sgdkpjg_bqpm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>