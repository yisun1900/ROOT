<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String jjgwmc=request.getParameter("jjgwmc");//接收从编码后的jjgwmc
	jjgwmc=URLDecoder.decode(jjgwmc,"UTF-8");//解码jjgwmc

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_zcdd.ddbh,clztmc,zcxlbm,ppbm,crm_khxx.khxm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出','5','退货款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'), DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),jc_zcdd.hkze,zjhze, DECODE(jc_zcdd.xclbz,'1','不需测量','2','等待测量通知','3','测量已通知','4','已测量'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,jdm_zcddzt";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh ";
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"' ";
//	out.println(ls_sql);
	//ls_sql+=" order by jc_zcdd.lrsj,jc_zcdd.ddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
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
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	//Hashtable spanColHash=new Hashtable();
	//spanColHash.put("khxm","1");//列参数对象加入Hash表
	//spanColHash.put("lxfs","1");//列参数对象加入Hash表
	//spanColHash.put("fwdz","1");//列参数对象加入Hash表
	//spanColHash.put("hth","1");//列参数对象加入Hash表
	//pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材订单明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">订单编号</td>
	<td  width="5%">处理状态</td>
	<td  width="6%">主材小类</td>
	<td  width="7%">品牌</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">驻店家居顾问</td>
	<td  width="4%"><font color=red>展厅家居顾问</font></td>
	<td  width="4%">项目专员</td>
	<td  width="5%">客户交款性质</td>
	<td  width="6%">交款地点</td>
	<td  width="5%">等待送货通知</td>
	<td  width="6%">合同总额</td>
	<td  width="6%">增减项金额</td>
	<td  width="4%">需测量</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="9%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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