<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_yplydjb_xh=null;
	String xz_yplydjb_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_yplydjb_ybh=null;
	String xz_yplydjb_lysl=null;
	String xz_yplydjb_lyrq=null;
	String xz_yplydjb_lyr=null;
	String xz_yplydjb_ssfgs=null;
	String xz_yplydjb_lrr=null;
	String xz_yplydjb_lrsj=null;
	xz_yplydjb_xh=request.getParameter("xz_yplydjb_xh");
	if (xz_yplydjb_xh!=null)
	{
		xz_yplydjb_xh=xz_yplydjb_xh.trim();
		if (!(xz_yplydjb_xh.equals("")))	wheresql+=" and (xz_yplydjb.xh="+xz_yplydjb_xh+") ";
	}
	xz_yplydjb_qcph=request.getParameter("xz_yplydjb_qcph");
	if (xz_yplydjb_qcph!=null)
	{
		xz_yplydjb_qcph=cf.GB2Uni(xz_yplydjb_qcph);
		if (!(xz_yplydjb_qcph.equals("")))	wheresql+=" and  (xz_yplydjb.qcph like '%"+xz_yplydjb_qcph+"%')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh like '%"+xz_qcdm_qcxh+"%')";
	}
	xz_yplydjb_ybh=request.getParameter("xz_yplydjb_ybh");
	if (xz_yplydjb_ybh!=null)
	{
		xz_yplydjb_ybh=cf.GB2Uni(xz_yplydjb_ybh);
		if (!(xz_yplydjb_ybh.equals("")))	wheresql+=" and  (xz_yplydjb.ybh='"+xz_yplydjb_ybh+"')";
	}
	xz_yplydjb_lysl=request.getParameter("xz_yplydjb_lysl");
	if (xz_yplydjb_lysl!=null)
	{
		xz_yplydjb_lysl=xz_yplydjb_lysl.trim();
		if (!(xz_yplydjb_lysl.equals("")))	wheresql+=" and  (xz_yplydjb.lysl>="+xz_yplydjb_lysl+") ";
	}
	xz_yplydjb_lysl=request.getParameter("xz_yplydjb_lysl2");
	if (xz_yplydjb_lysl!=null)
	{
		xz_yplydjb_lysl=xz_yplydjb_lysl.trim();
		if (!(xz_yplydjb_lysl.equals("")))	wheresql+=" and  (xz_yplydjb.lysl<="+xz_yplydjb_lysl+") ";
	}
	xz_yplydjb_lyrq=request.getParameter("xz_yplydjb_lyrq");
	if (xz_yplydjb_lyrq!=null)
	{
		xz_yplydjb_lyrq=xz_yplydjb_lyrq.trim();
		if (!(xz_yplydjb_lyrq.equals("")))	wheresql+="  and (xz_yplydjb.lyrq>=TO_DATE('"+xz_yplydjb_lyrq+"','YYYY/MM/DD'))";
	}
	xz_yplydjb_lyrq=request.getParameter("xz_yplydjb_lyrq2");
	if (xz_yplydjb_lyrq!=null)
	{
		xz_yplydjb_lyrq=xz_yplydjb_lyrq.trim();
		if (!(xz_yplydjb_lyrq.equals("")))	wheresql+="  and (xz_yplydjb.lyrq<=TO_DATE('"+xz_yplydjb_lyrq+"','YYYY/MM/DD'))";
	}
	xz_yplydjb_lyr=request.getParameter("xz_yplydjb_lyr");
	if (xz_yplydjb_lyr!=null)
	{
		xz_yplydjb_lyr=cf.GB2Uni(xz_yplydjb_lyr);
		if (!(xz_yplydjb_lyr.equals("")))	wheresql+=" and  (xz_yplydjb.lyr='"+xz_yplydjb_lyr+"')";
	}

	xz_yplydjb_ssfgs=request.getParameter("xz_yplydjb_ssfgs");
	if (!(xz_yplydjb_ssfgs.equals("")))	wheresql+=" and  (xz_yplydjb.ssfgs='"+xz_yplydjb_ssfgs+"')";

	xz_yplydjb_lrr=request.getParameter("xz_yplydjb_lrr");
	if (xz_yplydjb_lrr!=null)
	{
		xz_yplydjb_lrr=cf.GB2Uni(xz_yplydjb_lrr);
		if (!(xz_yplydjb_lrr.equals("")))	wheresql+=" and  (xz_yplydjb.lrr='"+xz_yplydjb_lrr+"')";
	}
	xz_yplydjb_lrsj=request.getParameter("xz_yplydjb_lrsj");
	if (xz_yplydjb_lrsj!=null)
	{
		xz_yplydjb_lrsj=xz_yplydjb_lrsj.trim();
		if (!(xz_yplydjb_lrsj.equals("")))	wheresql+="  and (xz_yplydjb.lrsj=TO_DATE('"+xz_yplydjb_lrsj+"','YYYY/MM/DD'))";
	}


	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT xz_yplydjb.xh,xz_yplydjb.qcph,xz_qcdm.qcxh,xz_qcdm.sjxm,xz_yplydjb.ybh,xz_yplydjb.dj,xz_yplydjb.lysl,xz_yplydjb.cllcs,xz_yplydjb.lyrq,xz_yplydjb.lyr,sq_dwxx.dwmc,xz_yplydjb.lrr,xz_yplydjb.lrsj,xz_yplydjb.bz  ";
	ls_sql+=" FROM sq_dwxx,xz_qcdm,xz_yplydjb  ";
    ls_sql+=" where xz_yplydjb.qcph=xz_qcdm.qcph and xz_yplydjb.ssfgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_yplydjbCxList.jsp","SelectCxXz_yplydjb.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"xh","xz_yplydjb_qcph","xz_qcdm_qcxh","xz_qcdm_sjxm","xz_yplydjb_ybh","xz_yplydjb_lysl","xz_yplydjb_cllcs","xz_yplydjb_lyrq","xz_yplydjb_lyr","sq_dwxx_dwmc","xz_yplydjb_lrr","xz_yplydjb_lrsj","xz_yplydjb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">车辆加油查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="10%">汽车牌号</td>
	<td  width="10%">汽车型号</td>
	<td  width="4%">司机姓名</td>
	<td  width="5%">油标号</td>
	<td  width="5%">单价</td>
	<td  width="5%">加油数量</td>
	<td  width="5%">车辆里程数</td>
	<td  width="6%">加油日期</td>
	<td  width="4%">加油人</td>
	<td  width="10%">所属分公司</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="22%">备注</td>
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