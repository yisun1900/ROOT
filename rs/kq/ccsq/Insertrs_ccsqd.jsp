<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String yhmc=null;
String xb=null;
String fgsbh=null;
String dwbh=null;
String xzzwbm=null;
String rzsj=null;
String lzrq=null;
String lzyy=null;

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sqxh=null;

try {
	conn=cf.getConnection();

	ls_sql="select yhmc,xb,ssfgs,dwbh,xzzwbm,rzsj,lzrq,lzyy";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		lzrq=cf.fillNull(rs.getDate("lzrq"));
		lzyy=cf.fillNull(rs.getString("lzyy"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(sqxh,6,5)),0)";
	ls_sql+=" from  rs_ccsqd";
	ls_sql+=" where fgsbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqxh=fgsbh+cf.addZero(count+1,5);

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



<form method="post" action="SaveInsertRs_ccsqd.jsp" name="insertform" target="_blank">
  <div align="center">��������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">�������</font></td>
      <td width="33%"> 
        <input type="text" name="sqxh" value="<%=sqxh%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">Ա�����</font></td>
      <td width="33%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">Ա������</font></td>
      <td width="32%"> 
        <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">�Ա�</font></td>
      <td width="33%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">ְ��</font></td>
      <td width="32%"> 
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
      <td align="right" width="18%"><font color="#0000CC">��������</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="39" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>ͬ����˵��</td>
      <td colspan="3">
        <input type="text" name="txzsm" value="" size="74" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��ͨ����</td>
      <td width="33%"> 
        <input type="text" name="jtgj" value="" size="20" maxlength="50">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�����ڼ�ְ�������</td>
      <td width="32%"> 
        <input type="text" name="zwdlr" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>������׼</td>
      <td width="33%"> 
        <input type="text" name="btbz" value="" size="20" maxlength="16">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>ס�ޱ�׼</td>
      <td width="32%"> 
        <input type="text" name="zsbz" value="" size="20" maxlength="16">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>�г�˵��</td>
      <td colspan="3">
        <input type="text" name="xcsm" value="" size="74" maxlength="200">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��ʼʱ��</td>
      <td width="33%"> 
        <input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>����ʱ��</td>
      <td width="32%"> 
        <input type="text" name="jzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>�ۼ�����</td>
      <td width="33%"> 
        <input type="text" name="ljts" value="" size="20" maxlength="10">
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>ԭ��˵��</td>
      <td colspan="3"> 
        <textarea name="yysm" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
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
      <td align="right" width="18%"><font color="#CC0000">*</font>��������</td>
      <td width="32%"> 
        <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
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
