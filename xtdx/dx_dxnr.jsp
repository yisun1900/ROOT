<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String[] khbh=request.getParameterValues("khbh");
%>
<title>请输入信息内容</title>
<div align="center">
  <p><font color="red"><b>需发送信息人数:<%=khbh.length%></b></font></p>
  </div>
<form method="post" name="selectform">
<DIV align="center">
    <table width="66%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF" align="center"> 
        <td width="9%">序号</td>
        <td width="16%">姓名</td>
        <td width="40%">地址</td>
        <td width="35%">手机</td>
      </tr>
      <%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int row=0;

	for (int i=0;i<khbh.length;i++)
	{
		String khxm=null;
		String fwdz=null;
		String lxfs=null;
		ls_sql="select khxm,fwdz,lxfs";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
		}
		rs.close();
		ps.close();

		row++;

		%> 
      <tr bgcolor="#FFFFFF" align="center"> 
        <td width="9%"><%=row%> 
          <input type="hidden" name="khbh" value="<%=khbh[i]%>" >
        </td>
        <td width="16%"><%=khxm%></td>
        <td width="40%"><%=fwdz%></td>
        <td width="35%">
			<input type="text" name="lxfs" size="25" maxlength="50" value="<%=lxfs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cj[<%=row%>])">
      </tr>
      <%
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

	%> 
    </table>

	<table width="66%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF"> 
        <td width="15%" align="right"><font color="#FF0000">*</font>信息前缀</td>
        <td width="75%"> 
          <input type="radio" name="xxqz" value="Y">
          自动增加姓名、性别 
          <input type="radio" name="xxqz" value="N">
          只发送信息不增加 </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="15%" align="right">信息内容</td>
        <td width="75%"> 
          <textarea name="xxnr" rows="7" cols="65"></textarea>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td colspan="2"> 
          <div align="center"> 
            <input type="button"  value="(非模版)发送" onClick="f_ph(selectform,'0')">
            <input type="button"  value="发送(开工提示)" onClick="f_ph(selectform,'1')">
            <input type="button"  value="发送(完工提示)" onClick="f_ph(selectform,'2')">
            <input type="button"  value="发送(到保前)" onClick="f_ph(selectform,'3')">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset"  value="重输" name="reset">
          </div>
        </td>
      </tr>
      <tr> 
        <td colspan="2"  bgcolor="#FFFFFF"> 
          <div align="left"> 
            <p><font color="red"><b>关于信息前缀:</b></font></p>
            <p><font color="blue">自动增加姓名、性别:</font>系统自动从客户资料中读取客户姓名,性别,添加到信息中,;例如,客户姓名:张三,性别:男.系统将自动在您的信息内容前面增加 
              "张三先生,"</p>
            <p><font color="blue">只发送信息不增加:</font>系统只发送您输入的信息内容!</p>
            <p><font color="red"><b>模版说明:</b></font></p>
            <p><font color="blue">『开工提示』模版：</font> <br>
              &nbsp;&nbsp;&nbsp;&nbsp;尊敬的_______先生/女士,感谢您选择松下亿达！如有问题或建议请致电：客服_______、集团客服4008182588。为您服务的人员：施工_______、设计_______、质量监理_______（请予保留 
            <p><font color="blue">『完工提示』模版：</font> <br>
              &nbsp;&nbsp;&nbsp;&nbsp;尊敬的_______先生/女士,感谢您选择松下亿达！您家工地在____年____月_____日完工进入2年保修期。如您在此过程中有维修项目，请与我们联系，客服部_______、松下亿达工程客服中心400-818-2588
            <p><font color="blue">『到保前』模版：</font> <br>
              &nbsp;&nbsp;&nbsp;&nbsp;尊敬的_______先生/女士,感谢您选择松下亿达！您家工地在____年____月_____日保修期结束，尽心服务是我们的宗旨，如您仍有维修项目，请与我们联系，客服部_______、松下亿达工程客服中心400-818-2588
          </div>
        </td>
      </tr>
    </table>
  </DIV>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName,lx)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.xxqz)) {
		alert("请选择[信息前缀]！");
		FormName.xxqz[0].focus();
		return false;
	}

	if (lx=="0")
	{
		if(	javaTrim(FormName.xxnr)=="") {
			alert("(非模版)发送，请输入[信息内容]！");
			FormName.xxnr.focus();
			return false;
		}
	}
	var maxzs=300

	if (FormName.xxnr.value.length>maxzs)
	{
		alert("信息内容超长!!!");
		FormName.xxnr.focus();
		return false;
	}

	FormName.action="dx_plqf.jsp?lx="+lx;
	FormName.submit();
	return true;
}


//-->
</SCRIPT>