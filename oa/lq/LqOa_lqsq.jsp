<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String bgypbm=null;
String slr=null;
String lrrq=null;
String jhlqsl=null;
String jhlqrq=null;
String lqzt=null;
String slqsl=null;
String blr=null;
String lqsj=null;
String dwbh=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select dwbh,bgypbm,slr,lrrq,jhlqsl,jhlqrq,lqzt,slqsl,blr,lqsj,bz ";
	ls_sql+=" from  oa_lqsq";
	ls_sql+=" where  xh="+wherexh;
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bgypbm=cf.fillNull(rs.getString("bgypbm"));
		slr=cf.fillNull(rs.getString("slr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		jhlqsl=cf.fillNull(rs.getString("jhlqsl"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		lqzt=cf.fillNull(rs.getString("lqzt"));
		slqsl=cf.fillNull(rs.getString("slqsl"));
		blr=cf.fillNull(rs.getString("blr"));
		lqsj=cf.fillNull(rs.getDate("lqsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>领取办公用品</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 领取办公用品</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveLqOa_lqsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">办公用品</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select bgypbm,bgypmc from oa_bgypbm order by bgypbm",bgypbm,true);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#000099">录入日期</font></div>
              </td>
              <td width="32%"><%=lrrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">单位</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh,true);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">申领人</font></div>
              </td>
              <td width="32%"><%=slr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">计划领取日期</font></div>
              </td>
              <td width="32%"> <%=jhlqrq%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">计划领取数量</font></div>
              </td>
              <td width="32%"><%=jhlqsl%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">实领取数量</div>
              </td>
              <td width="32%">
                <input type="text" name="slqsl" size="20" maxlength="8"  value="<%=jhlqsl%>" >
              </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办理人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="blr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">领取时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lqsj" size="20" maxlength="10"  value="<%=cf.today()%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
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
	if(	javaTrim(FormName.slqsl)=="") {
		alert("请输入[实领取数量]！");
		FormName.slqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.slqsl, "实领取数量"))) {
		return false;
	}
	if (FormName.slqsl.value=="0")
	{
		alert("[实领取数量]不能为0！");
		FormName.slqsl.select();
		return false;
	}
	if(	javaTrim(FormName.blr)=="") {
		alert("请输入[办理人]！");
		FormName.blr.focus();
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("请输入[领取时间]！");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "领取时间"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
