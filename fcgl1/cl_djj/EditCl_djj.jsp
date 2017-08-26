<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String qye=null;
String gcqye=null;
String sfjm=null;
String lrr=null;
String lrsj=null;
String fgs=null;
String bz=null;

String shr=null;
String shsj=null;
String shjl=null;
String shyj=null;

String ejshr=null;
String ejshsj=null;
String ejshjl=null;
String ejshyj=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String fgsbh=null;
String dwbh=null;

String czxh=cf.GB2Uni(request.getParameter("czxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,qye,sfjm,lrr,lrsj,dwbh,bz,shr,shsj,DECODE(shjl,'1','ͬ��','2','��ͬ��','3','���޸�') shjl,shyj,ejshr,ejshsj,DECODE(ejshjl,'1','ͬ��','2','��ͬ��','3','���޸�') ejshjl,ejshyj ";
	ls_sql+=" from  cl_djj";
	ls_sql+=" where  (czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shjl=cf.fillHtml(rs.getString("shjl"));
		shyj=cf.fillHtml(rs.getString("shyj"));
		ejshr=cf.fillHtml(rs.getString("ejshr"));
		ejshsj=cf.fillHtml(rs.getDate("ejshsj"));
		ejshjl=cf.fillHtml(rs.getString("ejshjl"));
		ejshyj=cf.fillHtml(rs.getString("ejshyj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		gcqye=cf.fillNull(rs.getString("qye"));
		sfjm=cf.fillNull(rs.getString("sfjm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgs=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,fgsbh,qye";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		qye=cf.fillNull(rs.getString("qye"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
<form method="post" action="" name="editform" target="_blank">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ͻ����</font></div>
      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">��ͬ��</font></div>
      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ͻ�����</font></div>
      </td>
      <td width="31%"> <%=khxm%> </td>
      <td width="18%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="32%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="18%" align="right"><font color="#0000CC">���ʦ</font></td>
      <td width="32%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
      </td>
      <td width="31%"><%=zjxm%> </td>
      <td width="18%"> 
        <div align="right">ǩԼ��</div>
      </td>
      <td width="32%"><%=qye%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">ʩ����</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">ʩ������</font></div>
      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="31%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="18%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="32%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ��������</td>
      <td width="31%"> <%
	cf.radioToken(out, "sfjm","1+������&2+�������",sfjm);
%> </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>����ǩԼ��</td>
      <td width="32%"> 
        <input type="text" name="qye" size="20" maxlength="10" value="<%=gcqye%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">һ����˽���</td>
      <td width="31%"><%=shjl%></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> һ�������</td>
      <td width="31%"> <%=shr%> </td>
      <td align="right" width="18%"> һ�����ʱ�� </td>
      <td width="32%"> <%=shsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">һ��������</td>
      <td colspan="3"><%=shyj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������˽���</td>
      <td width="31%"><%=shjl%></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> ���������</td>
      <td width="31%"> <%=shr%> </td>
      <td align="right" width="18%"> �������ʱ�� </td>
      <td width="32%"> <%=shsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����������</td>
      <td colspan="3"><%=shyj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#000099">¼����</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">¼��ʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#000099">�ֹ�˾</font></td>
      <td colspan="3"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="czxh"  value="<%=czxh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"   value="�鿴���" onClick="window.open('/fcgl/tjfx/kcfxList.jsp?fgs=<%=fgs%>')">
          <input type="button"  value="�鿴����ȯ��ϸ" onClick="f_ck(editform)" name="ck">
          <input type="button"  value="ѡ�����" onClick="f_lr(editform)" name="lr" >
          <input type="button"  value="�޸�" onClick="f_xg(editform)" name="xg" >
          <input type="button"  value=" �� �� " onClick="f_tj(editform)" name="tj" >
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
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sfjm)) {
		alert("��ѡ��[�Ƿ��������]��");
		FormName.sfjm[0].focus();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="SaveEditCl_djj.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	FormName.action="UpdateDlCl_djj.jsp";
	FormName.submit();
	FormName.tj.disabled=false;
	return true;
}
function f_xg(FormName)//����FormName:Form������
{
	FormName.action="Cl_djjmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	FormName.action="tjdjj.jsp?czxh="+FormName.czxh.value;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
