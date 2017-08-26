<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String dqbm=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String nlqjbm=null;
String zybm=null;
String ysrbm=null;

String hth=null;
String smhtbh=null;
String sfzhm=null;
String kgsjqd=null;
String jyjdrq=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String gqts=null;

String dhqh=null;
String khlxfs="";


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,xb,fwdz,lxfs,qtdh,email,cqbm,xqbm,jiedao,louhao,nlqjbm,zybm,ysrbm ";
	ls_sql+=" ,hth,smhtbh,sfzhm,kgsjqd,jyjdrq,qyrq,kgrq,jgrq,gqts ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		louhao=cf.fillNull(rs.getString("louhao"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));



		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));

		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		gqts=cf.fillNull(rs.getString("gqts"));

	}
	rs.close();
	ps.close();

	String lxr="";
	String lx="";
	String getdhqh="";
	String qhdh="";
	String dhhm="";
	String fenji="";
	ls_sql="select qhdh,lxr,dhhm,fj,dhqh,lx ";
	ls_sql+=" from  crm_khlxfs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qhdh=cf.fillNull(rs.getString("qhdh"));
		lxr=cf.fillNull(rs.getString("lxr"));
		dhhm=cf.fillNull(rs.getString("dhhm"));
		fenji=cf.fillNull(rs.getString("fj"));
		getdhqh=cf.fillNull(rs.getString("dhqh"));
		lx=cf.fillNull(rs.getString("lx"));

		khlxfs+=lxr+"^"+lx+"^"+dhqh+"^"+qhdh+"^"+dhhm+"^"+fenji+"*";
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm,dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
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
		if (ps!= null) ps.close(); 
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
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">�޸ģ��ͻ�������Ϣ���ͻ���ţ�<%=khbh%>����<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_khxx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right"><font color="#0000FF">��ͬ��</font></td>
              <td width="32%"><%=hth%></td>
              <td width="18%" align="right"><font color="#0000FF">�����ͬ���</font></td>
              <td width="32%"><%=smhtbh%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�ͻ����� </td>
              <td><input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >              </td>
              <td align="right"><font color="#CC0000">*</font>�Ա� </td>
              <td><%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000FF">��ϵ��ʽ</font></td>
              <td colspan="3"><input type="text" name="lxfs" size="70" maxlength="100"  value="<%=lxfs%>" readonly>
                  <input type="hidden" name="khlxfs" value="<%=khlxfs%>"  >
                  <input name="button" type="button" onClick="if (javaTrim(khxm)=='') {alert('¼��[�ͻ�����]');khxm.select();return false;};window.open('/dhzx/dhzx/getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="¼��绰""></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�����ʼ�</td>
              <td colspan="3"><input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                  <font color="#FF0000">(ע�⣺�ж������<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>��������</td>
              <td><select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%>
                </select>              </td>
              <td align="right">�ֵ�</td>
              <td><input name="jiedao" type="text" value="<%=jiedao%>" onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" size="20" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" height="2"><font color="#CC0000">*</font>С��</td>
              <td height="2"><input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(insertform)"></td>
              <td height="2" align="right">¥��</td>
              <td height="2"><input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" height="2">&nbsp;</td>
              <td height="2" colspan="3">ע�⣺<font color="#0000FF">���ݵ�ַ</font>���������ֵ���С����¥�ţ��Զ����ɣ�����¼��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000FF">���ݵ�ַ</font> </td>
              <td colspan="3"><input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td><select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%>
                </select>              </td>
              <td align="right">ְҵ</td>
              <td><select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������</td>
              <td><select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%>
                </select>              </td>
              <td align="right">ҵ�����֤����</td>
              <td><input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" ></td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
              <input type="reset"  value="����"></td>
            <input type="hidden" name="khbh"  value="<%=khbh%>" >
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
function cf_fwdz(FormName)
{  
	FormName.jiedao.value=strTrim(FormName.jiedao.value);
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//����FormName:Form������
{
	cf_fwdz(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("������[¥��/���ƺ�]��");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}


	if(!(isSfzhm(FormName.sfzhm, "���֤����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
