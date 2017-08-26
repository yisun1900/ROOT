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
	String jc_cpjjbj_cpjjbh=null;
	String jc_cpjjbj_cpjjfg=null;
	String jc_cpjjbj_cpjjmc=null;
	String jc_cpjjbj_xh=null;
	String jc_cpjjbj_gg=null;
	String jc_cpjjbj_cpjjxl=null;
	String jc_cpjjbj_cpjjcz=null;
	String jc_cpjjbj_dj=null;
	String jc_cpjjbj_cktp=null;
	String jc_cpjjbj_cptp=null;
	String jc_cpjjbj_dqbm=null;
	jc_cpjjbj_cpjjbh=request.getParameter("jc_cpjjbj_cpjjbh");
	if (jc_cpjjbj_cpjjbh!=null)
	{
		jc_cpjjbj_cpjjbh=cf.GB2Uni(jc_cpjjbj_cpjjbh);
		if (!(jc_cpjjbj_cpjjbh.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjbh='"+jc_cpjjbj_cpjjbh+"')";
	}
	jc_cpjjbj_cpjjfg=request.getParameter("jc_cpjjbj_cpjjfg");
	if (jc_cpjjbj_cpjjfg!=null)
	{
		jc_cpjjbj_cpjjfg=cf.GB2Uni(jc_cpjjbj_cpjjfg);
		if (!(jc_cpjjbj_cpjjfg.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjfg='"+jc_cpjjbj_cpjjfg+"')";
	}
	jc_cpjjbj_cpjjmc=request.getParameter("jc_cpjjbj_cpjjmc");
	if (jc_cpjjbj_cpjjmc!=null)
	{
		jc_cpjjbj_cpjjmc=cf.GB2Uni(jc_cpjjbj_cpjjmc);
		if (!(jc_cpjjbj_cpjjmc.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjmc='"+jc_cpjjbj_cpjjmc+"')";
	}
	jc_cpjjbj_xh=request.getParameter("jc_cpjjbj_xh");
	if (jc_cpjjbj_xh!=null)
	{
		jc_cpjjbj_xh=cf.GB2Uni(jc_cpjjbj_xh);
		if (!(jc_cpjjbj_xh.equals("")))	wheresql+=" and  (jc_cpjjbj.xh='"+jc_cpjjbj_xh+"')";
	}
	jc_cpjjbj_gg=request.getParameter("jc_cpjjbj_gg");
	if (jc_cpjjbj_gg!=null)
	{
		jc_cpjjbj_gg=cf.GB2Uni(jc_cpjjbj_gg);
		if (!(jc_cpjjbj_gg.equals("")))	wheresql+=" and  (jc_cpjjbj.gg='"+jc_cpjjbj_gg+"')";
	}
	jc_cpjjbj_cpjjxl=request.getParameter("jc_cpjjbj_cpjjxl");
	if (jc_cpjjbj_cpjjxl!=null)
	{
		jc_cpjjbj_cpjjxl=cf.GB2Uni(jc_cpjjbj_cpjjxl);
		if (!(jc_cpjjbj_cpjjxl.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjxl='"+jc_cpjjbj_cpjjxl+"')";
	}
	jc_cpjjbj_cpjjcz=request.getParameter("jc_cpjjbj_cpjjcz");
	if (jc_cpjjbj_cpjjcz!=null)
	{
		jc_cpjjbj_cpjjcz=cf.GB2Uni(jc_cpjjbj_cpjjcz);
		if (!(jc_cpjjbj_cpjjcz.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjcz='"+jc_cpjjbj_cpjjcz+"')";
	}
	jc_cpjjbj_dj=request.getParameter("jc_cpjjbj_dj");
	if (jc_cpjjbj_dj!=null)
	{
		jc_cpjjbj_dj=jc_cpjjbj_dj.trim();
		if (!(jc_cpjjbj_dj.equals("")))	wheresql+=" and  (jc_cpjjbj.dj="+jc_cpjjbj_dj+") ";
	}
	jc_cpjjbj_cktp=request.getParameter("jc_cpjjbj_cktp");
	if (jc_cpjjbj_cktp!=null)
	{
		jc_cpjjbj_cktp=cf.GB2Uni(jc_cpjjbj_cktp);
		if (!(jc_cpjjbj_cktp.equals("")))	wheresql+=" and  (jc_cpjjbj.cktp='"+jc_cpjjbj_cktp+"')";
	}
	jc_cpjjbj_cptp=request.getParameter("jc_cpjjbj_cptp");
	if (jc_cpjjbj_cptp!=null)
	{
		jc_cpjjbj_cptp=cf.GB2Uni(jc_cpjjbj_cptp);
		if (!(jc_cpjjbj_cptp.equals("")))	wheresql+=" and  (jc_cpjjbj.cptp='"+jc_cpjjbj_cptp+"')";
	}
	jc_cpjjbj_dqbm=request.getParameter("jc_cpjjbj_dqbm");
	if (jc_cpjjbj_dqbm!=null)
	{
		jc_cpjjbj_dqbm=cf.GB2Uni(jc_cpjjbj_dqbm);
		if (!(jc_cpjjbj_dqbm.equals("")))	wheresql+=" and  (jc_cpjjbj.dqbm='"+jc_cpjjbj_dqbm+"')";
	}

	String myxssl=request.getParameter("myxssl");
	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String ordersql=null;
	if (jgpx1.equals(""))
	{
		ordersql=" order by jc_cpjjbj.cpjjfg,jc_cpjjbj.xh,jc_cpjjbj.gg,jc_cpjjbj.cpjjcz,jc_cpjjbj.cpjjbh";
	}
	else{
		ordersql=" order by "+jgpx1;
	}

	ls_sql="SELECT jc_cpjjbj.cpjjfg,jc_cpjjbj.cpjjxl,jc_cpjjbj.cpjjmc,jc_cpjjbj.xh,jc_cpjjbj.gg,jc_cpjjbj.cpjjcz,jc_cpjjbj.dj,jc_cpjjbj.cpjjbh,jc_cpjjbj.cpsm,jc_cpjjbj.bz,dm_dqbm.dqmc,'<IMG SRC=\"/jcjj/jjbj/cpjjbj/images/'||UPPER(jc_cpjjbj.cktp)||'\" >'  cktp,'<IMG SRC=\"/jcjj/jjbj/cpjjbj/images/'||UPPER(jc_cpjjbj.cptp)||'\" >' cptp,jc_cpjjbj.lrr,jc_cpjjbj.lrsj  ";
	ls_sql+=" FROM jc_cpjjbj,dm_dqbm  ";
    ls_sql+=" where jc_cpjjbj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cpjjbjCxList.jsp","SelectCxJc_cpjjbj.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"cpjjbh","jc_cpjjbj_cpjjfg","jc_cpjjbj_cpjjmc","jc_cpjjbj_xh","jc_cpjjbj_gg","jc_cpjjbj_cpjjxl","jc_cpjjbj_cpjjcz","jc_cpjjbj_dj","jc_cpjjbj_cktp","jc_cpjjbj_cptp","jc_cpjjbj_cpsm","dm_dqbm_dwmc","jc_cpjjbj_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[8]="align='left'";
	pageObj.alignStr[9]="align='left'";

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpjjfg","1");//列参数对象加入Hash表
	spanColHash.put("cpjjxl","1");//列参数对象加入Hash表
	spanColHash.put("cpjjmc","1");//列参数对象加入Hash表
	spanColHash.put("xh","2");//列参数对象加入Hash表
	spanColHash.put("gg","1");//列参数对象加入Hash表
	spanColHash.put("cpsm","2");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("cktp","2");//列参数对象加入Hash表
	spanColHash.put("cptp","2");//列参数对象加入Hash表
	spanColHash.put("lrr","1");//列参数对象加入Hash表
	spanColHash.put("lrsj","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">风格</td>
	<td  width="5%">系列名称</td>
	<td  width="5%">名称</td>
	<td  width="4%">型号</td>
	<td  width="6%">规格</td>
	<td  width="7%">材质</td>
	<td  width="3%">单价</td>
	<td  width="2%">成品家具编号</td>
	<td  width="20%">产品说明</td>
	<td  width="7%">备注</td>
	<td  width="4%">地区</td>
	<td  width="13%">参考图片</td>
	<td  width="9%">产品图片</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
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