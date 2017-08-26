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
	String jc_mmxhb_mmxh=null;
	String jc_mmxhb_mxbm=null;
	String jc_mmxhb_mytbm=null;
	String jc_mmxhb_zp=null;
	String jc_mmxhb_bz=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mmxhb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mmxhb.dqbm='"+dqbm+"')";

	String bzjg=null;
	bzjg=request.getParameter("bzjg");
	if (bzjg!=null)
	{
		if (!(bzjg.equals("")))	wheresql+=" and  (jc_mmxhb.bzjg>="+bzjg+")";
	}
	bzjg=request.getParameter("bzjg2");
	if (bzjg!=null)
	{
		if (!(bzjg.equals("")))	wheresql+=" and  (jc_mmxhb.bzjg<="+bzjg+")";
	}
	  
   	jc_mmxhb_mmxh=request.getParameter("jc_mmxhb_mmxh");
	if (jc_mmxhb_mmxh!=null)
	{
		jc_mmxhb_mmxh=cf.GB2Uni(jc_mmxhb_mmxh);
		if (!(jc_mmxhb_mmxh.equals("")))	wheresql+=" and  (jc_mmxhb.mmxh='"+jc_mmxhb_mmxh+"')";
	}
	jc_mmxhb_mxbm=request.getParameter("jc_mmxhb_mxbm");
	if (jc_mmxhb_mxbm!=null)
	{
		jc_mmxhb_mxbm=cf.GB2Uni(jc_mmxhb_mxbm);
		if (!(jc_mmxhb_mxbm.equals("")))	wheresql+=" and  (jc_mmxhb.mxbm='"+jc_mmxhb_mxbm+"')";
	}
	jc_mmxhb_mytbm=request.getParameter("jc_mmxhb_mytbm");
	if (jc_mmxhb_mytbm!=null)
	{
		jc_mmxhb_mytbm=cf.GB2Uni(jc_mmxhb_mytbm);
		if (!(jc_mmxhb_mytbm.equals("")))	wheresql+=" and  (jc_mmxhb.mytbm='"+jc_mmxhb_mytbm+"')";
	}
	jc_mmxhb_zp=request.getParameter("jc_mmxhb_zp");
	if (jc_mmxhb_zp!=null)
	{
		jc_mmxhb_zp=cf.GB2Uni(jc_mmxhb_zp);
		if (!(jc_mmxhb_zp.equals("")))	wheresql+=" and  (jc_mmxhb.zp='"+jc_mmxhb_zp+"')";
	}
	jc_mmxhb_bz=request.getParameter("jc_mmxhb_bz");
	if (jc_mmxhb_bz!=null)
	{
		jc_mmxhb_bz=cf.GB2Uni(jc_mmxhb_bz);
		if (!(jc_mmxhb_bz.equals("")))	wheresql+=" and  (jc_mmxhb.bz='"+jc_mmxhb_bz+"')";
	}
	ls_sql="SELECT jc_mmxhb.mmxh,jdm_mxbm.mxmc,jdm_mytbm.myt,bzjg,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>' zp,jc_mmxhb.bz,jc_mmxhb.lrr,jc_mmxhb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jc_mmxhb,jdm_mytbm,jdm_mxbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mmxhb.mytbm=jdm_mytbm.mytbm(+) and jc_mmxhb.mxbm=jdm_mxbm.mxbm(+)";
    ls_sql+=" and jc_mmxhb.dqbm=dm_dqbm.dqbm(+) and jc_mmxhb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmxhb.dqbm,jc_mmxhb.mmxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmxhbCxList.jsp","SelectCxJc_mmxhb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"mmxh","jdm_mxbm_mxmc","jdm_mytbm_msylxmc","jc_mmxhb_zp","jc_mmxhb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"mmxh"};
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
	<td  width="8%">木门型号</td>
	<td  width="13%">门型</td>
	<td  width="8%">门用途</td>
	<td  width="8%">标准价格</td>
	<td  width="13%">照片</td>
	<td  width="16%">备注</td>
	<td  width="7%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="12%">录入部门</td>
	<td  width="7%">所属地区</td>
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