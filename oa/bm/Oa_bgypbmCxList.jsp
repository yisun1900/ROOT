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
	String oa_bgypbm_bgypbm=null;
	String oa_bgypbm_bgypmc=null;
	String oa_bgypbm_flbm=null;
	String oa_bgypbm_jldw=null;
	String oa_bgypbm_dj=null;
	String oa_bgypbm_pp=null;
	String oa_bgypbm_xh=null;
	String oa_bgypbm_ghs=null;
	
	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (oa_bgypbm.fgsbh='"+fgsbh+"')";
	}

	oa_bgypbm_bgypbm=request.getParameter("oa_bgypbm_bgypbm");
	if (oa_bgypbm_bgypbm!=null)
	{
		oa_bgypbm_bgypbm=cf.GB2Uni(oa_bgypbm_bgypbm);
		if (!(oa_bgypbm_bgypbm.equals("")))	wheresql+=" and  (oa_bgypbm.bgypbm='"+oa_bgypbm_bgypbm+"')";
	}
	oa_bgypbm_bgypmc=request.getParameter("oa_bgypbm_bgypmc");
	if (oa_bgypbm_bgypmc!=null)
	{
		oa_bgypbm_bgypmc=cf.GB2Uni(oa_bgypbm_bgypmc);
		if (!(oa_bgypbm_bgypmc.equals("")))	wheresql+=" and  (oa_bgypbm.bgypmc='"+oa_bgypbm_bgypmc+"')";
	}
	oa_bgypbm_flbm=request.getParameter("oa_bgypbm_flbm");
	if (oa_bgypbm_flbm!=null)
	{
		oa_bgypbm_flbm=cf.GB2Uni(oa_bgypbm_flbm);
		if (!(oa_bgypbm_flbm.equals("")))	wheresql+=" and  (oa_bgypbm.flbm='"+oa_bgypbm_flbm+"')";
	}
	oa_bgypbm_jldw=request.getParameter("oa_bgypbm_jldw");
	if (oa_bgypbm_jldw!=null)
	{
		oa_bgypbm_jldw=cf.GB2Uni(oa_bgypbm_jldw);
		if (!(oa_bgypbm_jldw.equals("")))	wheresql+=" and  (oa_bgypbm.jldw='"+oa_bgypbm_jldw+"')";
	}
	oa_bgypbm_dj=request.getParameter("oa_bgypbm_dj");
	if (oa_bgypbm_dj!=null)
	{
		oa_bgypbm_dj=oa_bgypbm_dj.trim();
		if (!(oa_bgypbm_dj.equals("")))	wheresql+=" and  (oa_bgypbm.dj="+oa_bgypbm_dj+") ";
	}
	oa_bgypbm_pp=request.getParameter("oa_bgypbm_pp");
	if (oa_bgypbm_pp!=null)
	{
		oa_bgypbm_pp=cf.GB2Uni(oa_bgypbm_pp);
		if (!(oa_bgypbm_pp.equals("")))	wheresql+=" and  (oa_bgypbm.pp='"+oa_bgypbm_pp+"')";
	}
	oa_bgypbm_xh=request.getParameter("oa_bgypbm_xh");
	if (oa_bgypbm_xh!=null)
	{
		oa_bgypbm_xh=cf.GB2Uni(oa_bgypbm_xh);
		if (!(oa_bgypbm_xh.equals("")))	wheresql+=" and  (oa_bgypbm.xh='"+oa_bgypbm_xh+"')";
	}
	oa_bgypbm_ghs=request.getParameter("oa_bgypbm_ghs");
	if (oa_bgypbm_ghs!=null)
	{
		oa_bgypbm_ghs=cf.GB2Uni(oa_bgypbm_ghs);
		if (!(oa_bgypbm_ghs.equals("")))	wheresql+=" and  (oa_bgypbm.ghs='"+oa_bgypbm_ghs+"')";
	}
	ls_sql="SELECT dwmc,oa_bgypbm.bgypbm,oa_bgypbm.bgypmc,oa_flbm.flmc,oa_bgypbm.jldw,oa_bgypbm.dj,oa_bgypbm.pp,oa_bgypbm.xh,oa_bgypbm.ghs  ";
	ls_sql+=" FROM oa_flbm,oa_bgypbm,sq_dwxx  ";
    ls_sql+=" where oa_bgypbm.flbm=oa_flbm.flbm and oa_bgypbm.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by oa_bgypbm.fgsbh,oa_bgypbm.bgypbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Oa_bgypbmCxList.jsp","SelectCxOa_bgypbm.jsp","","");
	pageObj.setPageRow(300);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"bgypbm","oa_bgypbm_bgypmc","oa_flbm_flmc","oa_bgypbm_jldw","oa_bgypbm_dj","oa_bgypbm_pp","oa_bgypbm_xh","oa_bgypbm_ghs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bgypbm"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">所属公司</td>
	<td  width="6%">编码</td>
	<td  width="19%">办公用品名称</td>
	<td  width="8%">办公用品分类</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">单价</td>
	<td  width="13%">品牌</td>
	<td  width="11%">型号</td>
	<td  width="17%">供货商</td>
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