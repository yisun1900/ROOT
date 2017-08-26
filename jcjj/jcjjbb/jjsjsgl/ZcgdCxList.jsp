<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String ls_sql=null;
String wheresql="";
String xmzy=null;
String xm=cf.GB2Uni(request.getParameter("XM"));
xmzy=request.getParameter("xmzy");
if (xmzy!=null)
{
	xmzy=xmzy.trim();
	if (!(xmzy.equals("")))	wheresql+="  and (jc_zcdd.xmzy='"+xmzy+"')";

}


String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	ls_sql="SELECT jc_zcdd.ddbh,yhmc, DECODE(jc_zcdd.clzt,'00','订单未完成','01','订单已完成','02','订单已确认','03','已送货'),crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,jc_zcdd.clgw, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'), DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),jc_zcdd.hkze, DECODE(jc_zcdd.xclbz,'1','不需测量','2','等待测量通知','3','测量已通知','4','已测量'),jc_zcdd.lrsj,dwmc,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx,sq_yhxx  ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=sq_dwxx.dwbh and jc_zcdd.xmzy=sq_yhxx.yhdlm and jc_zcdd.clzt not in ('03')  ";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_zcdd.lrsj,jc_zcdd.ddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("ZcgdCxList.jsp","SelectXmzy.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("lxfs","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
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
  <B><font size="3">主材项目专员跟单情况表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">订单编号</td>
	<td  width="4%">项目专员</td>
    <td  width="6%">处理状态</td>
	<td  width="4%">客户姓名</td>
	<td  width="7%">联系方式</td>
	<td  width="13%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="4%">驻店家居顾问</td>
	<td  width="6%">客户交款性质</td>
	<td  width="8%">交款地点</td>
	<td  width="6%">等待送货通知</td>
	<td  width="5%">合同总额</td>
	<td  width="6%">需测量</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="9%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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