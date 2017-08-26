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
	String blxhbm=null;
	String blxh=null;
	String jg=null;
	String bllxbm=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_blbj.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_blbj.dqbm='"+dqbm+"')";

	bllxbm=request.getParameter("bllxbm");
	if (bllxbm!=null)
	{
		if (!(bllxbm.equals("")))	wheresql+=" and  (jc_blbj.bllxbm='"+bllxbm+"')";
	}
	String blytbm=null;
	blytbm=request.getParameter("blytbm");
	if (blytbm!=null)
	{
		if (!(blytbm.equals("")))	wheresql+=" and  (jc_blbj.blytbm='"+blytbm+"')";
	}
	blxhbm=request.getParameter("blxhbm");
	if (blxhbm!=null)
	{
		blxhbm=cf.GB2Uni(blxhbm);
		if (!(blxhbm.equals("")))	wheresql+=" and  (blxhbm='"+blxhbm+"')";
	}
	blxh=request.getParameter("blxh");
	if (blxh!=null)
	{
		blxh=cf.GB2Uni(blxh);
		if (!(blxh.equals("")))	wheresql+=" and  (blxh='"+blxh+"')";
	}
	jg=request.getParameter("jg");
	if (jg!=null)
	{
		jg=jg.trim();
		if (!(jg.equals("")))	wheresql+=" and  (jg="+jg+") ";
	}
	ls_sql="SELECT blxhbm,blxh,bllxmc,blyt,jg,'<IMG SRC=\"/jcjj/bl/images/'||UPPER(zp)||'\" height=100>' zp,jc_blbj.bz,jc_blbj.lrr,jc_blbj.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jc_blbj,jdm_bllxbm,jdm_blytbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_blbj.bllxbm=jdm_bllxbm.bllxbm(+) and jc_blbj.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blbj.dqbm=dm_dqbm.dqbm(+) and jc_blbj.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_blbj.dqbm,blxhbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_blbjCxList.jsp","SelectCxJc_blbj.jsp","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"blxhbm","blxh","jg","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"blxhbm"};
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">玻璃型号编码</td>
	<td  width="14%">玻璃名称</td>
	<td  width="9%">玻璃类型</td>
	<td  width="9%">玻璃用途</td>
	<td  width="7%">价格</td>
	<td  width="12%">照片</td>
	<td  width="16%">备注</td>
	<td  width="6%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="9%">录入部门</td>
	<td  width="5%">所属地区</td>
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