<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sjbh=null;
String fklxbm=null;
String fkje=null;
String jkr=null;
String skr=null;
String sksj=null;
String skdw=null;
String lrr=null;
String lrsj=null;
String shbz=null;
String shr=null;
String shsj=null;
String bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String fkcsmc=null;
double yfkbl=0;
double yfkje=0;
String gysbh=null;
String ddbh=null;
String zcgysbh=null;
String zcddbh=null;

String skdd=null;
String dsksjbz=null;
String sjr=null;
String sjsj=null;

String khxm="";
String fwdz="";
String lxfs="";
String sjs="";
String qye="";
String hth="";
String dwbh="";
String sgd="";
String zjxm="";
String qyrq="";
String zt="";
String shyj="";

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gysbh,ddbh,zcgysbh,zcddbh,cw_khfkjl.shyj,skdd,dsksjbz,sjr,sjsj,zckx,lrdw,khbh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr,lrsj,bz,zffs,fkcsmc,cw_khfkjl.yfkbl,yfkje ";
	ls_sql+=" from  cw_khfkjl,cw_fkcs";
	ls_sql+=" where cw_khfkjl.fkcs=cw_fkcs.fkcs(+) and fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysbh=cf.fillNull(rs.getString("gysbh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		shyj=cf.fillNull(rs.getString("shyj"));
		skdd=cf.fillNull(rs.getString("skdd"));
		dsksjbz=cf.fillNull(rs.getString("dsksjbz"));
		sjr=cf.fillNull(rs.getString("sjr"));
		sjsj=cf.fillNull(rs.getDate("sjsj"));

		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkje=cf.fillNull(rs.getString("fkje"));
		jkr=cf.fillNull(rs.getString("jkr"));
		skr=cf.fillNull(rs.getString("skr"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skdw=cf.fillNull(rs.getString("skdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zffs=cf.fillNull(rs.getString("zffs"));
		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		yfkbl=rs.getDouble("yfkbl");
		yfkje=rs.getDouble("yfkje");
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,qyrq,zjxm,zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		hth=cf.fillNull(rs.getString("hth"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zt=cf.fillNull(rs.getString("zt"));
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,fwdz,lxfs,sjs,zxdm";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			dwbh=cf.fillNull(rs.getString("zxdm"));
		}
	}
	rs.close();
	ps.close();

	if (skr.equals(yhmc))
	{
//		out.println("���󣡡��տ��ˡ��롾����ˡ�������ͬ");
//		return;
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

<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"><div align="center">������ˣ�<font color="#0000CC">�տ���ţ�<%=fkxh%></font>��</div></td>
  </tr>
  <tr>
    <td width="100%" ><div align="center">
      <form method="post" action="SaveEditCw_khfkjl.jsp" name="editform">
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">�ͻ����</font></td>
            <td width="30%"><%=khbh%></td>
            <td width="20%" align="right"><font color="#0000CC">��ͬ��</font></td>
            <td width="30%"><%=hth%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">�ͻ�����</font> </td>
            <td width="30%"><%=khxm%></td>
            <td width="20%" align="right"><font color="#0000CC">ǩԼ����</font> </td>
            <td width="30%"><%=qyrq%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
            <td colspan="3"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">���ʦ</font> </td>
            <td width="30%"><%=sjs%></td>
            <td width="20%" align="right"><font color="#0000CC">�ʼ�����</font> </td>
            <td width="30%"><%=zjxm%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">ʩ����</font> </td>
            <td width="30%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
            </td>
            <td width="20%" align="right"><font color="#0000CC">ǩԼ��</font> </td>
            <td width="30%"><%=qye%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right">�տ�����</td>
            <td width="30%"><%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+fklxbm+"'",fklxbm,true);
%>
            <td width="20%" align="right">�տ�����</td>
            <td width="30%"><%=fkcsmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td height="2" align="right">Ӧ�տ����</td>
            <td height="2"><%=yfkbl%> % </td>
            <td height="2" bgcolor="#FFFFFF" align="right">Ӧ�տ���</td>
            <td height="2"><%=yfkje%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td bgcolor="#FFFFFF" align="right">֧����ʽ</td>
            <td><%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm where zffsbm='"+zffs+"'",zffs);
%>
            </td>
            <td align="right">�վݱ��</td>
            <td><%=sjbh%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td bgcolor="#FFFFFF" align="right">�տ�Ʒ��</td>
            <td><%=gysbh%></td>
            <td align="right">�տ�����</td>
            <td><%=ddbh%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right">ת�ʿ���</td>
            <td width="30%"><%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+zckx+"'",zckx);
%></td>
            <td width="20%" align="right">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">ת��Ʒ��</td>
            <td><%=zcgysbh%></td>
            <td align="right">ת�ʶ������</td>
            <td><%=zcddbh%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"> �տ��� </td>
            <td width="30%"><%=skr%> </td>
            <td width="20%" align="right"> �տ�ʱ�� </td>
            <td width="30%"><%=sksj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">�տλ</font> </td>
            <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'",skdw,true);
%>
            </td>
            <td width="20%" align="right" bgcolor="#FFFFFF"></td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#0000CC">¼����</font> </td>
            <td width="30%"><%=lrr%> </td>
            <td width="20%" align="right"><font color="#0000CC">¼��ʱ��</font> </td>
            <td width="30%"><%=lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right">�Ƿ������</td>
            <td width="30%"><%
	cf.selectToken(out,"1+�������&2+�����",skdd,true);
%></td>
            <td width="20%" align="right">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">��ע</td>
            <td colspan="3"><%=bz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td colspan="4" bgcolor="#CCFFCC">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#FF0000">*</font>��˽��</td>
            <td><%
	cf.radioToken(out,"dsksjbz","Y+���ͨ��&M+���δͨ��",dsksjbz);
%></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�����</font></td>
            <td width="30%"><input type="text" name="sjr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
            </td>
            <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���ʱ��</font></td>
            <td width="30%"><input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="20%" align="right"><font color="#FF0000">*</font>�տ���ɸģ�</td>
            <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" >
            </td>
            <td align="right"><font color="#FF0000">*</font>�����տ�ʱ��</td>
            <td><input type="text" name="sjsj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">������</td>
            <td colspan="3"><textarea name="shyj" cols="71" rows="5"><%=shyj%></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center"><input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="fkxh"  value="<%=fkxh%>" >
                  <input name="button" type="button" onClick="f_do(editform)"  value="����">
                  <input name="reset" type="reset"  value="����">
                  <input type="button" value="�鿴�տ���Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
            </td>
          </tr>
        </table>
      </form>
    </div></td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjr)=="") {
		alert("������[�����]��");
		FormName.sjr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsj)=="") {
		alert("������[�����տ�ʱ��]��");
		FormName.sjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjsj, "�����տ�ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "�տ���"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("����[�տ���]����Ϊ0");
		FormName.fkje.select();
		return false;
	}

	if(	!radioChecked(FormName.dsksjbz)) {
		alert("��ѡ��[��˽��]��");
		FormName.dsksjbz[0].focus();
		return false;
	}

	if (FormName.dsksjbz[1].checked)
	{
		if(	javaTrim(FormName.shyj)=="") {
			alert("������[������]��");
			FormName.shyj.focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
