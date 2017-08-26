<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>

<%

String wtbh=null;
String dcqs=null;
String wtmc=null;
String sfkdx=null;
String wtsfgq=null;
String wtfl=null;
String xwtsm=null;
String jgsm=null;
String sfyxsm=null;
String wtkxda =null;


String wherewtbh=cf.GB2Uni(request.getParameter("wtbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wtbh,dcqs,wtmc,sfkdx,wtsfgq,wtfl,xwtsm ";
	ls_sql+=" from  hd_scdcwt";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		dcqs=cf.fillNull(rs.getString("dcqs"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));
		wtsfgq=cf.fillNull(rs.getString("wtsfgq"));
		wtfl=cf.fillNull(rs.getString("wtfl"));
		xwtsm=cf.fillNull(rs.getString("xwtsm"));
	}
	rs.close();
	ps.close();
	 int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  hd_dcwtkxda";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	String str[]=new String[count];
	String str1[]=new String[count];
	int i=0;
	
	

%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditHd_scdcwt.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">问题编号</td>
      <td width="33%"> <input type="text" name="wtbh" size="20" maxlength="20"  value="<%=wtbh%>" readonly> 
      </td>
      <td align="right" width="13%">是否可多选</td>
      <td width="36%">
        <%
	cf.radioToken(out, "sfkdx","Y+可多选&N+单选",sfkdx);
%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">问题是否过期</td>
      <td width="33%">
        <%
	cf.radioToken(out, "wtsfgq","Y+过期&N+未过期",wtsfgq);
%>
      </td>
      <td align="right" width="13%">问题分类</td>
      <td width="36%"><select name="wtfl"  width="40">
          <option value="">&nbsp;&nbsp;</option>
          <option  value="1" >1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
          <option  value="2">2</option>
          <option  value="3">3</option>
          <option  value="4">4</option>
        </select> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
     <td align="right">允许填写说明</td>
      <td colspan="3"><input type="radio" name="sfyxsm"  value="Y">
        允许 
        <input type="radio" name="sfyxsm"  value="N" checked>
        不允许 </td>
    </tr>
	 <tr bgcolor="#FFFFFF">
      <td align="right">问题名称</td>
      <td colspan="3"><input type="text" name="wtmc" size="80" maxlength="100"  value="<%=wtmc%>" ></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td align="right">调查期数</td>
      <td colspan="3"><input type="text" name="dcqs" size="80" maxlength="100"  value="<%=dcqs%>" ></td>
    </tr>
    <%//for(int j=0;j<count;j++){
	ls_sql="select wtkxda,jgsm,sfyxsm";
	ls_sql+=" from  hd_dcwtkxda";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		
		wtkxda=cf.fillNull(rs.getString("wtkxda"));
		jgsm=cf.fillNull(rs.getString("jgsm"));
		sfyxsm=cf.fillNull(rs.getString("sfyxsm"));
		//out.print(jgsm);
		//str[i]=wtkxda;
		//str1[i]=jgsm;
		i++;
		

	%>
   
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right">可选答案 
        <%//=(1+j)%>
      </td>
      <td colspan="3"><input type="text" name="kxda" value="<%=wtkxda%>" size="80" maxlength="300" > 
        <input type="hidden" name="kxda1" value="<%=wtkxda%>" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm<%=i%>" value="<%=jgsm%>" size="80" maxlength="300" > 
        <input type="hidden" name="jgsm1" value="<%=jgsm%>" size="80" maxlength="300" ></td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
//}	
	%>
	<tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">问题说明</td>
      <td colspan="3"> <textarea name="xwtsm" cols="80" rows="" value="<%=xwtsm%>"><%=xwtsm%></textarea> </td>
    </tr>
    <input type="hidden" name="wherewtbh"  value="<%=wherewtbh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; <div align="center"> 
          <input type="button"  value="保存" onClick="CheckForm(editform)">
          <input type="reset"  value="重输">
        </div></td>
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
		if (ps != null) ps.close(); 
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
function CheckForm(oForm)
{
	
	if(	javaTrim(oForm.wtbh)=="") {
		alert("请输入[问题编号]！");
		oForm.wtbh.focus();
		return false;
	}
	if(	oForm.dcqs.value=="") {
		alert("请输入[调查期数]！");
		oForm.dcqs.focus();
		return false;
	}
	if(oForm.wtmc.value=="") {
		alert("请输入[问题名称]！");
		oForm.wtmc.focus();
		return false;
	}

	var ce=document.getElementsByName("kxda");
	for(var i=0;i<ce.length;i++)
	{
		if(ce[i].value=="")
		{
			alert("所选答案不能为空！！");
			ce[i].focus();
			return false;

		}
	}
	oForm.submit();
	
}

//-->
</SCRIPT>

