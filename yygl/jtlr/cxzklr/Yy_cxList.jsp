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
	String yy_cx_zqs=null;
	String yy_cx_yy_cx_fgs=null;
	String yy_cx_yy_cxzjzk_qnpj=null;
	String yy_cx_yy_cxzjzk_bzzs=null;
	String yy_cx_yy_cxzpzq_qnpj=null;
	String yy_cx_yy_cxzpzq_bzzs=null;
	String yy_cx_yy_cxgcfx_qnpj=null;
	String yy_cx_yy_cxgcfx_bzzs=null;
	String yy_cx_yy_cxrlhj_qnpj=null;
	String yy_cx_yy_cxrlhj_bzzs=null;
	String yy_cx_yy_cx_lrsj=null;
	String yy_cx_lrr=null;
	yy_cx_zqs=request.getParameter("yy_cx_zqs");
	if (yy_cx_zqs!=null)
	{
		yy_cx_zqs=yy_cx_zqs.trim();
		if (!(yy_cx_zqs.equals("")))	wheresql+=" and (yy_cx.zqs="+yy_cx_zqs+") ";
	}
	yy_cx_yy_cx_fgs=request.getParameter("yy_cx_yy_cx_fgs");
	if (yy_cx_yy_cx_fgs!=null)
	{
		yy_cx_yy_cx_fgs=cf.GB2Uni(yy_cx_yy_cx_fgs);
		if (!(yy_cx_yy_cx_fgs.equals("")))	wheresql+=" and  (yy_cx.yy_cx_fgs='"+yy_cx_yy_cx_fgs+"')";
	}
	yy_cx_yy_cxzjzk_qnpj=request.getParameter("yy_cx_yy_cxzjzk_qnpj");
	if (yy_cx_yy_cxzjzk_qnpj!=null)
	{
		yy_cx_yy_cxzjzk_qnpj=yy_cx_yy_cxzjzk_qnpj.trim();
		if (!(yy_cx_yy_cxzjzk_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxzjzk_qnpj="+yy_cx_yy_cxzjzk_qnpj+") ";
	}
	yy_cx_yy_cxzjzk_bzzs=request.getParameter("yy_cx_yy_cxzjzk_bzzs");
	if (yy_cx_yy_cxzjzk_bzzs!=null)
	{
		yy_cx_yy_cxzjzk_bzzs=yy_cx_yy_cxzjzk_bzzs.trim();
		if (!(yy_cx_yy_cxzjzk_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxzjzk_bzzs="+yy_cx_yy_cxzjzk_bzzs+") ";
	}
	yy_cx_yy_cxzpzq_qnpj=request.getParameter("yy_cx_yy_cxzpzq_qnpj");
	if (yy_cx_yy_cxzpzq_qnpj!=null)
	{
		yy_cx_yy_cxzpzq_qnpj=yy_cx_yy_cxzpzq_qnpj.trim();
		if (!(yy_cx_yy_cxzpzq_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxzpzq_qnpj="+yy_cx_yy_cxzpzq_qnpj+") ";
	}
	yy_cx_yy_cxzpzq_bzzs=request.getParameter("yy_cx_yy_cxzpzq_bzzs");
	if (yy_cx_yy_cxzpzq_bzzs!=null)
	{
		yy_cx_yy_cxzpzq_bzzs=yy_cx_yy_cxzpzq_bzzs.trim();
		if (!(yy_cx_yy_cxzpzq_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxzpzq_bzzs="+yy_cx_yy_cxzpzq_bzzs+") ";
	}
	yy_cx_yy_cxgcfx_qnpj=request.getParameter("yy_cx_yy_cxgcfx_qnpj");
	if (yy_cx_yy_cxgcfx_qnpj!=null)
	{
		yy_cx_yy_cxgcfx_qnpj=yy_cx_yy_cxgcfx_qnpj.trim();
		if (!(yy_cx_yy_cxgcfx_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxgcfx_qnpj="+yy_cx_yy_cxgcfx_qnpj+") ";
	}
	yy_cx_yy_cxgcfx_bzzs=request.getParameter("yy_cx_yy_cxgcfx_bzzs");
	if (yy_cx_yy_cxgcfx_bzzs!=null)
	{
		yy_cx_yy_cxgcfx_bzzs=yy_cx_yy_cxgcfx_bzzs.trim();
		if (!(yy_cx_yy_cxgcfx_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxgcfx_bzzs="+yy_cx_yy_cxgcfx_bzzs+") ";
	}
	yy_cx_yy_cxrlhj_qnpj=request.getParameter("yy_cx_yy_cxrlhj_qnpj");
	if (yy_cx_yy_cxrlhj_qnpj!=null)
	{
		yy_cx_yy_cxrlhj_qnpj=yy_cx_yy_cxrlhj_qnpj.trim();
		if (!(yy_cx_yy_cxrlhj_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxrlhj_qnpj="+yy_cx_yy_cxrlhj_qnpj+") ";
	}
	yy_cx_yy_cxrlhj_bzzs=request.getParameter("yy_cx_yy_cxrlhj_bzzs");
	if (yy_cx_yy_cxrlhj_bzzs!=null)
	{
		yy_cx_yy_cxrlhj_bzzs=yy_cx_yy_cxrlhj_bzzs.trim();
		if (!(yy_cx_yy_cxrlhj_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxrlhj_bzzs="+yy_cx_yy_cxrlhj_bzzs+") ";
	}
	yy_cx_yy_cx_lrsj=request.getParameter("yy_cx_yy_cx_lrsj");
	if (yy_cx_yy_cx_lrsj!=null)
	{
		yy_cx_yy_cx_lrsj=yy_cx_yy_cx_lrsj.trim();
		if (!(yy_cx_yy_cx_lrsj.equals("")))	wheresql+="  and (yy_cx.yy_cx_lrsj>=TO_DATE('"+yy_cx_yy_cx_lrsj+"','YYYY/MM/DD'))";
	}
	yy_cx_yy_cx_lrsj=request.getParameter("yy_cx_yy_cx_lrsj2");
	if (yy_cx_yy_cx_lrsj!=null)
	{
		yy_cx_yy_cx_lrsj=yy_cx_yy_cx_lrsj.trim();
		if (!(yy_cx_yy_cx_lrsj.equals("")))	wheresql+="  and (yy_cx.yy_cx_lrsj<=TO_DATE('"+yy_cx_yy_cx_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_cx_lrr=request.getParameter("yy_cx_lrr");
	if (yy_cx_lrr!=null)
	{
		yy_cx_lrr=cf.GB2Uni(yy_cx_lrr);
		if (!(yy_cx_lrr.equals("")))	wheresql+=" and  (yy_cx.lrr='"+yy_cx_lrr+"')";
	}
	ls_sql="SELECT yy_cx.zqs,yy_cx.yy_cx_fgs,sq_dwxx.dwmc,yy_cx.yy_cxzjzk_qnpj||'%',yy_cx.yy_cxzjzk_bzzs||'%',yy_cx.yy_cxzpzq_qnpj||'%',yy_cx.yy_cxzpzq_bzzs||'%',yy_cx.yy_cxgcfx_qnpj||'%',yy_cx.yy_cxgcfx_bzzs||'%',yy_cx.yy_cxrlhj_qnpj||'%',yy_cx.yy_cxrlhj_bzzs||'%',yy_cx.yy_cx_lrsj,yy_cx.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_cx  ";
    ls_sql+=" where yy_cx.yy_cx_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_cx.zqs,yy_cx.yy_cx_fgs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_cxList.jsp","","","EditYy_cx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zqs","yy_cx_fgs","sq_dwxx_dwmc","yy_cx_yy_cxzjzk_qnpj","yy_cx_yy_cxzjzk_bzzs","yy_cx_yy_cxzpzq_qnpj","yy_cx_yy_cxzpzq_bzzs","yy_cx_yy_cxgcfx_qnpj","yy_cx_yy_cxgcfx_bzzs","yy_cx_yy_cxrlhj_qnpj","yy_cx_yy_cxrlhj_bzzs","yy_cx_yy_cx_lrsj","yy_cx_lrr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zqs","yy_cx_fgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yy_cxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from yy_cx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="6%">周期数</td>
	<td  width="6%">所属分公司</td>
	<td  width="10%">所属分公司</td>
	<td  width="7%">直接折扣去年平均(%)</td>
	<td  width="7%">直接折扣本周指数(%)</td>
	<td  width="7%">赠品赠券去年平均(%)</td>
	<td  width="7%">赠品赠券本周指数(%)</td>
	<td  width="7%">工程返现去年平均(%)</td>
	<td  width="7%">工程返现本周指数(%)</td>
	<td  width="7%">让利合计去年平均(%)</td>
	<td  width="7%">让利合计本周指数(%)</td>
	<td  width="8%">录入时间</td>
	<td  width="6%">录入人</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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