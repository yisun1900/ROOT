<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String dm=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");

String fgs=null;
String sqbm=null;
String zbzw=null;
String zprs=null;
String zpfy=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xbyq=null;
String hyyq=null;
String nlyq=null;
String xl=null;
String zy=null;
String wy=null;
String jsjnl=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String bz=null;
String wherezpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgs,sqbm,zbzw,zprs,zpfy,zbly,zbqt,xwdgsj,xbyq,hyyq,nlyq,xl,zy,wy,jsjnl,gzjy,gx,jn,qt,rygznr,bz ";
	ls_sql+=" from  rs_zpsq";
	ls_sql+=" where  (zpsqbh='"+wherezpsqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgs=cf.fillNull(rs.getString("fgs"));
		sqbm=cf.fillNull(rs.getString("sqbm"));
		zbzw=cf.fillNull(rs.getString("zbzw"));
		zprs=cf.fillNull(rs.getString("zprs"));
		zpfy=cf.fillNull(rs.getString("zpfy"));
		zbly=cf.fillNull(rs.getString("zbly"));
		zbqt=cf.fillNull(rs.getString("zbqt"));
		xwdgsj=cf.fillNull(rs.getDate("xwdgsj"));
		xbyq=cf.fillNull(rs.getString("xbyq"));
		hyyq=cf.fillNull(rs.getString("hyyq"));
		nlyq=cf.fillNull(rs.getString("nlyq"));
		xl=cf.fillNull(rs.getString("xl"));
		zy=cf.fillNull(rs.getString("zy"));
		wy=cf.fillNull(rs.getString("wy"));
		jsjnl=cf.fillNull(rs.getString("jsjnl"));
		gzjy=cf.fillNull(rs.getString("gzjy"));
		gx=cf.fillNull(rs.getString("gx"));
		jn=cf.fillNull(rs.getString("jn"));
		qt=cf.fillNull(rs.getString("qt"));
		rygznr=cf.fillNull(rs.getString("rygznr"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {font-size: 12px}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_zpsq.jsp" name="editform">
<div align="center">�޸���Ƹ����</div>
<div align="left" class="STYLE1"><span class="STYLE2">�����ţ�<%=wherezpsqbh  %></span></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ�ֹ�˾</td> 
  <td width="35%"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,sqbm,<%=dwstr%>)">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fgs);
	}
%>
    </select>
  </td>
  <td align="right" width="15%">���벿��</td> 
  <td width="35%"> 
    <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",sqbm);
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh",sqbm);
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dm+"'",sqbm);
	}
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ְ��</td> 
  <td width="35%"> 
    <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm",zbzw);
%>
    </select>
  </td>
   <td align="right" width="15%">����Ա��</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8"  value="<%=zprs%>" >
  </td> 
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9"  value="<%=zpfy%>" >
  </td>
  <td align="right" width="15%">ϣ������ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" size="20" maxlength="10"  value="<%=xwdgsj%>" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
    <option value=""></option>
<%
	cf.selectToken(out,"1+ȱԱ����&2+�������&3+��������&0+����",zbly);
%>
    </select>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20"  value="<%=zbqt%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ա�Ҫ��</td> 
  <td width="35%"> 
    <select name="xbyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+��&2+Ů",xbyq);
%>
    </select>
  </td>
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <select name="hyyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+�ѻ�&2+δ��",hyyq);
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="nlyq" size="20" maxlength="50"  value="<%=nlyq%>" >
  </td>
  <td align="right" width="15%">��������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="50"  value="<%=gzjy%>" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ѧ��Ҫ��</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+��ר&2+��ѧ&3+˶ʿ",xl);
%>
    </select>
  </td>
  <td align="right" width="15%">רҵҪ��</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="50"  value="<%=zy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="50"  value="<%=wy%>" >
  </td>
  <td align="right" width="15%">���������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="jsjnl" size="20" maxlength="50"  value="<%=jsjnl%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="50"  value="<%=gx%>" >
  </td>
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="50"  value="<%=jn%>" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">

  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200"  value="<%=qt%>" >
  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ա��������</td> 
  <td width="35%" colspan="3"> 
    <textarea name="rygznr" cols="72" rows=""><%=rygznr%></textarea>
  </td>
 </tr> 
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="72" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpsqbh"  value="<%=wherezpsqbh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
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
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "0")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("������[��Ƹ�ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sqbm)=="") {
		alert("������[���벿��]��");
		FormName.sqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("��ѡ��[����ְ��]��");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zprs)=="") {
		alert("������[����Ա��]��");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "����Ա��"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("������[��Ƹ����]��");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "��Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zbly)=="") {
		alert("��ѡ��[��������]��");
		FormName.zbly.focus();
		return false;
	}
	if(	javaTrim(FormName.xwdgsj)=="") {
		alert("������[ϣ������ʱ��]��");
		FormName.xwdgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "ϣ������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xbyq)=="") {
		alert("��ѡ��[�Ա�Ҫ��]��");
		FormName.xbyq.focus();
		return false;
	}
	if(	javaTrim(FormName.hyyq)=="") {
		alert("��ѡ��[����Ҫ��]��");
		FormName.hyyq.focus();
		return false;
	}
	if(	javaTrim(FormName.nlyq)=="") {
		alert("������[����Ҫ��]��");
		FormName.nlyq.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("��ѡ��[ѧ��Ҫ��]��");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("������[רҵҪ��]��");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("������[��������Ҫ��]��");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.jsjnl)=="") {
		alert("������[���������Ҫ��]��");
		FormName.jsjnl.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("������[��������Ҫ��]��");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("������[����Ҫ��]��");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("������[����Ҫ��]��");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.qt)=="") {
		alert("������[����Ҫ��]��");
		FormName.qt.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("������[������Ա��������]��");
		FormName.rygznr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
