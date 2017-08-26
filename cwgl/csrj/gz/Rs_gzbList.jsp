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
	String rs_gzb_khzq=null;
	String rs_gzb_ssfgs=null;
	String rs_gzb_fxrq=null;
	String rs_gzb_ksrq=null;
	String rs_gzb_zzrq=null;
	String rs_gzb_qqts=null;
	String rs_gzb_lrr=null;
	String rs_gzb_lrsj=null;
	String rs_gzb_lrbm=null;
	rs_gzb_khzq=request.getParameter("rs_gzb_khzq");
	if (rs_gzb_khzq!=null)
	{
		rs_gzb_khzq=cf.GB2Uni(rs_gzb_khzq);
		if (!(rs_gzb_khzq.equals("")))	wheresql+=" and  (rs_gzb.khzq='"+rs_gzb_khzq+"')";
	}
	rs_gzb_ssfgs=request.getParameter("rs_gzb_ssfgs");
	if (rs_gzb_ssfgs!=null)
	{
		rs_gzb_ssfgs=cf.GB2Uni(rs_gzb_ssfgs);
		if (!(rs_gzb_ssfgs.equals("")))	wheresql+=" and  (rs_gzb.ssfgs='"+rs_gzb_ssfgs+"')";
	}
	rs_gzb_fxrq=request.getParameter("rs_gzb_fxrq");
	if (rs_gzb_fxrq!=null)
	{
		rs_gzb_fxrq=rs_gzb_fxrq.trim();
		if (!(rs_gzb_fxrq.equals("")))	wheresql+="  and (rs_gzb.fxrq=TO_DATE('"+rs_gzb_fxrq+"','YYYY/MM/DD'))";
	}
	rs_gzb_ksrq=request.getParameter("rs_gzb_ksrq");
	if (rs_gzb_ksrq!=null)
	{
		rs_gzb_ksrq=rs_gzb_ksrq.trim();
		if (!(rs_gzb_ksrq.equals("")))	wheresql+="  and (rs_gzb.ksrq=TO_DATE('"+rs_gzb_ksrq+"','YYYY/MM/DD'))";
	}
	rs_gzb_zzrq=request.getParameter("rs_gzb_zzrq");
	if (rs_gzb_zzrq!=null)
	{
		rs_gzb_zzrq=rs_gzb_zzrq.trim();
		if (!(rs_gzb_zzrq.equals("")))	wheresql+="  and (rs_gzb.zzrq=TO_DATE('"+rs_gzb_zzrq+"','YYYY/MM/DD'))";
	}
	rs_gzb_qqts=request.getParameter("rs_gzb_qqts");
	if (rs_gzb_qqts!=null)
	{
		rs_gzb_qqts=rs_gzb_qqts.trim();
		if (!(rs_gzb_qqts.equals("")))	wheresql+=" and  (rs_gzb.qqts="+rs_gzb_qqts+") ";
	}
	rs_gzb_lrr=request.getParameter("rs_gzb_lrr");
	if (rs_gzb_lrr!=null)
	{
		rs_gzb_lrr=cf.GB2Uni(rs_gzb_lrr);
		if (!(rs_gzb_lrr.equals("")))	wheresql+=" and  (rs_gzb.lrr='"+rs_gzb_lrr+"')";
	}
	rs_gzb_lrsj=request.getParameter("rs_gzb_lrsj");
	if (rs_gzb_lrsj!=null)
	{
		rs_gzb_lrsj=rs_gzb_lrsj.trim();
		if (!(rs_gzb_lrsj.equals("")))	wheresql+="  and (rs_gzb.lrsj=TO_DATE('"+rs_gzb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_gzb_lrbm=request.getParameter("rs_gzb_lrbm");
	if (rs_gzb_lrbm!=null)
	{
		rs_gzb_lrbm=cf.GB2Uni(rs_gzb_lrbm);
		if (!(rs_gzb_lrbm.equals("")))	wheresql+=" and  (rs_gzb.lrbm='"+rs_gzb_lrbm+"')";
	}
	ls_sql="SELECT rs_gzb.khzq,rs_gzb.ssfgs,sq_dwxx.dwmc,rs_gzb.fxrq,rs_gzb.ksrq,rs_gzb.zzrq,rs_gzb.qqts,rs_gzb.lrr,rs_gzb.lrsj,rs_gzb.lrbm,rs_gzb.bz  ";
	ls_sql+=" FROM sq_dwxx,rs_gzb  ";
    ls_sql+=" where rs_gzb.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_gzbList.jsp","","","EditRs_gzb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","ssfgs","sq_dwxx_dwmc","rs_gzb_fxrq","rs_gzb_ksrq","rs_gzb_zzrq","rs_gzb_qqts","rs_gzb_lrr","rs_gzb_lrsj","rs_gzb_lrbm","rs_gzb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khzq","ssfgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteRs_gzb.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from rs_ygzbjtzjl where "+chooseitem;
		sql[1]="delete from rs_gzb where "+chooseitem;
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
	<td  width="8%">考核周期</td>
	<td  width="8%">分公司</td>
	<td  width="10%">分公司</td>
	<td  width="8%">发薪日期</td>
	<td  width="8%">工资开始日期</td>
	<td  width="8%">工资终止日期</td>
	<td  width="8%">全勤天数</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="78%">备注</td>
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