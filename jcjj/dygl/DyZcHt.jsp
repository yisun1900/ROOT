<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>主材合同打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ddbh=request.getParameter("ddbh");
	String khbh=cf.executeQuery("select khbh from jc_zcdd where ddbh='"+ddbh+"'");
	String clzt=cf.executeQuery("select clzt from jc_zcdd where ddbh='"+ddbh+"'");
	String xclbz=cf.executeQuery("select xclbz from jc_zcdd where ddbh='"+ddbh+"'");
	String sxhtsfysh=cf.executeQuery("select sxhtsfysh from jc_zcdd where ddbh='"+ddbh+"'");

%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">主材合同打印(预订单编号：<%=ddbh%>)</div>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button" value="打印预定单" onClick="f_do(selectform,'dydd')">
          <input type="button" value="打印独立代销合同" onClick="f_do(selectform,'dydldxht')">
          <input type="button" value="打印附件" onClick="f_do(selectform,'dymx')">
          <input type="button" value="打印测量单" onClick="f_do(selectform,'dycld')">
		   <input type="button" value="打印退单给供应商" onClick="f_do(selectform,'tddy')">
        </div>
      </td>
    </tr>
  </table>
</form>

<form method="POST" name="listform">
<table border="1" width="220%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">订单编号</td>
	<td  width="4%">处理状态</td>
	<td  width="5%">主材大类</td>
	<td  width="5%">主材小类</td>
	<td  width="6%">品牌供应商</td>
	<td  width="5%">品牌</td>
	<td  width="5%">供应商</td>
	<td  width="4%">合同总额</td>
	<td  width="3%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="3%">驻店家居顾问</td>
	<td  width="3%">展厅家居顾问</td>
	<td  width="3%">项目专员</td>
	<td  width="3%">家居设计师</td>
	<td  width="4%">客户交款性质</td>
	<td  width="5%">交款地点</td>
	<td  width="4%">等待送货通知</td>
	<td  width="4%">产品类型</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="8%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT jc_zcdd.ddbh,clztmc,zcdlbm,zcxlbm,jc_zcdd.ppbm,jc_zcdd.ppmc,jc_zcdd.gys,jc_zcdd.hkze,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出','5','退货款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'), DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制产品','2','定制式产品'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,jdm_zcddzt ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh";
 	if (yhjs.equals("G0") )
	{
		ls_sql+=" and jc_zcdd.clzt>='13' and jc_zcdd.clzt!='98'";
	}
	else{
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
	}
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_zcdd.lrsj,jc_zcdd.ddbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_zcddList.jsp","SelectJc_zcdd.jsp","","");
//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"合并打印订单"};//按钮的显示名称
	String[] buttonLink={"zcfjhb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%>
	  
	  

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	pageObj.printScript();
%> 

function f_do(FormName,lx)//参数FormName:Form的名称
{

	if (lx=="dydldxht")
	{
		FormName.action="dydldxht.jsp";
	}
	else if (lx=="dymx")
	{
		FormName.action="zcfj.jsp";
	}
	else if (lx=="dycld")
	{
		FormName.action="dycld.jsp";
	}
	else if (lx=="tddy")
	{
		FormName.action="tddy.jsp";
	}
	else
	{
		FormName.action="zcydddy.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
