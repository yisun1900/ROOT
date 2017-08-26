<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sfcjq=null;
String sffby=null;
String hbqye=null;
String hth=cf.GB2Uni(request.getParameter("hth"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.khxm,khbh,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm,sfcjq,sffby,hbqye";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.hth='"+hth+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbqye=cf.fillNull(rs.getString("hbqye"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sfcjq=cf.fillNull(rs.getString("sfcjq"));
		sffby=cf.fillNull(rs.getString("sffby"));
	}
	rs.close();
	ps.close();

	if (hbqye.equals(""))
	{
		hbqye="0";
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 环保项目登记</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBqCrm_gcjddjjl.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="16%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="34%"> <%=khxm%>（<%=lxfs%>） </td>
              <td width="14%"> 
                <div align="right">合同号</div>
              </td>
              <td width="36%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%" align="right">房屋地址</td>
              <td width="34%"><%=fwdz%></td>
              <td width="14%" align="right">工程担当</td>
              <td width="36%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="34%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="14%"> 
                <div align="right">设计师</div>
              </td>
              <td width="36%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%"> 
                <div align="right">签约日期</div>
              </td>
              <td width="34%"><%=qyrq%> </td>
              <td width="14%"> 
                <div align="right">工程签约额</div>
              </td>
              <td width="36%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%"> 
                <div align="right">施工队</div>
              </td>
              <td width="34%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="14%"> 
                <div align="right">班长</div>
              </td>
              <td width="36%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%" align="right">合同开工日期</td>
              <td width="34%"><font color="#000000"><%=kgrq%></font></td>
              <td width="14%" align="right">合同竣工日期</td>
              <td width="36%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="16%" align="right">实际开工日期</td>
              <td width="34%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="14%" align="right">实际竣工日期</td>
              <td width="36%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">环保项目签约额</td>
              <td colspan="3"> 
                <input type="text" name="hbqye" size="20" maxlength="16" value="<%=hbqye%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">是否除甲醛</td>
              <td width="34%"> 
                <select name="sfcjq" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+不需要&2+需要",sfcjq);
%> 
                </select>
              </td>
              <td width="14%" align="right">是否防白蚁</td>
              <td width="36%"> 
                <select name="sffby" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+不需要&2+需要",sffby);
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.hbqye)=="") {
		alert("请输入[环保项目签约额]！");
		FormName.hbqye.focus();
		return false;
	}
	if(!(isFloat(FormName.hbqye, "环保项目签约额"))) {
		return false;
	}

	if (FormName.sfcjq.value=="2" || FormName.sffby.value=="2")
	{
		if (FormName.hbqye.value=="0")
		{
			alert("请输入[环保项目签约额]！");
			FormName.hbqye.select();
			return false;
		}
	}
	else{
		FormName.hbqye.value="0";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
