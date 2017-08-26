<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String khbh=null;
String lysj=null;
String lynr=null;
String lysfyck=null;
String lyckr=null;
String lycksj=null;
String lyhfnr=null;
String sfyqhf=null;
String lyxh=cf.GB2Uni(request.getParameter("lyxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;



String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String fgsbh=null;



try {
	conn=cf.getConnection();
	ls_sql="select khbh,lysj,lynr,lysfyck,lyckr,lycksj,lyhfnr,sfyqhf ";
	ls_sql+=" from  hd_khly";
	ls_sql+=" where  (lyxh='"+lyxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		lysj=cf.fillNull(rs.getDate("lysj"));
		lynr=cf.fillNull(rs.getString("lynr"));
		lysfyck=cf.fillNull(rs.getString("lysfyck"));
		lyckr=cf.fillNull(rs.getString("lyckr"));
		lycksj=cf.fillNull(rs.getDate("lycksj"));
		lyhfnr=cf.fillNull(rs.getString("lyhfnr"));
		sfyqhf=cf.fillNull(rs.getString("sfyqhf"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=rs.getString("fgsbh");
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
<title>�������Իظ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveLyHfHd_khly.jsp" name="editform">
  <div align="center">��������---�ظ���������ţ�<%=lyxh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="17%"> 
        <div align="right">�ͻ����</div>
      </td>
      <td width="33%"> <%=khbh%> </td>
      <td width="18%"> 
        <div align="right">��ͬ��</div>
      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="33%"> <%=khxm%> </td>
      <td width="18%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right">���ݵ�ַ</td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%"> 
        <div align="right">���ʦ</div>
      </td>
      <td width="33%"> <%=sjs%> </td>
      <td width="18%"> 
        <div align="right">�ʼ�Ա</div>
      </td>
      <td width="32%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%"> 
        <div align="right">ʩ����</div>
      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%"> 
        <div align="right">ʩ������</div>
      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#CCFFFF"> 
      <td align="right" width="17%">����ʱ��</td>
      <td width="33%"><%=lysj%></td>
      <td align="right" width="18%">�Ƿ�Ҫ��ظ�</td>
      <td width="32%"> <%
	cf.radioToken(out,"sfyqhf","1+����ظ�&2+����ظ�&3+��Ҫ��",sfyqhf,true);
%> </td>
    </tr>
    <tr bgcolor="#CCFFFF"> 
      <td align="right" width="17%">��������</td>
      <td colspan="3"><%=lynr%> </td>
    </tr>
    <tr bgcolor="#CCFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>���Բ鿴��</td>
      <td width="33%"> 
        <input type="text" name="lyckr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>���Բ鿴ʱ��</td>
      <td width="32%"> 
        <input type="text" name="lycksj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#CCFFFF"> 
      <td align="right" width="17%">���Իظ�����</td>
      <td colspan="3"> 
        <textarea name="lyhfnr" cols="71" rows="7"><%=lyhfnr%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="hidden" name="lyxh"  value="<%=lyxh%>" >
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lyxh)=="") {
		alert("������[�������]��");
		FormName.lyxh.focus();
		return false;
	}
	if(	javaTrim(FormName.lyckr)=="") {
		alert("������[���Բ鿴��]��");
		FormName.lyckr.focus();
		return false;
	}
	if(	javaTrim(FormName.lycksj)=="") {
		alert("������[���Բ鿴ʱ��]��");
		FormName.lycksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lycksj, "���Բ鿴ʱ��"))) {
		return false;
	}

	if ('<%=sfyqhf%>'=='2')//1������ظ���2������ظ���3����Ҫ��
	{
		if(	javaTrim(FormName.lyhfnr)=="") {
			alert("��ͻ�Ҫ��ظ���������[���Իظ�����]��");
			FormName.lyhfnr.focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
