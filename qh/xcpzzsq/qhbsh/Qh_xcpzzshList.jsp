<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>



<%
	//out.print(dqbm);
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	String ls_sql=null;
	String wheresql="";
	String shqk=null;
	String qh_xcpzzsh_shbbh=null;
	String qh_xcpzzsh_sqsj=null;
	String qh_xcpzzsh_tbr=null;
	String qh_xcpzzsh_zznr=null;
	String qh_xcpzzsh_sl=null;
	String qh_xcpzzsh_gg=null;
	String qh_xcpzzsh_xs=null;
	String qh_xcpzzsh_wznr=null;
	String qh_xcpzzsh_ysyq=null;
	String qh_xcpzzsh_qtyq=null;
	String qh_xcpzzsh_wcsj=null;
	String qh_xcpzzsh_bz=null;
	String sq_dwxx_dwmc=null;
	String scwjm=null;
	String qh_xcpzzsh_zgbmjlyj=null;
	qh_xcpzzsh_shbbh=request.getParameter("qh_xcpzzsh_shbbh");
	if (qh_xcpzzsh_shbbh!=null)
	{
		qh_xcpzzsh_shbbh=cf.GB2Uni(qh_xcpzzsh_shbbh);
		if (!(qh_xcpzzsh_shbbh.equals("")))	wheresql+=" and  (qh_xcpzzsh.shbbh='"+qh_xcpzzsh_shbbh+"')";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj>=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj2");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj<=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_tbr=request.getParameter("qh_xcpzzsh_tbr");
	if (qh_xcpzzsh_tbr!=null)
	{
		qh_xcpzzsh_tbr=cf.GB2Uni(qh_xcpzzsh_tbr);
		if (!(qh_xcpzzsh_tbr.equals("")))	wheresql+=" and  (qh_xcpzzsh.tbr='"+qh_xcpzzsh_tbr+"')";
	}
	qh_xcpzzsh_zznr=request.getParameter("qh_xcpzzsh_zznr");
	if (qh_xcpzzsh_zznr!=null)
	{
		qh_xcpzzsh_zznr=cf.GB2Uni(qh_xcpzzsh_zznr);
		if (!(qh_xcpzzsh_zznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.zznr='"+qh_xcpzzsh_zznr+"')";
	}
	qh_xcpzzsh_sl=request.getParameter("qh_xcpzzsh_sl");
	if (qh_xcpzzsh_sl!=null)
	{
		qh_xcpzzsh_sl=qh_xcpzzsh_sl.trim();
		if (!(qh_xcpzzsh_sl.equals("")))	wheresql+=" and (qh_xcpzzsh.sl="+qh_xcpzzsh_sl+") ";
	}
	qh_xcpzzsh_gg=request.getParameter("qh_xcpzzsh_gg");
	if (qh_xcpzzsh_gg!=null)
	{
		qh_xcpzzsh_gg=cf.GB2Uni(qh_xcpzzsh_gg);
		if (!(qh_xcpzzsh_gg.equals("")))	wheresql+=" and  (qh_xcpzzsh.gg='"+qh_xcpzzsh_gg+"')";
	}
	qh_xcpzzsh_xs=request.getParameter("qh_xcpzzsh_xs");
	if (qh_xcpzzsh_xs!=null)
	{
		qh_xcpzzsh_xs=cf.GB2Uni(qh_xcpzzsh_xs);
		if (!(qh_xcpzzsh_xs.equals("")))	wheresql+=" and  (qh_xcpzzsh.xs='"+qh_xcpzzsh_xs+"')";
	}
	qh_xcpzzsh_wznr=request.getParameter("qh_xcpzzsh_wznr");
	if (qh_xcpzzsh_wznr!=null)
	{
		qh_xcpzzsh_wznr=cf.GB2Uni(qh_xcpzzsh_wznr);
		if (!(qh_xcpzzsh_wznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.wznr='"+qh_xcpzzsh_wznr+"')";
	}
	qh_xcpzzsh_ysyq=request.getParameter("qh_xcpzzsh_ysyq");
	if (qh_xcpzzsh_ysyq!=null)
	{
		qh_xcpzzsh_ysyq=cf.GB2Uni(qh_xcpzzsh_ysyq);
		if (!(qh_xcpzzsh_ysyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.ysyq='"+qh_xcpzzsh_ysyq+"')";
	}
	qh_xcpzzsh_qtyq=request.getParameter("qh_xcpzzsh_qtyq");
	if (qh_xcpzzsh_qtyq!=null)
	{
		qh_xcpzzsh_qtyq=cf.GB2Uni(qh_xcpzzsh_qtyq);
		if (!(qh_xcpzzsh_qtyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.qtyq='"+qh_xcpzzsh_qtyq+"')";
	}
	qh_xcpzzsh_wcsj=request.getParameter("qh_xcpzzsh_wcsj");
	if (qh_xcpzzsh_wcsj!=null)
	{
		qh_xcpzzsh_wcsj=qh_xcpzzsh_wcsj.trim();
		if (!(qh_xcpzzsh_wcsj.equals("")))	wheresql+="  and (qh_xcpzzsh.wcsj=TO_DATE('"+qh_xcpzzsh_wcsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_bz=request.getParameter("qh_xcpzzsh_bz");
	if (qh_xcpzzsh_bz!=null)
	{
		qh_xcpzzsh_bz=cf.GB2Uni(qh_xcpzzsh_bz);
		if (!(qh_xcpzzsh_bz.equals("")))	wheresql+=" and  (qh_xcpzzsh.bz='"+qh_xcpzzsh_bz+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc='"+sq_dwxx_dwmc+"')";
	}
	qh_xcpzzsh_zgbmjlyj=request.getParameter("qh_xcpzzsh_zgbmjlyj");
	if (qh_xcpzzsh_zgbmjlyj!=null)
	{
		qh_xcpzzsh_zgbmjlyj=cf.GB2Uni(qh_xcpzzsh_zgbmjlyj);
		if (!(qh_xcpzzsh_zgbmjlyj.equals("")))	wheresql+=" and  (qh_xcpzzsh.zgbmjlyj='"+qh_xcpzzsh_zgbmjlyj+"')";
	}
	shqk=request.getParameter("shqk");
	if(shqk.equals("N"))
	{
	wheresql+=" and (trim(qh_xcpzzsh.qhbshyj) is  null)";//企划部未审核
	}
	else
	{
	wheresql+=" and (trim(qh_xcpzzsh.qhbshyj) is not null)";//企划部已审核	
	}
		if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

		
	ls_sql="SELECT qh_xcpzzsh.shbbh as shbbh,qh_xcpzzsh.sqsj as qh_xcpzzsh_sqsj,qh_xcpzzsh.tbr as qh_xcpzzsh_tbr,qh_xcpzzsh.scwjm,qh_xcpzzsh.zznr as qh_xcpzzsh_zznr,qh_xcpzzsh.sl as qh_xcpzzsh_sl,qh_xcpzzsh.gg as qh_xcpzzsh_gg,qh_xcpzzsh.xs as qh_xcpzzsh_xs,qh_xcpzzsh.wznr as qh_xcpzzsh_wznr,qh_xcpzzsh.ysyq as qh_xcpzzsh_ysyq,qh_xcpzzsh.qtyq as qh_xcpzzsh_qtyq,qh_xcpzzsh.wcsj as qh_xcpzzsh_wcsj,qh_xcpzzsh.bz as qh_xcpzzsh_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,qh_xcpzzsh.zgbmjlyj as qh_xcpzzsh_zgbmjlyj,qh_xcpzzsh.zjlyj as qh_xcpzzsh_zjlyj  ";
	ls_sql+=" FROM qh_xcpzzsh,sq_dwxx  ";
    ls_sql+=" where qh_xcpzzsh.dwbh=sq_dwxx.dwbh and sq_dwxx.dqbm='"+dqbm+"' ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
 
	if(shqk.equals("Y"))//如果已审核，则调不出审核页面
	{
	pageObj.initPage("","","","ysh.html");//点击审核后，调出的页面
	}
	else
	{

	pageObj.initPage("","",""," EditQh_xcpzzsh.jsp");//点击审核后，调出的页面
	}
//	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"shbbh","qh_xcpzzsh_sqsj","qh_xcpzzsh_tbr","qh_xcpzzsh_zznr","qh_xcpzzsh_sl","qh_xcpzzsh_gg","qh_xcpzzsh_xs","qh_xcpzzsh_wznr","qh_xcpzzsh_ysyq","qh_xcpzzsh_qtyq","qh_xcpzzsh_wcsj","qh_xcpzzsh_bz","sq_dwxx_dwmc","qh_xcpzzsh_zgbmjlyj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName1={"shbbh"};
	pageObj.setKey(keyName1);
   pageObj.setEditStr("审核");
//设置列超级连接

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"shbbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/qh/xcpzzsq/ViewQh_xcpzzsh.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("shbbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置列超级连接
   coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"shbbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/qh/xcpzzsq/ViewFile.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("scwjm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">审核表编号</td>
	<td  width="6%">申请时间</td>
	<td  width="6%">填表人</td>
	<td  width="6%">企划文件</td>
	<td  width="6%">制作内容</td>
	<td  width="6%">数量</td>
	<td  width="6%">规格</td>
	<td  width="6%">形式</td>
	<td  width="6%">文字内容</td>
	<td  width="6%">颜色要求</td>
	<td  width="6%">其它要求</td>
	<td  width="6%">完成时间</td>
	<td  width="6%">备注</td>
	<td  width="6%">单位名称</td>
	<td  width="6%">主管部门经理意见</td>
	<td  width="6%">总经理意见</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>