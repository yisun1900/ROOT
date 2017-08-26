<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

int row=0;
int xh=0;

try {
	conn=cf.getConnection();


%>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<form method="post" action="" name="listform" target="_blank">
  <center>
    <b>签单明细（本段时间内签单，但未进行设计师提成的客户）</b>
</center>
  <table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="3%">序号</td>
      <td  width="3%">&nbsp;</td>
      <td  width="4%">施工队</td>
      <td  width="18%">房屋地址</td>
      <td  width="7%"><b><font color="#0000CC">预算金额</font></b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="7%"><b>可结工资</b></td>
      <td  width="37%"><b>备注</b></td>
      <td  width="6%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="6%">签约日期</td>
    </tr>
    <%

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String sgdmc=null;
	String qyrq=null;
	String ysgcjdmc=null;

	double sjfksbl=0;
	double qye=0;
	double khjsje=0;
	double qdsyjsje=0;
	double qdtcbl=0;
	double qdtcje=0;
	double wgtcbl=0;
	double wgtcje=0;
	String bz=null;

	xh=0;
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='1' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		row++;
		xh++;

		%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td><%=xh%></td>
	  <td><A HREF="#" onclick="f_delete(listform,'<%=khbh%>','1')">删除</A></td>
      <td><%=sgdmc%></td>
      <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
      <td> 
        <input type="text" name="qye" value="<%=qye%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
      </td>
      <td> 
        <input type="text" name="td" value="<%=qdtcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_qdjs(listform,<%=(row-1)%>)" onKeyUp="keyGo(td[<%=row%>])">
        % </td>
      <td> 
        <input type="text" name="kjgz" value="<%=qdtcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kjgz[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="bz" value="<%=bz%>" size="60" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=row%>])">
        <input type="hidden" name="khjsje" >
        <input type="hidden" name="qdsyjsje" >
        <input type="hidden" name="wgtcje" >
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="hidden" name="lx" value="1">
      </td>
      <td><%=hth%></td>
      <td><%=sjs%></td>
      <td><%=qyrq%></td>
    </tr>
    <%

	}
	rs.close();
	ps.close();

%> 
  </table>

<center>
    <b>结算明细（本段时间内交的尾款，但未进行完工提成的客户）</b>
</center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="3%">序号</td>
      <td  width="3%">&nbsp;</td>
      <td  width="4%">施工队</td>
      <td  width="18%">房屋地址</td>
      <td  width="7%"><b><font color="#0000CC">结算金额</font></b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="7%"><b>可结工资</b></td>
      <td  width="7%"><b><font color="#0000CC">预算金额</font></b></td>
      <td  width="7%"><b><font color="#0000CC">已结工资</font></b></td>
      <td  width="7%"><b>实领工资</b></td>
      <td  width="16%"><b>备注</b></td>
      <td  width="6%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="6%">签约日期</td>
    </tr>
	<%

	xh=0;
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='2' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><A HREF="#" onclick="f_delete(listform,'<%=khbh%>','2')">删除</A></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td> 
			<input type="text" name="khjsje" value="<%=khjsje%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td> 
			<input type="text" name="td" value="<%=wgtcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_wgjs(listform,<%=(row-1)%>)" onKeyUp="keyGo(td[<%=row%>])">
			% </td>
		  <td> 
			<input type="text" name="kjgz" value="<%=cf.doubleTrim(khjsje*wgtcbl/100)%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kjgz[<%=row%>])">
		  </td>
		  <td> 
			<input type="text" name="qye" value="<%=qye%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td> 
			<input type="text" name="qdsyjsje" value="<%=qdsyjsje%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td> 
			<input type="text" name="wgtcje" value="<%=wgtcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wgtcje[<%=row%>])">
		  </td>
		  <td> 
			<input type="text" name="bz" value="<%=bz%>" size="24" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=row%>])">
			<input type="hidden" name="khbh" value="<%=khbh%>">
			<input type="hidden" name="lx" value="2">
		  </td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=qyrq%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
  </table>

<center>
    <b>设计客户明细（本段时间内签单且已交全款，但未进行设计师提成的客户）</b>
</center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="3%">序号</td>
      <td  width="3%">&nbsp;</td>
      <td  width="4%">施工队</td>
      <td  width="18%">房屋地址</td>
      <td  width="7%"><b><font color="#0000CC">结算金额</font></b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="7%"><b>可结工资</b></td>
      <td  width="7%"><b><font color="#0000CC">设计费</font></b></td>
      <td  width="7%"><b><font color="#0000CC">已结工资</font></b></td>
      <td  width="7%"><b>实领工资</b></td>
      <td  width="16%"><b>备注</b></td>
      <td  width="6%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="6%">签约日期</td>
    </tr>
	<%

	//设计客户
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='3' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><A HREF="#" onclick="f_delete(listform,'<%=khbh%>','3')">删除</A></td>
		  <td>&nbsp;</td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td> 
			<input type="text" name="khjsje" value="<%=khjsje%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td> 
			<input type="text" name="td" value="<%=wgtcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_wgjs(listform,<%=(row-1)%>)" onKeyUp="keyGo(td[<%=row%>])">
			% </td>
		  <td> 
			<input type="text" name="kjgz" value="<%=cf.doubleTrim(khjsje*wgtcbl/100)%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kjgz[<%=row%>])">
		  </td>
		  <td> 
			<input type="text" name="qye" value="<%=qye%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td> 
			<input type="text" name="qdsyjsje" value="<%=qdsyjsje%>" size="9" maxlength="15" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td> 
			<input type="text" name="wgtcje" value="<%=wgtcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wgtcje[<%=row%>])">
		  </td>
		  <td> 
			<input type="text" name="bz" value="<%=bz%>" size="24" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=row%>])">
			<input type="hidden" name="khbh" value="<%=khbh%>">
			<input type="hidden" name="lx" value="3">
		  </td>
		  <td>&nbsp;</td>
		  <td><%=sjs%></td>
		  <td><%=qyrq%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
  <tr align="center"> 
	  <td colspan="4" height="44"> 
        <input type="hidden" name="jsjlh" value="<%=jsjlh%>">

        <input type="button" name="td" value=" 存 盘 " onClick="f_do(listform)">
      </td>
  </tr>
</table>

</form>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function f_do(formName)
{
	formName.action="SaveEditCw_sjsjsjl.jsp";
	formName.submit();
	return true;
} 

function f_delete(formName,khbh,lx)
{
	if ( confirm("删除后不可恢复，确实要继续吗？") )	
	{
		formName.action="DeleteCw_sjsjsmx.jsp?khbh="+khbh+"&lx="+lx;
		formName.submit();
		return true;
	}
} 

function f_qdjs(FormName,xh)
{
	var kjgz=0;//可结工资=预算金额*提点/100
	kjgz=FormName.qye[xh].value*FormName.td[xh].value/100.0;
	kjgz=round(kjgz,2);
	FormName.kjgz[xh].value=kjgz;
} 

function f_wgjs(FormName,xh)
{
	var kjgz=0;//可结工资=结算金额*提点/100
	kjgz=FormName.khjsje[xh].value*FormName.td[xh].value/100.0;
	kjgz=round(kjgz,2);
	FormName.kjgz[xh].value=kjgz;

	var wgtcje=0;//实领工资=预算金额*提点/100
	wgtcje=FormName.kjgz[xh].value*1.0-FormName.qdsyjsje[xh].value*1.0;
	wgtcje=round(wgtcje,2);
	FormName.wgtcje[xh].value=wgtcje;
} 



//-->
</script>

