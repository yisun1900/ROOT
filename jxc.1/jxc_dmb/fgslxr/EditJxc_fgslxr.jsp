<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh="";
String dwmc="";
String dh="";
String cz="";
String jbr="";
String jbrsj="";
String shr="";
String shrsj="";
String fzr="";
String fzrsj="";
String dz="";
String khyh="";
String zh="";
String khrxm="";
String khyh1="";
String zh1="";
String khrxm1="";
String khyh2="";
String zh2="";
String khrxm2="";
String sm1="";
String sm2="";
String ydwmc=null;
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps2=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,dwmc from sq_dwxx where dwbh='"+wheredwbh+"'";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ydwmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	ls_sql="select dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2 ";
	ls_sql+=" from  jxc_fgslxr";
	ls_sql+=" where  (dwbh='"+wheredwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dh=cf.fillNull(rs.getString("dh"));
		cz=cf.fillNull(rs.getString("cz"));
		jbr=cf.fillNull(rs.getString("jbr"));
		jbrsj=cf.fillNull(rs.getString("jbrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shrsj=cf.fillNull(rs.getString("shrsj"));
		fzr=cf.fillNull(rs.getString("fzr"));
		fzrsj=cf.fillNull(rs.getString("fzrsj"));
		dz=cf.fillNull(rs.getString("dz"));
		khyh=cf.fillNull(rs.getString("khyh"));
		zh=cf.fillNull(rs.getString("zh"));
		khrxm=cf.fillNull(rs.getString("khrxm"));
		sm1=cf.fillNull(rs.getString("sm1"));
		sm2=cf.fillNull(rs.getString("sm2"));
		khyh1=cf.fillNull(rs.getString("khyh1"));
		zh1=cf.fillNull(rs.getString("zh1"));
		khrxm1=cf.fillNull(rs.getString("khrxm1"));
		khyh2=cf.fillNull(rs.getString("khyh2"));
		zh2=cf.fillNull(rs.getString("zh2"));
		khrxm2=cf.fillNull(rs.getString("khrxm2"));
	}
	else
	{
		ls_sql="insert into jxc_fgslxr ( dwbh ) ";
		ls_sql+=" values ( ? ) ";
		ps2= conn.prepareStatement(ls_sql);
		ps2.setString(1,wheredwbh);
		ps2.executeUpdate();
		ps2.close();
		dwbh=wheredwbh;

	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs !=null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn !=null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn !=null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_fgslxr.jsp" name="editform">
<div align="center">请修改信息（<%=ydwmc%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">单位编号</td> 
  <td width="35%"> 
    <input type="text" name="dwbh" size="8" maxlength="5"  value="<%=dwbh%>" readonly>
    （不可修改）</td>
  <td align="right" width="15%">单位名称</td> 
  <td width="35%"><%=ydwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">单位名称</td>
  <td colspan="3"><input type="text" name="dwmc" size="35" maxlength="100"  value="<%=dwmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">电话</td> 
  <td width="35%"> 
    <input type="text" name="dh" size="20" maxlength="50"  value="<%=dh%>" >  </td>
  <td align="right" width="15%">传真</td> 
  <td width="35%"> 
    <input type="text" name="cz" size="20" maxlength="50"  value="<%=cz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">经办人</td> 
  <td width="35%"> 
    <input type="text" name="jbr" size="20" maxlength="50"  value="<%=jbr%>" >  </td>
  <td align="right" width="15%">经办人手机</td> 
  <td width="35%"> 
    <input type="text" name="jbrsj" size="20" maxlength="50"  value="<%=jbrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">收货人</td> 
  <td width="35%"> 
    <input type="text" name="shr" size="20" maxlength="50"  value="<%=shr%>" >  </td>
  <td align="right" width="15%">收货人手机</td> 
  <td width="35%"> 
    <input type="text" name="shrsj" size="20" maxlength="50"  value="<%=shrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">负责人</td> 
  <td width="35%"> 
    <input type="text" name="fzr" size="20" maxlength="50"  value="<%=fzr%>" >  </td>
  <td align="right" width="15%">负责人手机</td> 
  <td width="35%"> 
    <input type="text" name="fzrsj" size="20" maxlength="50"  value="<%=fzrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">地址</td>
  <td colspan="3"><textarea name="dz" cols="75" rows="3"><%=dz%></textarea></td>
  </tr>
<tr bgcolor="#ccFFFF">
  <td align="right" width="15%">开户银行</td> 
  <td width="35%"><input type="text" name="khyh" size="20" maxlength="100"  value="<%=khyh%>" ></td>
  <td align="right" width="15%">开户人姓名</td> 
  <td width="35%"><input type="text" name="khrxm" size="20" maxlength="100"  value="<%=khrxm%>" ></td>
</tr>
<tr bgcolor="#ccFFFF">
  <td align="right" width="15%">账号</td> 
  <td colspan="3"> 
    <input type="text" name="zh" size="35" maxlength="100"  value="<%=zh%>" >  </td>
  </tr>
  <tr bgcolor="#FFccFF">
  <td align="right" width="15%">开户银行1</td> 
  <td width="35%"><input type="text" name="khyh1" size="20" maxlength="100"  value="<%=khyh1%>" ></td>
  <td align="right" width="15%">开户人姓名1</td> 
  <td width="35%"><input type="text" name="khrxm1" size="20" maxlength="100"  value="<%=khrxm1%>" ></td>
</tr>
<tr bgcolor="#FFccFF">
  <td align="right" width="15%">账号1</td> 
  <td colspan="3"> 
    <input type="text" name="zh1" size="35" maxlength="100"  value="<%=zh1%>" >  </td>
  </tr>
  <tr bgcolor="#FFFFcc">
  <td align="right" width="15%">开户银行2</td> 
  <td width="35%"><input type="text" name="khyh2" size="20" maxlength="100"  value="<%=khyh2%>" ></td>
  <td align="right" width="15%">开户人姓名2</td> 
  <td width="35%"><input type="text" name="khrxm2" size="20" maxlength="100"  value="<%=khrxm2%>" ></td>
</tr>
<tr bgcolor="#FFFFcc">
  <td align="right" width="15%">账号2</td> 
  <td colspan="3"> 
    <input type="text" name="zh2" size="35" maxlength="100"  value="<%=zh2%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">说明1</td>
  <td colspan="3"><textarea name="sm1" cols="75" rows="3"><%=sm1%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">说明2</td> 
  <td colspan="3"><textarea name="sm2" cols="75" rows="3"><%=sm2%></textarea></td>
  </tr>
<input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
