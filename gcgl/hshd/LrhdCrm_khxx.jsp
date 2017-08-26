<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;
String hdbz=null;
String hdr=null;
String cgdz =null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq,hdbz,hdr,cgdz";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
	}
	rs.close();
	ps.close();
	if (hdbz.equals("1"))
	{
		hdbz="";
	}

%>


<body bgcolor="#FFFFFF">
  <div align="center">录入回单</div>

<form method="post" action="SaveLrhdCrm_khxx.jsp" name="insertform" >
  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">客户编号</font></td>
      <td width="33%"><%=khbh%></td>
      <td align="right" width="17%"><font color="#000099">合同号</font></td>
      <td width="33%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">客户姓名</font></td>
      <td width="33%"><%=khxm%></td>
      <td align="right" width="17%"><font color="#000099">房屋地址</font></td>
      <td width="33%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">设计师</font></td>
      <td width="33%"><%=sjs%></td>
      <td align="right" width="17%"><font color="#000099">工程担当</font></td>
      <td width="33%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">施工队</font></td>
      <td width="33%"><%=sgdmc%></td>
      <td align="right" width="17%"><font color="#000099">施工班组</font></td>
      <td width="33%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">签约日期</font></td>
      <td width="33%"><%=qyrq%></td>
      <td align="right" width="17%"><font color="#000099">签约店面</font></td>
      <td width="33%"><%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="30" colspan="4"><b>回单信息</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"> 
        <div align="right"><font color="#FF0033">*</font>回单标志</div>
      </td>
      <td width="30%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(editform)">
           <option value=""></option>
         <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz);
%> 
        </select>
      </td>
      <td width="20%"> 
        <div align="right">回单人</div>
      </td>
      <td width="30%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%" align="right">回单装修地址</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="71" maxlength="100" >
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="14"> 
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button"  value="存盘" onClick="f_do(insertform)">
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
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
function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
