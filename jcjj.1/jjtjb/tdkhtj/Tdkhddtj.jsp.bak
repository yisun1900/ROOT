<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ls_sql=null;
String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
String dwbhsql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

String all=null;
String tslxbm=null;
String tslxmc=null;
String tsxlbm=null;
String tsxlmc=null;
String tsyymc=null;

String gysmc=null;
String tspp=null;

int[] mark={3,3,1,2,4};//设置显示风格参数
//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
int allwjjtssl=0;
int allyjjtssl=0;
int allwjjbxsl=0;
int allyjjbxsl=0;
int temp2=0;
int dltssl=0;
int temp1=0;
String bgcolor="#E8E8FF";

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
</CENTER>
<br>
    <div align="center"><b>橱柜、家具退单客户明细</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
 
  <td  width="7%">客户姓名</td>
  <td  width="7%">客户编号</td>
  <td  width="7%">店面</td>
  <td  width="7%">订购项目</td>
  <td  width="7%">确定退单日期</td>
  <td  width="7%">退单原因</td>
  <td  width="7%">设计师</td>
  <td  width="7%">登记日期</td>
  <td  width="7%">项目部核实情况</td>
  <td  width="7%">回复日期</td>
	<td  width="7%">备注</td>
</tr>
<%
	Hashtable spanColHash=null;


	ls_sql="select khxm,khbh,dwmc,lx,tdsj,jctdyymc,sjs,lrsj,ychsqk,hfqq ,tdsm from ";
	ls_sql+="( ";
	
	ls_sql+=" SELECT crm_khxx.khxm khxm,crm_khxx.khbh,dwmc,'家具' as lx,jc_jjdd.tdsj,jctdyymc,jc_jjdd.jjsjs sjs,jc_jjdd.lrsj,jc_jjdd.ychsqk,'' hfqq, jc_jjdd.tdsm from jc_jjdd,crm_khxx,sq_dwxx,jdm_jctdyybm where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and jc_jjdd.jctdyybm=jdm_jctdyybm.jctdyybm(+) and zt='2' and jc_jjdd.clzt='99' ";
	ls_sql+="  and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=wheresql;
	ls_sql+=" union all ";
	ls_sql+=" SELECT crm_khxx.khxm khxm,crm_khxx.khbh khbh,dwmc,'橱柜' as lx,tdsj,jctdyymc,cgsjs sjs,jc_cgdd.lrsj,'qq' ychsqk,'' hfqq,tdsm from jc_cgdd,crm_khxx,jdm_jctdyybm,sq_dwxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and jc_cgdd.jctdyybm=jdm_jctdyybm.jctdyybm(+) and zt='2' and jc_cgdd.clzt='99' ";
	ls_sql+="and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" ) ";
	ls_sql+=" order by lx";

	//out.print(ls_sql);
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//设置每页显示记录数
	pageObj.alignStr[2]="align='center'";//设置每页显示记录数

//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>

</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
</table>
</body>
</html>
