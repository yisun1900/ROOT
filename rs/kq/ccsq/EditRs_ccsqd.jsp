<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String dwbh=null;
String ygbh=null;
String yhmc=null;
String xb=null;
String xzzwbm=null;

String kssj=null;
String jzsj=null;
double ljts=0;
String yysm=null;

String txzsm=null;
String jtgj=null;
String zwdlr=null;
String xcsm=null;
double btbz=0;
double zsbz=0;

String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,dwbh,ygbh,yhmc,xb,xzzwbm,kssj,jzsj,ljts,yysm,lrr,lrsj,lrbm,bz,sqrq,txzsm,jtgj,zwdlr,xcsm,btbz,zsbz ";
	ls_sql+=" from  rs_ccsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		kssj=cf.fillNull(rs.getDate("kssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		ljts=rs.getDouble("ljts");

		yysm=cf.fillNull(rs.getString("yysm"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));

		txzsm=cf.fillNull(rs.getString("txzsm"));
		jtgj=cf.fillNull(rs.getString("jtgj"));
		zwdlr=cf.fillNull(rs.getString("zwdlr"));
		xcsm=cf.fillNull(rs.getString("xcsm"));
		btbz=rs.getDouble("btbz");
		zsbz=rs.getDouble("zsbz");
	
	
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_ccsqd.jsp" name="editform">
  <div align="center">�޸����루������ţ�<%=sqxh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">Ա�����</font></td>
      <td width="33%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="19%"><font color="#0000CC">Ա������</font></td>
      <td width="31%"> 
        <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">�Ա�</font></td>
      <td width="33%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
      <td align="right" width="19%"><font color="#0000CC">ְ��</font></td>
      <td width="31%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm where xzzwmc='"+xzzwbm+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#0000CC">��������</font></td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>ͬ����˵��</td>
      <td colspan="3"> 
        <input type="text" name="txzsm" value="<%=txzsm%>" size="74" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��ͨ����</td>
      <td width="33%"> 
        <input type="text" name="jtgj" value="<%=jtgj%>" size="20" maxlength="50">
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�����ڼ�ְ�������</td>
      <td width="31%"> 
        <input type="text" name="zwdlr" value="<%=zwdlr%>" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>������׼</td>
      <td width="33%"> 
        <input type="text" name="btbz" value="<%=btbz%>" size="20" maxlength="16">
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>ס�ޱ�׼</td>
      <td width="31%"> 
        <input type="text" name="zsbz" value="<%=zsbz%>" size="20" maxlength="16">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>�г�˵��</td>
      <td colspan="3"> 
        <input type="text" name="xcsm" value="<%=xcsm%>" size="74" maxlength="200">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��ʼʱ��</td>
      <td width="33%"> 
        <input type="text" name="kssj" value="<%=kssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>����ʱ��</td>
      <td width="31%"> 
        <input type="text" name="jzsj" value="<%=jzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>�ۼ�����</td>
      <td width="33%"> 
        <input type="text" name="ljts" value="<%=ljts%>" size="20" maxlength="10">
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>ԭ��˵��</td>
      <td colspan="3"> 
        <textarea name="yysm" cols="73" rows="3"><%=yysm%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="33%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>��������</td>
      <td width="31%"> 
        <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("������[�������]��");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}


	if(	javaTrim(FormName.txzsm)=="") {
		alert("��ѡ��[ͬ����˵��]��");
		FormName.txzsm.select();
		return false;
	}
	if(	javaTrim(FormName.jtgj)=="") {
		alert("��ѡ��[��ͨ����]��");
		FormName.jtgj.select();
		return false;
	}
	if(	javaTrim(FormName.btbz)=="") {
		alert("��ѡ��[������׼]��");
		FormName.btbz.select();
		return false;
	}
	if(!(isFloat(FormName.btbz, "������׼"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbz)=="") {
		alert("��ѡ��[ס�ޱ�׼]��");
		FormName.zsbz.select();
		return false;
	}
	if(!(isFloat(FormName.zsbz, "ס�ޱ�׼"))) {
		return false;
	}
	if(	javaTrim(FormName.zwdlr)=="") {
		alert("��ѡ��[�����ڼ�ְ�������]��");
		FormName.zwdlr.select();
		return false;
	}
	if(	javaTrim(FormName.xcsm)=="") {
		alert("��ѡ��[�г�˵��]��");
		FormName.xcsm.select();
		return false;
	}

	if(	javaTrim(FormName.kssj)=="") {
		alert("��ѡ��[��ʼʱ��]��");
		FormName.kssj.select();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.jzsj.select();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "����ʱ��"))) {
		return false;
	}

	if (FormName.kssj.value>FormName.jzsj.value)
	{
		alert("����[��ʼʱ��]���ܴ���[����ʱ��]��");
		FormName.jzsj.select();
		return false;
	}



	if(	javaTrim(FormName.ljts)=="") {
		alert("��ѡ��[�ۼ�����]��");
		FormName.ljts.focus();
		return false;
	}
	if(!(isFloat(FormName.ljts, "�ۼ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yysm)=="") {
		alert("������[ԭ��˵��]��");
		FormName.yysm.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
