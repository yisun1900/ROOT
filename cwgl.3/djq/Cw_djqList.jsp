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
	String cw_djq_fgsbh=null;
	String cw_djq_djqmc=null;
	String cw_djq_djqcdbl=null;
	String cw_djq_bz=null;
	cw_djq_fgsbh=request.getParameter("cw_djq_fgsbh");
	if (cw_djq_fgsbh!=null)
	{
		cw_djq_fgsbh=cf.GB2Uni(cw_djq_fgsbh);
		if (!(cw_djq_fgsbh.equals("")))	wheresql+=" and  (cw_djq.fgsbh='"+cw_djq_fgsbh+"')";
	}
	cw_djq_djqmc=request.getParameter("cw_djq_djqmc");
	if (cw_djq_djqmc!=null)
	{
		cw_djq_djqmc=cf.GB2Uni(cw_djq_djqmc);
		if (!(cw_djq_djqmc.equals("")))	wheresql+=" and  (cw_djq.djqmc='"+cw_djq_djqmc+"')";
	}
	cw_djq_djqcdbl=request.getParameter("cw_djq_djqcdbl");
	if (cw_djq_djqcdbl!=null)
	{
		cw_djq_djqcdbl=cw_djq_djqcdbl.trim();
		if (!(cw_djq_djqcdbl.equals("")))	wheresql+=" and  (cw_djq.djqcdbl="+cw_djq_djqcdbl+") ";
	}
	cw_djq_bz=request.getParameter("cw_djq_bz");
	if (cw_djq_bz!=null)
	{
		cw_djq_bz=cf.GB2Uni(cw_djq_bz);
		if (!(cw_djq_bz.equals("")))	wheresql+=" and  (cw_djq.bz='"+cw_djq_bz+"')";
	}
	ls_sql="SELECT cw_djq.fgsbh,sq_dwxx.dwmc,cw_djq.djqmc,cw_djq.djqcdbl,cw_djq.bz  ";
	ls_sql+=" FROM sq_dwxx,cw_djq  ";
    ls_sql+=" where cw_djq.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_djq.fgsbh,cw_djq.djqmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_djqList.jsp","","","EditCw_djq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fgsbh","sq_dwxx_dwmc","djqmc","cw_djq_djqcdbl","cw_djq_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fgsbh","djqmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_djqList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_djq where "+chooseitem;
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
	<td  width="12%">分公司</td>
	<td  width="17%">分公司</td>
	<td  width="30%">代金券名称</td>
	<td  width="10%">代金券厂家承担比例</td>
	<td  width="67%">备注</td>
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