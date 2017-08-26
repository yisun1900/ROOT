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
	String qh_fyb_sbxh=null;
	String qh_fyb_dwbh=null;
	String qh_fyb_sbrq=null;
	String qh_fyb_xxlybm=null;
	String qh_fyb_zl=null;
	String qh_fyb_sfjhn=null;
	String qh_fyb_htsfsp=null;
	qh_fyb_sbxh=request.getParameter("qh_fyb_sbxh");
	if (qh_fyb_sbxh!=null)
	{
		qh_fyb_sbxh=cf.GB2Uni(qh_fyb_sbxh);
		if (!(qh_fyb_sbxh.equals("")))	wheresql+=" and  (qh_fyb.sbxh='"+qh_fyb_sbxh+"')";
	}
	qh_fyb_dwbh=request.getParameter("qh_fyb_dwbh");
	if (qh_fyb_dwbh!=null)
	{
		qh_fyb_dwbh=cf.GB2Uni(qh_fyb_dwbh);
		if (!(qh_fyb_dwbh.equals("")))	wheresql+=" and  (qh_fyb.dwbh='"+qh_fyb_dwbh+"')";
	}
	qh_fyb_sbrq=request.getParameter("qh_fyb_sbrq");
	if (qh_fyb_sbrq!=null)
	{
		qh_fyb_sbrq=qh_fyb_sbrq.trim();
		if (!(qh_fyb_sbrq.equals("")))	wheresql+="  and (qh_fyb.sbrq>=TO_DATE('"+qh_fyb_sbrq+"','YYYY/MM/DD'))";
	}
	qh_fyb_sbrq=request.getParameter("qh_fyb_sbrq2");
	if (qh_fyb_sbrq!=null)
	{
		qh_fyb_sbrq=qh_fyb_sbrq.trim();
		if (!(qh_fyb_sbrq.equals("")))	wheresql+="  and (qh_fyb.sbrq<=TO_DATE('"+qh_fyb_sbrq+"','YYYY/MM/DD'))";
	}
	qh_fyb_xxlybm=request.getParameter("qh_fyb_xxlybm");
	if (qh_fyb_xxlybm!=null)
	{
		qh_fyb_xxlybm=cf.GB2Uni(qh_fyb_xxlybm);
		if (!(qh_fyb_xxlybm.equals("")))	wheresql+=" and  (qh_fyb.xxlybm='"+qh_fyb_xxlybm+"')";
	}
	qh_fyb_zl=request.getParameter("qh_fyb_zl");
	if (qh_fyb_zl!=null)
	{
		qh_fyb_zl=cf.GB2Uni(qh_fyb_zl);
		if (!(qh_fyb_zl.equals("")))	wheresql+=" and  (qh_fyb.zl='"+qh_fyb_zl+"')";
	}
	qh_fyb_sfjhn=request.getParameter("qh_fyb_sfjhn");
	if (qh_fyb_sfjhn!=null)
	{
		qh_fyb_sfjhn=cf.GB2Uni(qh_fyb_sfjhn);
		if (!(qh_fyb_sfjhn.equals("")))	wheresql+=" and  (qh_fyb.sfjhn='"+qh_fyb_sfjhn+"')";
	}
	qh_fyb_htsfsp=request.getParameter("qh_fyb_htsfsp");
	if (qh_fyb_htsfsp!=null)
	{
		qh_fyb_htsfsp=cf.GB2Uni(qh_fyb_htsfsp);
		if (!(qh_fyb_htsfsp.equals("")))	wheresql+=" and  (qh_fyb.htsfsp='"+qh_fyb_htsfsp+"')";
	}
	ls_sql="SELECT qh_fyb.sbxh as sbxh,qh_fyb.sbrq as qh_fyb_sbrq,sq_dwxx.dwmc as sq_dwxx_dwmc,dm_xxlybm.xxlymc as dm_xxlybm_xxlymc, qh_qhfyzlb.fyzlmc as qh_fyb_zl, DECODE(qh_fyb.sfjhn,'Y','是','N','否') as qh_fyb_sfjhn,qh_fyb.tfsj as qh_fyb_tfsj,qh_fyb.htfy as qh_fyb_htfy,qh_fyb.sjfy as qh_fyb_sjfy, DECODE(qh_fyb.htsfsp,'Y','是','N','否') as qh_fyb_htsfsp,qh_fyb.bz as qh_fyb_bz  ";
	ls_sql+=" FROM qh_fyb,sq_dwxx,dm_xxlybm,qh_qhfyzlb  ";
    ls_sql+=" where qh_fyb.dwbh=sq_dwxx.dwbh and qh_fyb.xxlybm=dm_xxlybm.xxlybm and qh_qhfyzlb.fyzldm=qh_fyb.zl";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Qh_fybList.jsp","SelectQh_fyb.jsp","ViewQh_fyb.jsp","EditQh_fyb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sbxh","qh_fyb_sbrq","qh_fyb_zl","qh_fyb_sfjhn","qh_fyb_tfsj","qh_fyb_htfy","qh_fyb_sjfy","qh_fyb_htsfsp","qh_fyb_bz","sq_dwxx_dwmc","dm_xxlybm_xxlymc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sbxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Qh_fybList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] sbxh = request.getParameterValues("sbxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sbxh,"sbxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from qh_fyb where "+chooseitem;
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
	<td  width="8%">上报序号</td>
	<td  width="8%">申报日期</td>
	<td  width="8%">单位名称</td>
	<td  width="8%">费用媒体	</td>
	<td  width="8%">种类</td>
	<td  width="8%">是否计划内</td>
	<td  width="8%">投放时间</td>
	<td  width="8%">合同费用</td>
	<td  width="8%">实际费用</td>
	<td  width="8%">合同是否审批</td>
	<td  width="8%">备注</td>
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