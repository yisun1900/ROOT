<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>


<%
String lrr=(String)session.getAttribute("yhmc");

String dqbm=null;
String xqmc=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
String zlhxmj=null;
String lxsj=null;
String fyssj=null;
String jfhs=null;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String fgsbh=null;
String xqbh=cf.GB2Uni(request.getParameter("xqbh"));

String dwdz=null;
String dwdh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw,fgsbh ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (xqbh='"+xqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		jw=cf.fillNull(rs.getString("jw"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dwdz,dwdh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="SaveInsertYx_xqcxhdgl.jsp" name="insertform" target="_blank">
<div align="center">¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">С������</td>
      <td width="31%"><%=xqmc%></td>
      <td align="right" width="20%">��ַ</td>
      <td width="30%"><%=dz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������</td>
      <td width="31%"><%=kfs%></td>
      <td align="right" width="20%">�绰</td>
      <td width="30%"><%=kfslxrdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������ϵ��</td>
      <td width="31%"><%=kfslxr%> </td>
      <td align="right" width="20%">��������ϵ��ְ��</td>
      <td width="30%"><%=kfslxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ҵ��˾����</td>
      <td colspan="3"><%=wygsmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ҵ��ϵ��</td>
      <td width="31%"><%=wylxr%> </td>
      <td align="right" width="20%">��ҵ��ϵ��ְ��</td>
      <td width="30%"><%=wylxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ҵ�绰</td>
      <td width="31%"><%=wydh%> </td>
      <td align="right" width="20%">����ʱ��</td>
      <td width="30%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Կ��ʱ��</td>
      <td width="31%"><%=fyssj%> </td>
      <td align="right" width="20%">��������</td>
      <td width="30%"><%=jfhs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������</td>
      <td width="31%"><%=zlhx%> </td>
      <td align="right" width="20%">�����������</td>
      <td width="30%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ҵ��ʽ</td>
      <td width="31%"><%=wyxs%> </td>
      <td align="right" width="20%">��λ</td>
      <td width="30%"><%=jw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">С��������</td>
      <td width="31%"><%=xqfzr%> </td>
      <td align="right" width="20%">С�������˵绰</td>
      <td width="30%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¥������</td>
      <td width="31%"><%=xz%> </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��˾</td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ַ</td>
      <td width="31%"><%=dwdz%></td>
      <td align="right" width="20%">�绰</td>
      <td width="30%"><%=dwdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">С��<span class="STYLE1"><span class="STYLE2">��������</span></span>����</td>
      <td colspan="3">
        <input type="text" name="xqhdmc" value="" size="74" maxlength="50" >
        <span class="STYLE1">�</span> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�г���������</td>
      <td width="31%"> 
        <input type="text" name="scbfzr" value="" size="20" maxlength="20" >      </td>
      <td align="right" width="20%">�г��������˵绰</td>
      <td width="30%"> 
        <input type="text" name="scbfzrdh" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�г���������</td>
      <td width="31%"> 
        <input type="text" name="scbzrs" value="" size="20" maxlength="8" >      </td>
      <td align="right" width="20%">�г����Ƿ����</td>
      <td width="30%"> 
        <select name="scbsffz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="N">δ����</option>
          <option value="Y">����</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�߼���װ��������</td>
      <td width="31%"> 
        <input type="text" name="gjjzgwrs" value="" size="20" maxlength="8" >      </td>
      <td align="right" width="20%">��Ա�춯��</td>
      <td width="30%"> 
        <input type="text" name="ryydl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ƻ���ʼʱ��</td>
      <td><input name="lhkssj" type="text" id="lhkssj" value="" size="20" maxlength="10" ></td>
      <td align="right">�ƻ�����ʱ��</td>
      <td><input name="jhjssj" type="text" id="jhjssj" value="" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����������</td>
      <td><input name="sqlxcs" type="text" id="sqlxcs" value="" size="20" maxlength="8" ></td>
      <td align="right">���ڱ����Ƿ�ȱʧ</td>
      <td><input type="radio" name="bgsfqs" value="Y">
        ��
        <input type="radio" name="bgsfqs" value="N">
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">Ԥ�Ʒ���</td>
      <td width="31%"> 
        <input type="text" name="yjfy" value="" size="20" maxlength="16" >      </td>
      <td align="right" width="20%">Ԥ�Ʋ���</td>
      <td width="30%"> 
        <input type="text" name="yjcc" value="" size="20" maxlength="16" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����Ŀ��</td>
      <td colspan="3"><textarea name="fymd" cols="73" rows="2" id="fymd"></textarea></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">���������</td>
      <td colspan="3"><textarea name="lxjlcf" cols="73" rows="2" id="lxjlcf"></textarea></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td align="right">�ֽ׶ο�������</td>
      <td colspan="3"><textarea name="fjdkhzq" cols="73" rows="4" id="fjdkhzq"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ֽ׶�Ԥ�Ʒ���</td>
      <td colspan="3"><textarea name="fjdyjfy" cols="73" rows="4" id="fjdyjfy"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ֽ׶�Ԥ�Ʋ���</td>
      <td colspan="3"><textarea name="fjdyjcc" cols="73" rows="4" id="fjdyjcc"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����Ǳ��</td>
      <td width="31%"> 
        <select name="kfql" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
        </select>      </td>
      <td align="right" width="20%">������ʽ</td>
      <td width="30%"> 
        <input type="text" name="kfxs" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����Ŀ��</td>
      <td colspan="3"><textarea name="kfmb" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��������</td>
      <td colspan="3"><textarea name="kfms" cols="73" rows="3" id="kfms"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼����</td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="20%">¼��ʱ��</td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="xqbh"  value="<%=xqbh%>" >
        <input type="hidden" name="xqmc"  value="<%=xqmc%>" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xqbh)=="") {
		alert("������[С�����]��");
		FormName.xqbh.focus();
		return false;
	}
	if(!(isNumber(FormName.xqbh, "С�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqhdmc)=="") {
		alert("������[С�������]��");
		FormName.xqhdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[��˾����]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("������[С������]��");
		FormName.xqmc.focus();
		return false;
	}
	if(!(isNumber(FormName.scbzrs, "�г���������"))) {
		return false;
	}
	if(!(isNumber(FormName.gjjzgwrs, "�߼���װ��������"))) {
		return false;
	}
	if(!(isFloat(FormName.ryydl, "��Ա�춯��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lhkssj, "�ƻ���ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.sqlxcs, "�����������"))) {
		return false;
	}
	if(	javaTrim(FormName.yjfy)=="") {
		alert("������[Ԥ�Ʒ���]��");
		FormName.yjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.yjfy, "Ԥ�Ʒ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yjcc)=="") {
		alert("������[Ԥ�Ʋ���]��");
		FormName.yjcc.focus();
		return false;
	}
	if(!(isNumber(FormName.yjcc, "Ԥ�Ʋ���"))) {
		return false;
	}
	if(	javaTrim(FormName.kfmb)=="") {
		alert("������[����Ŀ��]��");
		FormName.kfmb.focus();
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
