<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgd=null;
String ybjsl=null;
String cgcs=null;
String cgsbcs=null;
String cgcgcs=null;
String tsjjf=null;
String ybjpf=null;
String qssj=null;
String jzsj=null;
String kpr=null;
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sgd,ybjsl,cgcs,cgsbcs,cgcgcs,tsjjf,ybjpf,qssj,jzsj,kpr ";
	ls_sql+=" from  kp_ybjkp";
	ls_sql+=" where  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		ybjsl=cf.fillNull(rs.getString("ybjsl"));
		cgcs=cf.fillNull(rs.getString("cgcs"));
		cgsbcs=cf.fillNull(rs.getString("cgsbcs"));
		cgcgcs=cf.fillNull(rs.getString("cgcgcs"));
		tsjjf=cf.fillNull(rs.getString("tsjjf"));
		ybjpf=cf.fillNull(rs.getString("ybjpf"));
		qssj=cf.fillNull(rs.getDate("qssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		kpr=cf.fillNull(rs.getString("kpr"));
	}
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 样板间考评</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_ybjkp.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>
              </td>
              <td width="35%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">考评人</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpr" size="20" maxlength="16"  value="<%=kpr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">考评起始时间</font></td>
              <td width="35%"> 
                <input type="text" name="qssj" size="20" maxlength="10"  value="<%=qssj%>" readonly>
              </td>
              <td width="15%" align="right"><font color="#0000CC">考评截止时间</font></td>
              <td width="35%"> 
                <input type="text" name="jzsj" size="20" maxlength="10"  value="<%=jzsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">参观次数</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="cgcs" size="20" maxlength="8"  value="<%=cgcs%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">提供样板间数量</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybjsl" size="20" maxlength="8"  value="<%=ybjsl%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">参观成功次数</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="cgcgcs" size="20" maxlength="8"  value="<%=cgcgcs%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">参观失败次数</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="cgsbcs" size="20" maxlength="8"  value="<%=cgsbcs%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">特殊加减分</div>
              </td>
              <td width="35%"> 
                <input type="text" name="tsjjf" size="20" maxlength="8"  value="<%=tsjjf%>" >
              </td>
              <td width="15%"> 
                <div align="right">样板间评分</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybjpf" size="20" maxlength="8"  value="<%=ybjpf%>" >
              </td>
            </tr>
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tsjjf)=="") {
		alert("请选择[特殊加减分]！");
		FormName.tsjjf.focus();
		return false;
	}
	if(!(isInt(FormName.tsjjf, "特殊加减分"))) {
		return false;
	}

	if(	javaTrim(FormName.ybjpf)=="") {
		alert("请选择[样板间评分]！");
		FormName.ybjpf.focus();
		return false;
	}
	if(!(isNumber(FormName.ybjpf, "样板间评分"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
