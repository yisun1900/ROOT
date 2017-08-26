<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String bgcolor=null;

String xh=request.getParameter("xh");
%>

<html>
<head>
<title>导入工资初始化信息 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<form method="post" action="saveEditGz.jsp" name="editform" target="_blank">
<div align="center">修改工资（序号：<%=xh%>）</div>
<input type="hidden" name="xh" value="<%=xh%>">
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">序号</td>
	<td  width="7%">所属部门</td>
	<td  width="4%">员工序号</td>
	<td  width="5%">工号</td>
	<td  width="5%">员工姓名</td>
	<td  width="3%">全勤天数</td>
	<td  width="3%">出勤天数</td>
	<td  width="6%">工龄工资</td>
	<td  width="6%">岗位工资</td>
	<td  width="6%">底薪</td>
	<td  width="6%">交通补贴</td>
	<td  width="6%">餐补</td>
	<td  width="6%">电话补</td>
	<td  width="6%">扣保费</td>
	<td  width="6%">奖金</td>
	<td  width="5%">其它补贴</td>
	<td  width="6%">其它扣款</td>
	<td  width="6%">提成</td>
	<td  width="5%">税前工资</td>
	<td  width="5%">扣税款</td>
	<td  width="5%">税后工资</td>
	<td  width="6%">备注</td>
    </tr>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ygbh=null;
String bianhao=null;
String yhmc=null;
String dwmc=null;
String glgz=null;
String gwgz=null;
String jbgz=null;
String jtbt=null;
String cb=null;
String dhbt=null;
String yjsxe=null;
String jj=null;
String qtbt=null;
String qtkk=null;
String tc=null;
String ksk=null;
String bz=null;
String sqgz=null;
String shgz=null;
String qqts=null;
String cqts=null;


try {
	conn=cf.getConnection();

	int i=0;
	ls_sql="select ygbh,bianhao,yhmc,dwmc,qqts,cqts,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,ksk,rs_yggzb.bz,sqgz,shgz ";
	ls_sql+=" from  rs_yggzb,sq_dwxx";
	ls_sql+=" where  rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		glgz=cf.fillNull(rs.getString("glgz"));
		gwgz=cf.fillNull(rs.getString("gwgz"));
		jbgz=cf.fillNull(rs.getString("jbgz"));
		jtbt=cf.fillNull(rs.getString("jtbt"));
		cb=cf.fillNull(rs.getString("cb"));
		dhbt=cf.fillNull(rs.getString("dhbt"));
		yjsxe=cf.fillNull(rs.getString("yjsxe"));
		jj=cf.fillNull(rs.getString("jj"));
		qtbt=cf.fillNull(rs.getString("qtbt"));
		qtkk=cf.fillNull(rs.getString("qtkk"));
		tc=cf.fillNull(rs.getString("tc"));
		ksk=cf.fillNull(rs.getString("ksk"));
		bz=cf.fillNull(rs.getString("bz"));
		sqgz=cf.fillNull(rs.getString("sqgz"));
		shgz=cf.fillNull(rs.getString("shgz"));
		qqts=cf.fillNull(rs.getString("qqts"));
		cqts=cf.fillNull(rs.getString("cqts"));


		i++;


		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}


		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		  <td><%=i%> 
			<input name="id" type="hidden" value="<%=i%>">
			<input name="ygbh" type="hidden" value="<%=ygbh%>" >
			<input name="bianhao" type="hidden" value="<%=bianhao%>">
		  </td>
		  <td><%=dwmc%></td>
		  <td> <%=ygbh%></td>
		  <td> <%=bianhao%></td>
		  <td> <%=yhmc%></td>
		  <td> <%=qqts%></td>
		  <td> <%=cqts%></td>
		  <td> 
			<input name="glgz" type="text" value="<%=glgz%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glgz[<%=i%>])">
		  </td>
		  <td>
			<input name="gwgz" type="text" value="<%=gwgz%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gwgz[<%=i%>])">
		  </td>
		  <td> 
			<input name="jbgz" type="text" value="<%=jbgz%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jbgz[<%=i%>])">
		  </td>
		  <td> 
			<input name="jtbt" type="text" value="<%=jtbt%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jtbt[<%=i%>])">
		  </td>
		  <td> 
			<input name="cb" type="text" value="<%=cb%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cb[<%=i%>])">
		  </td>
		  <td> 
			<input name="dhbt" type="text" value="<%=dhbt%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dhbt[<%=i%>])">
		  </td>
		  <td> 
			<input name="yjsxe" type="text" value="<%=yjsxe%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(yjsxe[<%=i%>])">
		  </td>
		  <td> 
			<input name="jj" type="text" value="<%=jj%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jj[<%=i%>])">
		  </td>
		  <td> 
			<input name="qtbt" type="text" value="<%=qtbt%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qtbt[<%=i%>])">
		  </td>
		  <td> 
			<input name="qtkk" type="text" value="<%=qtkk%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qtkk[<%=i%>])">
		  </td>
		  <td> 
			<input name="tc" type="text" value="<%=tc%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(tc[<%=i%>])">
		  </td>
		  <td> 
			<input name="sqgz" type="text" value="<%=sqgz%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sqgz[<%=i%>])">
		  </td>
		  <td> 
			<input name="ksk" type="text" value="<%=ksk%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(ksk[<%=i%>])">
		  </td>
		  <td> 
			<input name="shgz" type="text" value="<%=shgz%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(shgz[<%=i%>])">
		  </td>
		  <td> 
			<input name="bz" type="text" value="<%=bz%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=i%>])">
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
