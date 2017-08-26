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
	String dm_xqbm_xqbm=null;
	String dm_xqbm_xqmc=null;
	String dm_xqbm_cqbm=null;
	String dm_xqbm_dqbm=null;
	String dm_xqbm_yhdlm=null;
	String dm_xqbm_kfs=null;
	String dm_xqbm_sldh=null;
	String dm_xqbm_mpmjj=null;
	String dm_xqbm_rzsj=null;
	dm_xqbm_xqbm=request.getParameter("dm_xqbm_xqbm");
	if (dm_xqbm_xqbm!=null)
	{
		dm_xqbm_xqbm=cf.GB2Uni(dm_xqbm_xqbm);
		if (!(dm_xqbm_xqbm.equals("")))	wheresql+=" and  (dm_xqbm.xqbm='"+dm_xqbm_xqbm+"')";
	}
	dm_xqbm_xqmc=request.getParameter("dm_xqbm_xqmc");
	if (dm_xqbm_xqmc!=null)
	{
		dm_xqbm_xqmc=cf.GB2Uni(dm_xqbm_xqmc);
		if (!(dm_xqbm_xqmc.equals("")))	wheresql+=" and  (dm_xqbm.xqmc='"+dm_xqbm_xqmc+"')";
	}
	dm_xqbm_cqbm=request.getParameter("dm_xqbm_cqbm");
	if (dm_xqbm_cqbm!=null)
	{
		dm_xqbm_cqbm=cf.GB2Uni(dm_xqbm_cqbm);
		if (!(dm_xqbm_cqbm.equals("")))	wheresql+=" and  (dm_xqbm.cqbm='"+dm_xqbm_cqbm+"')";
	}
	dm_xqbm_dqbm=request.getParameter("dm_xqbm_dqbm");
	if (dm_xqbm_dqbm!=null)
	{
		dm_xqbm_dqbm=cf.GB2Uni(dm_xqbm_dqbm);
		if (!(dm_xqbm_dqbm.equals("")))	wheresql+=" and  (dm_xqbm.dqbm='"+dm_xqbm_dqbm+"')";
	}
	dm_xqbm_yhdlm=request.getParameter("dm_xqbm_yhdlm");
	if (dm_xqbm_yhdlm!=null)
	{
		dm_xqbm_yhdlm=cf.GB2Uni(dm_xqbm_yhdlm);
		if (!(dm_xqbm_yhdlm.equals("")))	wheresql+=" and  (dm_xqbm.yhdlm='"+dm_xqbm_yhdlm+"')";
	}
	dm_xqbm_kfs=request.getParameter("dm_xqbm_kfs");
	if (dm_xqbm_kfs!=null)
	{
		dm_xqbm_kfs=cf.GB2Uni(dm_xqbm_kfs);
		if (!(dm_xqbm_kfs.equals("")))	wheresql+=" and  (dm_xqbm.kfs like '%"+dm_xqbm_kfs+"%')";
	}
	dm_xqbm_sldh=request.getParameter("dm_xqbm_sldh");
	if (dm_xqbm_sldh!=null)
	{
		dm_xqbm_sldh=cf.GB2Uni(dm_xqbm_sldh);
		if (!(dm_xqbm_sldh.equals("")))	wheresql+=" and  (dm_xqbm.sldh like '%"+dm_xqbm_sldh+"%')";
	}
	dm_xqbm_mpmjj=request.getParameter("dm_xqbm_mpmjj");
	if (dm_xqbm_mpmjj!=null)
	{
		dm_xqbm_mpmjj=dm_xqbm_mpmjj.trim();
		if (!(dm_xqbm_mpmjj.equals("")))	wheresql+=" and (dm_xqbm.mpmjj>="+dm_xqbm_mpmjj+") ";
	}
	dm_xqbm_mpmjj=request.getParameter("dm_xqbm_mpmjj2");
	if (dm_xqbm_mpmjj!=null)
	{
		dm_xqbm_mpmjj=dm_xqbm_mpmjj.trim();
		if (!(dm_xqbm_mpmjj.equals("")))	wheresql+=" and (dm_xqbm.mpmjj<="+dm_xqbm_mpmjj+") ";
	}
	dm_xqbm_rzsj=request.getParameter("dm_xqbm_rzsj");
	if (dm_xqbm_rzsj!=null)
	{
		dm_xqbm_rzsj=dm_xqbm_rzsj.trim();
		if (!(dm_xqbm_rzsj.equals("")))	wheresql+="  and (dm_xqbm.rzsj>=TO_DATE('"+dm_xqbm_rzsj+"','YYYY/MM/DD'))";
	}
	dm_xqbm_rzsj=request.getParameter("dm_xqbm_rzsj2");
	if (dm_xqbm_rzsj!=null)
	{
		dm_xqbm_rzsj=dm_xqbm_rzsj.trim();
		if (!(dm_xqbm_rzsj.equals("")))	wheresql+="  and (dm_xqbm.rzsj<=TO_DATE('"+dm_xqbm_rzsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT dm_xqbm.xqbm,dm_xqbm.xqmc,dm_xqbm.cqbm,dm_cqbm.cqmc,dm_xqbm.dqbm,dm_dqbm.dqmc,dm_xqbm.yhdlm,dm_xqbm.kfs,dm_xqbm.sldh,dm_xqbm.mpmjj,dm_xqbm.rzsj,dm_xqbm.bz  ";
	ls_sql+=" FROM dm_cqbm,dm_dqbm,dm_xqbm  ";
    ls_sql+=" where dm_xqbm.dqbm=dm_dqbm.dqbm and dm_xqbm.cqbm=dm_cqbm.cqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_xqbm.dqbm,dm_xqbm.cqbm,dm_xqbm.xqbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_xqbmCxList.jsp","SelectCxDm_xqbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xqbm","dm_xqbm_xqmc","dm_xqbm_cqbm","dm_cqbm_cqmc","dm_xqbm_dqbm","dm_dqbm_dqmc","dm_xqbm_yhdlm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xqbm"};
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">小区编码</td>
	<td  width="12%">小区名称</td>
	<td  width="5%">城区编码</td>
	<td  width="7%">城区名称</td>
	<td  width="5%">地区编码</td>
	<td  width="7%">地区名称</td>
	<td  width="5%">用户登陆名</td>
	<td  width="14%">开发商</td>
	<td  width="16%">售楼电话</td>
	<td  width="5%">每平米均价</td>
	<td  width="7%">入住时间</td>
	<td  width="12%">备注</td>
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