<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String qh_lfcxdjb_zpnr=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_sjs=null;
	String qh_lfcxdjb_djrq=null;
	qh_lfcxdjb_zpnr=request.getParameter("qh_lfcxdjb_zpnr");
	if (qh_lfcxdjb_zpnr!=null)
	{
		qh_lfcxdjb_zpnr=cf.GB2Uni(qh_lfcxdjb_zpnr);
		if (!(qh_lfcxdjb_zpnr.equals("")))	wheresql+=" and  (qh_lfcxdjb.zpnr='"+qh_lfcxdjb_zpnr+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq>=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq2");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq<=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
		 if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+=" and (1=1)";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (sq_dwxx.ssdw='"+ssfgs+"')";
	 }
	 else
	 {
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"')";
	 }
	ls_sql="SELECT qh_lfcxdjb.djxh as djxh,qh_lfcxdjb.djrq as qh_lfcxdjb_djrq,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,qh_lfcxdjb.zpnr as qh_lfcxdjb_zpnr,crm_zxkhxx.sjs as crm_zxkhxx_sjs,qh_lfcxdjb.jsr as qh_lfcxdjb_jsr,qh_lfcxdjb.bz as qh_lfcxdjb_bz   ";
	ls_sql+=" FROM crm_zxkhxx,qh_lfcxdjb,sq_dwxx  ";
    ls_sql+=" where qh_lfcxdjb.khbh=crm_zxkhxx.khbh and (sq_dwxx.dwbh(+)=crm_zxkhxx.zxdm)";
    ls_sql+=wheresql;
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Qh_lfcxdjb1List.jsp","SelectQh_lfcxdjb1.jsp","ViewQh_lfcxdjb1.jsp","EditQh_lfcxdjb1.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djxh","qh_lfcxdjb_khbh","qh_lfcxdjb_zpnr","qh_lfcxdjb_jsr","crm_zxkhxx_khxm","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","qh_lfcxdjb_djrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Qh_lfcxdjb1List.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] djxh = request.getParameterValues("djxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(djxh,"djxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from qh_lfcxdjb where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="11%">登记序号</td>
	<td  width="11%">登记日期</td>
	<td  width="11%">客户姓名</td>
	<td  width="11%">联系方式</td>	
	<td  width="11%">赠品内容</td>
	<td  width="11%">设计师</td>
	<td  width="11%">经手人</td>
	<td  width="15%">备注</td>
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