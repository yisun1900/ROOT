<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String hth=null;
String sjs=null;
String qye=null;
String sfyyh=null;
String yhyy=null;
String fzxm=null;
String qyrq=null;
String kgrq=null;
String zkrq=null;
String jgrq=null;
String skje=null;
String skrq=null;
String zkje=null;
String hdbz=null;
String khlxbm=null;
String ybjbh=null;
String bz=null;
String ybjss=null;

String cgdz=null;
String hdr=null;
String hdsfss=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ybjss,khxm,xb,fwdz,cqbm,lxfs,hxbm,fgflbm,zxjwbm,ysbm,hxmjbm,fwmj,pmjj,hth,sjs,qye,sfyyh,yhyy,qyrq,kgrq,hdbz,khlxbm,bz,jgrq,ybjbh,cgdz,hdr,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
	}
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<title>核实回单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 核实回单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_khxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#0000FF">回单标志</font>              </td>
              <td width="34%"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
              <td width="16%" align="right"> 
                <font color="#0000FF">回单人</font>              </td>
              <td width="34%"><%=hdr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000FF">回单工地</font></td>
              <td colspan="3"> <%=cgdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#990000">*</font>回单是否属实              </td>
              <td width="34%"> 
                <select name="hdsfss" style="FONT-SIZE:12PX;WIDTH:152PX">
					<option value=""></option>
                  <%
	cf.selectToken(out,"Y+属实&N+不属实",hdsfss);
%> 
              </select>              </td>
              <td width="16%">              </td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td height="2" colspan="4" align="center"> 
                
                  <input type="button"  value="保存" onClick="f_do(editform)">                             
                <input type="reset"  value="重输">              </td>
            </tr>
          </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.hdsfss)=="") {
		alert("请输入[回单是否属实]！");
		FormName.hdsfss.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
