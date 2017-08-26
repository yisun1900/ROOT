<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;


	ls_sql="SELECT crm_htshmx.khbh as khbh,crm_htshmx.shxmbm as shxmbm,dm_shxmbm.shxmmc as dm_shxmbm_shxmmc,dm_shxmdlbm.shxmdlmc as dm_shxmdlbm_shxmdlmc,dm_shxmxlbm.shxmxlmc as dm_shxmxlbm_shxmxlmc,crm_htshmx.bhgsl as crm_htshmx_bhgsl,TO_CHAR(crm_htshmx.kf) as crm_htshmx_kf,crm_htshmx.bhgsl*crm_htshmx.kf zf ";
	ls_sql+=" FROM dm_shxmxlbm,dm_shxmdlbm,dm_shxmbm,crm_htshmx  ";
    ls_sql+=" where dm_shxmbm.shxmxlbm=dm_shxmxlbm.shxmxlbm and dm_shxmbm.shxmdlbm=dm_shxmdlbm.shxmdlbm and  crm_htshmx.shxmbm=dm_shxmbm.shxmbm";
    ls_sql+=" and crm_htshmx.khbh='"+khbh+"'";
    ls_sql+=" order by dm_shxmbm.shxmdlbm,dm_shxmbm.shxmxlbm,crm_htshmx.shxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_htshmxList.jsp?khbh="+khbh,"","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"dm_shxmdlbm_shxmdlmc","dm_shxmxlbm_shxmxlmc","dm_shxmbm_shxmmc","crm_htshmx_bhgsl","crm_htshmx_kf","zf"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"khbh","shxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_htshmxList.jsp?khbh="+khbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dm_shxmdlbm_shxmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("dm_shxmxlbm_shxmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from crm_htshmx where "+chooseitem;

		sql[1]="update crm_khxx set htshdf=NVL((select sum(bhgsl*kf) from  crm_htshmx where khbh='"+khbh+"'),0)";
		sql[1]+=" where khbh='"+khbh+"'";

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
	<td  width="6%">&nbsp;</td>
	<td  width="14%">审核项目大类</td>
	<td  width="18%">审核项目小类</td>
	<td  width="36%">不合格项目</td>
	<td  width="10%">不合格数</td>
	<td  width="8%">单项扣分</td>
	<td  width="8%">总分</td>
</tr>
<%
	pageObj.printDateSum();
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