<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sfxmbm=null;
String sfje=null;
String sflx=null;
String bz=null;
String dqbm=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sfxmbm,DECODE(bj_sfxmmx.sflx,'1','百分比','2','固定金额') sflx,sfje,bz ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sfxmbm='"+wheresfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfje=cf.fillNull(rs.getString("sfje"));
		sflx=cf.fillNull(rs.getString("sflx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (sflx.equals("百分比"))
	{
		sfje="";
	}

	ls_sql="select dqbm";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.ssfgs=sq_dwxx.dwbh and  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改其它收费项目</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_sfxmmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收费项目</td>
              <td> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getSfxm(insertform)">
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmbm",sfxmbm);
%> 
                </select>
              </td>
              <td align="right">收费类型</td>
              <td> 
                <input name="sflx" type="text" id="sflx" value="<%=sflx%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收费金额</td>
              <td colspan="3"> 
                <input type="text" name="sfje" size="20" maxlength="17"  value="<%=sfje%>" >
                <font color="#FF0033"><b>注意：按百分比收费项目，不需录入收费金额，由系统自动计算 </b></font> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresfxmbm"  value="<%=wheresfxmbm%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">
                </div>
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

function getSfxm(FormName)
{

	var str="Bj_sfxmmxCx.jsp?dqbm=<%=dqbm%>&sfxmbm="+FormName.sfxmbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请选择[收费项目]！");
		FormName.sfxmbm.focus();
		return false;
	}
	if (FormName.sflx.value=='固定金额')
	{
		if(	javaTrim(FormName.sfje)=="") {
			alert("请输入[收费金额]！");
			FormName.sfje.focus();
			return false;
		}
		if(!(isFloat(FormName.sfje, "收费金额"))) {
			return false;
		}
	}
	else {
		if(	javaTrim(FormName.sfje)!="" && FormName.sfje.value!='0') {
			alert("按百分比收费，不需要录入[收费金额]！");
			FormName.sfje.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
