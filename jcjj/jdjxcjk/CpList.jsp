<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.DBPageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	
	
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String FItemID=null;
	FItemID=request.getParameter("FItemID");
	if (FItemID!=null)
	{
		if (!(FItemID.equals("")))	wheresql+=" and  (t_ICItem.FItemID='"+FItemID+"')";
	}
	String FModel=null;
	FModel=request.getParameter("FModel");
	if (FModel!=null)
	{
		if (!(FModel.equals("")))	wheresql+=" and  (t_ICItem.FModel='"+FModel+"')";
	}
	String FName=null;
	FName=request.getParameter("FName");
	if (FName!=null)
	{
		FName=cf.GB2Uni(FName);
		if (!(FName.equals("")))	wheresql+=" and  (t_ICItem.FName  like '%"+FName+"%')";
	}
	
	



	ls_sql="SELECT FItemID,FName,FModel,FSalePrice";
	ls_sql+=" FROM t_ICItem ";
	ls_sql+=" where 1=1 ";
	//ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh";
	//ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	//ls_sql+=" and jc_zcdd.clzt in('00','03','05')";
	

    ls_sql+=wheresql;
    ls_sql+=" order by FItemID";

//	System.out.println(ls_sql);

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("CpList.jsp","","","","sqlserver","sa","");

/*
//设置显示列
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"FItemID"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表*/
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
  <B><font size="3">产品--查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td >产品内码</td>
	<td >产品名称</td>
	<td >产品规格</td>
	<td >销售单价</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</table>
</form> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
