<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String xjwtflbm=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
double jlje=0;


String xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kp_xjgdjl.jlje,khbh,xjr,xjsj,xjlxbm,lrr,lrsj,kp_xjgdjl.bz,xjjgbm,sgdmc,xjwtflbm ";
	ls_sql+=" from  kp_xjgdjl,sq_sgd";
	ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and  (xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlje=rs.getDouble("jlje");
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		xjjgbm=cf.fillNull(rs.getString("xjjgbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		xjwtflbm=cf.fillNull(rs.getString("xjwtflbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
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
      <div align="center">���޸�ʩ���Ӽ���¼������¼�ţ�<%=xjjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#000099">�ͻ����</font>              </td>
              <td width="32%"><%=khbh%> </td>
              <td width="18%" align="right"> 
              <font color="#000099">ʵ��������</font>              </td>
              <td width="32%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right"><font color="#000099">��ϵ��ʽ</font></td>
              <td width="32%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">���ʦ</font></td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right"><font color="#000099">ʩ����</font></td>
              <td width="32%"><%=sgd%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">�ʼ�����</font></td>
              <td width="32%"><%=zjxm%></td>
              <td width="18%" align="right"><font color="#000099">ʩ������</font></td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>�������              </td>
              <td width="32%"> 
                <select name="xjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm);
%> 
                </select>              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>�����              </td>
              <td width="32%">
<select name="xjjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xjjgbm,xjjgmc from dm_xjjgbm order by xjjgbm",xjjgbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������</td>
              <td><select name="xjwtflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select xjwtflbm,xjwtflmc from dm_xjwtflbm order by xjwtflbm",xjwtflbm);
%>
              </select></td>
              <td align="right"><font color="#FF0000">*</font>�������</td>
              <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="16" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>�����              </td>
              <td width="32%"> 
              <input type="text" name="xjr" size="20" maxlength="20"  value="<%=xjr%>" >              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>���ʱ��              </td>
              <td width="32%"> 
              <input type="text" name="xjsj" size="20" maxlength="10"  value="<%=xjsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000CC">¼����</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="xjjlh"  value="<%=xjjlh%>" >
            <tr> 
              <td height="2" colspan="4" align="center">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button"  value="����¼��" onClick="window.open('PlInsertKp_xjgdmx.jsp?xjjlh=<%=xjjlh%>')" name="lr2" >
                  <input type="button"  value="����¼��" onClick="window.open('yrk_lrxxmain.jsp?xjjlh=<%=xjjlh%>')" name="lr" >
                  <input type="button"  value="�鿴�����ϸ" onClick="window.open('Kp_xjgdmxList.jsp?xjjlh=<%=xjjlh%>')" name="cx" >
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_lrzp(editform)" name="lrzp" >
                  <input type="button"  value="�鿴��Ƭ" onClick="f_ckzp(editform)" name="ckzp" >
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
	if(	javaTrim(FormName.xjr)=="") {
		alert("������[�����]��");
		FormName.xjr.focus();
		return false;
	}
	if(	javaTrim(FormName.xjsj)=="") {
		alert("������[���ʱ��]��");
		FormName.xjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xjsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xjlxbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.xjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xjjgbm)=="") {
		alert("��ѡ��[�����]��");
		FormName.xjjgbm.focus();
		return false;
	}
	if (FormName.xjjgbm.value=="11")
	{
		if(	javaTrim(FormName.xjwtflbm)!="") {
			alert("û���⣬��������[�������]��");
			FormName.xjwtflbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xjwtflbm)=="") {
			alert("������[�������]��");
			FormName.xjwtflbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("��ѡ��[�������]��");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "�������"))) {
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

	FormName.action="SaveEditKp_xjgdjl.jsp";
	FormName.submit();
	return true;
}

function f_lrzp(FormName)//����FormName:Form������
{
   
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("������[Ѳ���¼��]��");
		FormName.xjjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//����FormName:Form������
{
   
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("������[Ѳ���¼��]��");
		FormName.xjjlh.focus();
		return false;
	}
   
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
