<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}



	String ls_sql=null;
	String wheresql="";
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String dwbh=null;
	String ssfgs=null;

	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (sq_yhxx.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");
%>

<CENTER >
  <B><font size="3">生日提醒（时间范围：<%=yue%>月）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">员工序号</td>
	<td  width="11%">员工名称</td>
	<td  width="10%">出生日期</td>
	<td  width="11%">工号</td>
	<td  width="19%">身份证号</td>
	<td  width="14%">行政职务</td>
	<td  width="16%">所属部门</td>
	<td  width="13%">所属公司</td>
</tr>
<%

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.csrq,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=wheresql;
	ls_sql+=" and TO_CHAR(sq_yhxx.csrq,'MM')='"+yue+"'";
    ls_sql+=" order by sq_yhxx.ssfgs,TO_CHAR(sq_yhxx.csrq,'DD')";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ygbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


<CENTER >
  <B><font size="3">劳动合同到期提醒（时间范围：<%=nian%>年<%=yue%>月）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">员工序号</td>
	<td  width="9%">员工名称</td>
	<td  width="10%">合同开始</td>
	<td  width="10%">合同到期</td>
	<td  width="9%">工号</td>
	<td  width="17%">身份证号</td>
	<td  width="12%">行政职务</td>
	<td  width="14%">所属部门</td>
	<td  width="12%">所属公司</td>
</tr>
<%

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.htksrq,sq_yhxx.htdqrq,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=wheresql;
	ls_sql+=" and TO_CHAR(sq_yhxx.htdqrq,'YYYY')='"+nian+"'";
	ls_sql+=" and TO_CHAR(sq_yhxx.htdqrq,'MM')='"+yue+"'";
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.htdqrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName1={"ygbh"};
	pageObj.setKey(keyName1);


//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ygbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


<CENTER >
  <B><font size="3">一周内需转正人员（<%=cf.today()%>－－<%=cf.addDay(7)%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">员工序号</td>
	<td  width="9%">员工名称</td>
	<td  width="10%">入职日期</td>
	<td  width="10%">试用截至日期</td>
	<td  width="9%">工号</td>
	<td  width="17%">身份证号</td>
	<td  width="12%">行政职务</td>
	<td  width="14%">所属部门</td>
	<td  width="12%">所属公司</td>
</tr>
<%

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.rzsj,sq_yhxx.syjzrq,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N')";
    ls_sql+=wheresql;
	ls_sql+=" and sq_yhxx.syjzrq>=TO_DATE('"+cf.today()+"','YYYY-MM-DD')";
	ls_sql+=" and sq_yhxx.syjzrq<=TO_DATE('"+cf.addDay(7)+"','YYYY-MM-DD')";
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.syjzrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName2={"ygbh"};
	pageObj.setKey(keyName2);


//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ygbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


</body>

</html>