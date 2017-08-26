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
	String jc_cgwjbj_wjbm=null;
	String jc_cgwjbj_wjmc=null;
	String jc_cgwjbj_wjlbbm=null;
	String jc_cgwjbj_xh=null;
	String jc_cgwjbj_gg=null;
	String jc_cgwjbj_jldw=null;
	String jc_cgwjbj_cptz=null;
	String jc_cgwjbj_cd=null;
	String jc_cgwjbj_lsj=null;
	String jc_cgwjbj_yhj=null;
	String jc_cgwjbj_dwbh=null;
	jc_cgwjbj_wjbm=request.getParameter("jc_cgwjbj_wjbm");
	if (jc_cgwjbj_wjbm!=null)
	{
		jc_cgwjbj_wjbm=cf.GB2Uni(jc_cgwjbj_wjbm);
		if (!(jc_cgwjbj_wjbm.equals("")))	wheresql+=" and  (jc_cgwjbj.wjbm='"+jc_cgwjbj_wjbm+"')";
	}
	jc_cgwjbj_wjmc=request.getParameter("jc_cgwjbj_wjmc");
	if (jc_cgwjbj_wjmc!=null)
	{
		jc_cgwjbj_wjmc=cf.GB2Uni(jc_cgwjbj_wjmc);
		if (!(jc_cgwjbj_wjmc.equals("")))	wheresql+=" and  (jc_cgwjbj.wjmc='"+jc_cgwjbj_wjmc+"')";
	}
	jc_cgwjbj_wjlbbm=request.getParameter("jc_cgwjbj_wjlbbm");
	if (jc_cgwjbj_wjlbbm!=null)
	{
		jc_cgwjbj_wjlbbm=cf.GB2Uni(jc_cgwjbj_wjlbbm);
		if (!(jc_cgwjbj_wjlbbm.equals("")))	wheresql+=" and  (jc_cgwjbj.wjlbbm='"+jc_cgwjbj_wjlbbm+"')";
	}
	jc_cgwjbj_xh=request.getParameter("jc_cgwjbj_xh");
	if (jc_cgwjbj_xh!=null)
	{
		jc_cgwjbj_xh=cf.GB2Uni(jc_cgwjbj_xh);
		if (!(jc_cgwjbj_xh.equals("")))	wheresql+=" and  (jc_cgwjbj.xh='"+jc_cgwjbj_xh+"')";
	}
	jc_cgwjbj_gg=request.getParameter("jc_cgwjbj_gg");
	if (jc_cgwjbj_gg!=null)
	{
		jc_cgwjbj_gg=cf.GB2Uni(jc_cgwjbj_gg);
		if (!(jc_cgwjbj_gg.equals("")))	wheresql+=" and  (jc_cgwjbj.gg='"+jc_cgwjbj_gg+"')";
	}
	jc_cgwjbj_jldw=request.getParameter("jc_cgwjbj_jldw");
	if (jc_cgwjbj_jldw!=null)
	{
		jc_cgwjbj_jldw=cf.GB2Uni(jc_cgwjbj_jldw);
		if (!(jc_cgwjbj_jldw.equals("")))	wheresql+=" and  (jc_cgwjbj.jldw='"+jc_cgwjbj_jldw+"')";
	}
	jc_cgwjbj_cptz=request.getParameter("jc_cgwjbj_cptz");
	if (jc_cgwjbj_cptz!=null)
	{
		jc_cgwjbj_cptz=cf.GB2Uni(jc_cgwjbj_cptz);
		if (!(jc_cgwjbj_cptz.equals("")))	wheresql+=" and  (jc_cgwjbj.cptz='"+jc_cgwjbj_cptz+"')";
	}
	jc_cgwjbj_cd=request.getParameter("jc_cgwjbj_cd");
	if (jc_cgwjbj_cd!=null)
	{
		jc_cgwjbj_cd=cf.GB2Uni(jc_cgwjbj_cd);
		if (!(jc_cgwjbj_cd.equals("")))	wheresql+=" and  (jc_cgwjbj.cd='"+jc_cgwjbj_cd+"')";
	}
	jc_cgwjbj_lsj=request.getParameter("jc_cgwjbj_lsj");
	if (jc_cgwjbj_lsj!=null)
	{
		jc_cgwjbj_lsj=jc_cgwjbj_lsj.trim();
		if (!(jc_cgwjbj_lsj.equals("")))	wheresql+=" and  (jc_cgwjbj.lsj="+jc_cgwjbj_lsj+") ";
	}
	jc_cgwjbj_yhj=request.getParameter("jc_cgwjbj_yhj");
	if (jc_cgwjbj_yhj!=null)
	{
		jc_cgwjbj_yhj=jc_cgwjbj_yhj.trim();
		if (!(jc_cgwjbj_yhj.equals("")))	wheresql+=" and  (jc_cgwjbj.yhj="+jc_cgwjbj_yhj+") ";
	}
	jc_cgwjbj_dwbh=request.getParameter("jc_cgwjbj_dwbh");
	if (jc_cgwjbj_dwbh!=null)
	{
		jc_cgwjbj_dwbh=cf.GB2Uni(jc_cgwjbj_dwbh);
		if (!(jc_cgwjbj_dwbh.equals("")))	wheresql+=" and  (jc_cgwjbj.dwbh='"+jc_cgwjbj_dwbh+"')";
	}
	ls_sql="SELECT jc_cgwjbj.wjbm,jc_cgwjbj.wjmc,jdm_wjlbbm.wjlbmc,jc_cgwjbj.xh,jc_cgwjbj.gg,jc_cgwjbj.jldw,jc_cgwjbj.cptz,jc_cgwjbj.cd,jc_cgwjbj.lsj,jc_cgwjbj.yhj,sq_dwxx.dwmc,jc_cgwjbj.zp,jc_cgwjbj.bz  ";
	ls_sql+=" FROM jc_cgwjbj,jdm_wjlbbm,sq_dwxx  ";
    ls_sql+=" where jc_cgwjbj.dwbh=sq_dwxx.dwbh and jc_cgwjbj.wjlbbm=jdm_wjlbbm.wjlbbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgwjbj.wjbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgwjbjCxList.jsp","SelectCxJc_cgwjbj.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"wjbm","jc_cgwjbj_wjmc","jdm_wjlbbm_wjlbmc","jc_cgwjbj_xh","jc_cgwjbj_gg","jc_cgwjbj_jldw","jc_cgwjbj_cptz","jc_cgwjbj_cd","jc_cgwjbj_lsj","jc_cgwjbj_yhj","sq_dwxx_dwmc","jc_cgwjbj_zp","jc_cgwjbj_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"wjbm"};
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">五金编码</td>
	<td  width="7%">五金名称</td>
	<td  width="7%">五金类别</td>
	<td  width="7%">型号</td>
	<td  width="7%">规格</td>
	<td  width="7%">计量单位</td>
	<td  width="12%">产品特征</td>
	<td  width="7%">产地</td>
	<td  width="7%">零售价</td>
	<td  width="7%">优惠价</td>
	<td  width="7%">生产厂家</td>
	<td  width="11%">照片</td>
	<td  width="7%">备注</td>
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