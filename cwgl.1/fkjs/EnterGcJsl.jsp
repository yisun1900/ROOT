<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String khbh=request.getParameter("khbh");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
double qye=0;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;
double zjsl=0;
double zjse=0;
double sfkl=0;
double sfke=0;

String jsjlh=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_jsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	jsjlh=khbh+cf.addZero(count+1,2);

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,zjsl,zjse,sfkl,sfke";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjsl=rs.getDouble("zjsl");
		zjse=rs.getDouble("zjse");
		sfkl=rs.getDouble("sfkl");
		sfke=rs.getDouble("sfke");
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>家装款结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">家装款结算（结算记录号：<%=jsjlh%>）</div>
  
<form method="post" action="" name="editform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="18%"> 
        <div align="right">客户编号</div>
      </td>
      <td width="32%"><%=khbh%> </td>
      <td width="19%"> 
        <div align="right">客户姓名</div>
      </td>
      <td width="31%"><%=khxm%> </td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#CCCCFF" align="right">签约店面</td>
      <td width="32%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="19%" bgcolor="#CCCCFF" align="right">合同号</td>
      <td width="31%" bgcolor="#CCCCFF"><%=hth%></td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#CCCCFF">联系方式</td>
      <td width="32%" bgcolor="#CCCCFF"><%=lxfs%></td>
      <td width="19%" align="right" bgcolor="#CCCCFF">工程签约额</td>
      <td width="31%" bgcolor="#CCCCFF"><%=qye%></td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#CCCCFF">房屋地址</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%></td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#CCCCFF"> 
        <div align="right">装修设计师</div>
      </td>
      <td width="32%" bgcolor="#CCCCFF"><%=sjs%> </td>
      <td width="19%" bgcolor="#CCCCFF"> 
        <div align="right">施工队</div>
      </td>
      <td width="31%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#CCCCFF">应开工日期</td>
      <td width="32%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="19%" align="right" bgcolor="#CCCCFF">应竣工日期</td>
      <td width="31%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="18%" align="right">工程款总结算率</td>
      <td width="32%"><%=zjsl%>％</td>
      <td width="19%" align="right">工程款总结算额</td>
      <td width="31%"><%=zjse%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="18%" align="right">工程款实收款率</td>
      <td width="32%"><%=sfkl%>％</td>
      <td width="19%" align="right">工程款实收款额</td>
      <td width="31%"><%=sfke%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">结算方式</td>
      <td colspan="3">
        <input type="radio" name="jsfs" value="1" checked>
        增减项全款结算 
        <input type="radio" name="jsfs" value="2">
        增减项同比例结算 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">本期结算率</td>
      <td width="32%"> 
        <input type="text" name="jsl" size="17" maxlength="9"  value="" >
        ％ </td>
      <td width="19%" bgcolor="#FFFFFF" align="right">结算单位</td>
      <td width="31%"> 
        <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">结算人</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="jsr" size="20" maxlength="20"  value="<%=yhdlm%>" readonly>
      </td>
      <td width="19%" align="right">结算时间</td>
      <td width="31%"> 
        <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">备注</td>
      <td colspan="3"> 
        <textarea name="bz" rows="3" cols="73"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td colspan="4" height="57"> 
        <div align="center"> 
          <p> 
            <input type="hidden" name="khbh" value="<%=khbh%>" >
            <input type="hidden" name="jsjlh" value="<%=jsjlh%>" >
            <input type="button"  value="结算" onClick="f_js(editform)" name="button">
            <input type="button"  value="查看结算信息" onClick="f_do1(editform)" name="ck" disabled>
          </p>
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_js(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jsl)=="") {
		alert("请输入[本期结算率]！");
		FormName.jsl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsl, "本期结算率"))) {
		return false;
	}

	FormName.action="gcjs.jsp";
	FormName.submit();
	FormName.ck.disabled=false;
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	FormName.action="EditCw_jsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
