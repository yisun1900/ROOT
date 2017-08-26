<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] fgsbh=request.getParameterValues("fgsbh");
ybl.common.PageObject pageObj=new ybl.common.PageObject();

if (fgsbh==null)
{
	return;
}

String wheresql="";



wheresql=" and "+cf.arrayToInSQL(fgsbh,"crm_khxx.fgsbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
String ls_sql=null;


try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>当月业绩统计</B>（<span class="STYLE1">注意：红色字体表示付款未满足，不应打勾</span>）<BR>
</CENTER>

<form method="post" action="" name="insertform" target="_blank">
<table border="1" width="240%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="2%" >&nbsp;</td>
  <td  width="2%" >序号</td>
  <td  width="3%" >客户类型</td>
  <td  width="5%" >合同号</td>
  <td  width="5%" >姓名</td>
  <td  width="11%" >房屋地址</td>
  <td  width="3%" >财务实收比例</td>
  <td  width="5%" >上月末付款金额 </td>
  <td  width="3%" >上月末付款比例</td>
  <td  width="5%" >签约日期</td>
  <td  width="6%" >工程未打折金额</td>
  <td  width="6%" >工程签单额</td>
  <td  width="5%" >管理费</td>
  <td  width="5%" >税金</td>
  <td  width="6%" >家装实收款额</td>
  <td  width="6%" >财务实收款额</td>
  <td  width="5%" >退单日期</td>
  <td  width="3%" >计入业绩比例</td>
  <td  width="4%" >客户编号</td>
  <td  width="4%" >设计师</td>
  <td  width="6%" >店面</td>
</tr>
<%
	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;

	double wdzgce=0;
	double qye=0;
	double guanlif=0;
	double suijin=0;
	double sfke=0;
	double cwsfke=0;
	double cwsfbl=0;

	String qyrq=null;
	String tdsj=null;
	String yjjzsj=null;
	String tdyjjzsj=null;
	String dwmc=null;
	double jryjbfb=0;
	String zt=null;

	int row=0;

	String nian=cf.today().substring(0,4);
	String yue=cf.today().substring(5,7);
	String jzrq=cf.firstDay(nian,yue);


	//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql=" SELECT crm_khxx.khbh,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,wdzgce,qye,guanlif,suijin,crm_khxx.sfke,crm_khxx.cwsfke";
	ls_sql+=" ,crm_khxx.qyrq,crm_khxx.tdsj,crm_khxx.yjjzsj,crm_khxx.tdyjjzsj,b.dwmc dwmc,a.jryjbfb ";
	ls_sql+=" ,DECODE(crm_khxx.zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>') zt";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh";
	ls_sql+=" and b.sfjms='N'";//N：否；Y：是
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
//	ls_sql+=" and crm_khxx.cwsfke>=(qye+NVL(guanlif,0)+NVL(suijin,0))*((a.jryjbfb-0.5)/100)";
	ls_sql+=" and crm_khxx.cwsfke>=qye*((a.jryjbfb-0.5)/100)";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs,crm_khxx.khxm";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");

		sfke=rs.getDouble("sfke");
		cwsfke=rs.getDouble("cwsfke");

		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		yjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillHtml(rs.getDate("tdyjjzsj"));

		dwmc=rs.getString("dwmc");
		jryjbfb=rs.getDouble("jryjbfb");
		zt=rs.getString("zt");

		double fkje=0;
		double fkbl=0;
		ls_sql=" SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and sjsj<TO_DATE('"+jzrq+"','YYYY-MM-DD')";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (qye!=0)
		{
			fkbl=fkje*100/qye;
		}
		else{
			fkbl=0;
		}

		fkbl=cf.round(fkbl,2);


		if (qye!=0)
		{
			cwsfbl=cwsfke*100/qye;
		}
		else{
			cwsfbl=0;
		}
		cwsfbl=cf.round(cwsfbl,2);

		String bgcolor="#FF0000";
		String mark="";
		if (fkbl>=(jryjbfb-0.5))
		{
			mark="checked=true";
			bgcolor="#FFFFF";
		}


		row++;

		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td>
				<input name="khbh" type="checkbox" value="<%=khbh%>" <%=mark%>>
			</td>
			<td><%=row%></td>
			<td><%=zt%></td>
			<td><%=hth%></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td  align="right" ><%=cf.formatDouble(cwsfbl)%>%</td>
			<td><%=fkje%></td>
			<td><%=fkbl%>%</td>
			<td><%=qyrq%></td>
			<td  align="right" ><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" ><%=cf.formatDouble(qye)%></td>
			<td  align="right" ><%=cf.formatDouble(guanlif)%></td>
			<td  align="right" ><%=cf.formatDouble(suijin)%></td>
			<td  align="right" ><%=cf.formatDouble(sfke)%></td>
			<td  align="right" ><%=cf.formatDouble(cwsfke)%></td>
			<td><%=tdsj%></td>
			<td><%=jryjbfb%>%</td>
			<td><%=khbh%></td>
			<td><%=sjs%></td>
			<td><%=dwmc%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
    <tr align="center"> 
      <td colspan="7"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)" >
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
</table>
</form>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close();
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="yjqmjz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

