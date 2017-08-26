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
	String jc_tmbj_tmbm=null;
	String jc_tmbj_tmmc=null;
	String jc_tmbj_tmxlbm=null;
	String jc_tmbj_xh=null;
	String jc_tmbj_ymjg=null;
	String jc_tmbj_pmjg=null;
	String jc_tmbj_ppbm=null;
	jc_tmbj_tmbm=request.getParameter("jc_tmbj_tmbm");
	if (jc_tmbj_tmbm!=null)
	{
		jc_tmbj_tmbm=cf.GB2Uni(jc_tmbj_tmbm);
		if (!(jc_tmbj_tmbm.equals("")))	wheresql+=" and  (jc_tmbj.tmbm='"+jc_tmbj_tmbm+"')";
	}
	jc_tmbj_tmmc=request.getParameter("jc_tmbj_tmmc");
	if (jc_tmbj_tmmc!=null)
	{
		jc_tmbj_tmmc=cf.GB2Uni(jc_tmbj_tmmc);
		if (!(jc_tmbj_tmmc.equals("")))	wheresql+=" and  (jc_tmbj.tmmc='"+jc_tmbj_tmmc+"')";
	}
	jc_tmbj_tmxlbm=request.getParameter("jc_tmbj_tmxlbm");
	if (jc_tmbj_tmxlbm!=null)
	{
		jc_tmbj_tmxlbm=cf.GB2Uni(jc_tmbj_tmxlbm);
		if (!(jc_tmbj_tmxlbm.equals("")))	wheresql+=" and  (jc_tmbj.tmxlbm='"+jc_tmbj_tmxlbm+"')";
	}
	jc_tmbj_xh=request.getParameter("jc_tmbj_xh");
	if (jc_tmbj_xh!=null)
	{
		jc_tmbj_xh=cf.GB2Uni(jc_tmbj_xh);
		if (!(jc_tmbj_xh.equals("")))	wheresql+=" and  (jc_tmbj.xh='"+jc_tmbj_xh+"')";
	}
	jc_tmbj_ymjg=request.getParameter("jc_tmbj_ymjg");
	if (jc_tmbj_ymjg!=null)
	{
		jc_tmbj_ymjg=jc_tmbj_ymjg.trim();
		if (!(jc_tmbj_ymjg.equals("")))	wheresql+=" and  (jc_tmbj.ymjg="+jc_tmbj_ymjg+") ";
	}
	jc_tmbj_pmjg=request.getParameter("jc_tmbj_pmjg");
	if (jc_tmbj_pmjg!=null)
	{
		jc_tmbj_pmjg=jc_tmbj_pmjg.trim();
		if (!(jc_tmbj_pmjg.equals("")))	wheresql+=" and  (jc_tmbj.pmjg="+jc_tmbj_pmjg+") ";
	}
	jc_tmbj_ppbm=request.getParameter("jc_tmbj_ppbm");
	if (jc_tmbj_ppbm!=null)
	{
		jc_tmbj_ppbm=cf.GB2Uni(jc_tmbj_ppbm);
		if (!(jc_tmbj_ppbm.equals("")))	wheresql+=" and  (jc_tmbj.ppbm='"+jc_tmbj_ppbm+"')";
	}
	ls_sql="SELECT ppmc,tmxlmc,jc_tmbj.tmbm,jc_tmbj.tmmc,jc_tmbj.xh,jc_tmbj.ymjg,jc_tmbj.pmjg,jc_tmbj.zp,jc_tmbj.bz  ";
	ls_sql+=" FROM jc_tmbj,jdm_tmxlbm,jdm_ppbm  ";
    ls_sql+=" where jc_tmbj.tmxlbm=jdm_tmxlbm.tmxlbm and jc_tmbj.ppbm=jdm_ppbm.ppbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_tmbj.ppbm,jc_tmbj.tmxlbm,jc_tmbj.tmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_tmbjList.jsp","SelectJc_tmbj.jsp","","EditJc_tmbj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tmbm","jc_tmbj_tmmc","jdm_tmxlbm_tmxlmc","jc_tmbj_xh","jc_tmbj_ymjg","jc_tmbj_pmjg","sq_dwxx_dwmc","jc_tmbj_zp","jc_tmbj_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_tmbjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
	spanColHash.put("tmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	String[] tmbm = request.getParameterValues("tmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tmbm,"tmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_tmbj where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="9%">品牌</td>
	<td  width="16%">台面系列</td>
	<td  width="9%">台面编码</td>
	<td  width="11%">台面名称</td>
	<td  width="9%">型号</td>
	<td  width="9%">延米价格</td>
	<td  width="9%">平米价格</td>
	<td  width="13%">照片</td>
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