<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String djjlh=null;
String khbh=null;
String gcjdbm=null;
String djsj=null;
String lrr=null;
String lrsj=null;
String lrdw=null;
String bz=null;
String sfszhf=null;
String wheredjjlh=cf.GB2Uni(request.getParameter("djjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String jhybgcrq=null;
String jhzqsj=null;

String hfcsbzStr="";

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="select djjlh,khbh,gcjdbm,djsj,lrr,lrsj,lrdw,bz,sfszhf ";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where  (djjlh='"+wheredjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		djjlh=cf.fillNull(rs.getString("djjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		bz=cf.fillNull(rs.getString("bz"));
		sfszhf=cf.fillNull(rs.getString("sfszhf"));
	}
	rs.close();
	ps.close();

	if (sfszhf.equals("1"))
	{
		hfcsbzStr="<B><font color=\"#CC0000\">���Զ����ÿͷ��طã�</font></B>";
	}

	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm,jhybgcrq,jhzqsj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		jhybgcrq=cf.fillNull(rs.getDate("jhybgcrq"));
		jhzqsj=cf.fillNull(rs.getDate("jhzqsj"));
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
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���޸�ʵ�ʿ����Ǽǣ��ǼǼ�¼�ţ�<%=djjlh%>��<%=hfcsbzStr%></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                �ͻ�����              </td>
              <td width="32%"> <%=khxm%></td>
              <td width="18%" align="right"> 
                ��ͬ��              </td>
              <td width="32%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td width="32%"><%=fwdz%></td>
              <td width="18%" align="right">���̵���</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                ǩԼ����              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%" align="right"> 
                ���ʦ              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                ǩԼ����              </td>
              <td width="32%"><%=qyrq%> </td>
              <td width="18%" align="right"> 
                ����ǩԼ��              </td>
              <td width="32%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                ʩ����              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%" align="right"> 
                �೤              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">��ͬ��������</td>
              <td width="32%"><font color="#000000"><%=kgrq%></font></td>
              <td width="18%" align="right">��ͬ��������</td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">ʵ�ʿ�������</td>
              <td width="32%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="18%" align="right">ʵ�ʿ�������</td>
              <td width="32%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>���̽���              </td>
              <td width="32%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm order by gcjdbm",gcjdbm,false);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>�೤</td>
              <td width="32%"><select name="sgbz" size="1" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value="" selected></option>
                <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' and tdbz='N' order by bzmc",sgbz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�ƻ����ι�����������</td>
              <td><input type="text" name="jhybrq" value="<%=jhybgcrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right"><font color="#CC0000">*</font>�ƻ���������ʱ��</td>
              <td><input type="text" name="jhzqrq" value="<%=jhzqsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000CC">¼����</font> </td>
              <td width="32%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>ʵ�ʿ���ʱ��</td>
              <td width="32%"><input type="text" name="djsj" size="20" maxlength="10"  value="<%=djsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000CC">¼�뵥λ</font> </td>
              <td width="32%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font> </td>
              <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="4"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="djjlh"  value="<%=djjlh%>" >
            <tr> 
              <td height="2" colspan="4" align="center">   
                 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_lr(editform)" name="lr" >
                  <input type="button"  value="�鿴��Ƭ" onClick="f_ck(editform)" name="ck" >
                  <input type="button"  value="¼��ʩ���Ӵ���" onClick="f_lrcf(editform)" name="lrcf" >
              <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
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
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("��ѡ��[���̽���]��");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.djsj)=="") {
		alert("������[ʵ�ʿ���ʱ��]��");
		FormName.djsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.djsj, "ʵ�ʿ���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jhybrq)=="") {
		alert("������[�ƻ���������]��");
		FormName.jhybrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhybrq, "�ƻ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.jhzqrq)=="") {
		alert("������[�ƻ���������]��");
		FormName.jhzqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhzqrq, "�ƻ���������"))) {
		return false;
	}

	if(	javaTrim(FormName.sgbz)=="") {
		alert("������[�೤]��");
		FormName.sgbz.focus();
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrdw.focus();
		return false;
	}


	FormName.action="SaveEditCrm_gcjddjjl.jsp";
	FormName.submit();
	return true;
}
function f_lrcl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("������[�ǼǼ�¼��]��");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="InsertCrm_cljcmx.jsp";
	FormName.submit();
	return true;
}

function f_ckcl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("������[�ǼǼ�¼��]��");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="Crm_cljcmxList.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("������[�ǼǼ�¼��]��");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="/gcgl/gcjdgz/loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("������[�ǼǼ�¼��]��");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="/gcgl/gcjdgz/viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_lrcf(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("������[�ǼǼ�¼��]��");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="/sgdgl/xjgd/InsertKp_xjgdjl.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

