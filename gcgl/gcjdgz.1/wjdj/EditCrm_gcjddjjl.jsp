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
String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
double khjsje=0;
String zjxwcbz=null;

try {
	conn=cf.getConnection();
	ls_sql="select djjlh,khbh,gcjdbm,djsj,lrr,lrsj,lrdw,bz ";
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
	}
	rs.close();
	ps.close();

	ls_sql="select zjxwcbz,crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm,kbxbz,bxkssj,bxjzsj,bybxsm,khjsje";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
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
		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		khjsje=rs.getDouble("khjsje");
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
      <div align="center">���޸�ʵ�ʿ������յǼǣ��ǼǼ�¼�ţ�<%=djjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_gcjddjjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
              �ͻ�����              </td>
              <td width="32%"> <%=khxm%>��<%=lxfs%>�� </td>
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
              <td width="18%" align="right"><font color="#FF0000">*</font>���̽���</td>
              <td width="32%">
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm order by gcjdbm",gcjdbm,false);
%> 
              </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>ʵ�ʿ�������ʱ��              </td>
              <td width="32%">
              <input type="text" name="djsj" size="20" maxlength="10"  value="<%=djsj%>" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�ɱ��ޱ�־                            </td>
              <td width="32%"><%
	cf.radioToken(out, "kbxbz","Y+����&M+���ֱ���&N+������",kbxbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���豣��˵��</td>
              <td colspan="3"> 
                <textarea name="bybxsm" cols="71" rows="3"><%=bybxsm%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000FF">¼����</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000FF">¼�뵥λ</font>              </td>
              <td width="32%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw);
%> 
              </select>              </td>
              <td width="18%">              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="4"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wheredjjlh"  value="<%=wheredjjlh%>" >
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
              <input type="reset"  value="����">
              <input name="dy" type="button" onClick="window.open('gcjsd.jsp?khbh=<%=khbh%>')"  value="��ӡ���̾��㵥"  ></td>
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
		alert("������[ʵ�ʿ�������ʱ��]��");
		FormName.djsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.djsj, "ʵ�ʿ�������ʱ��"))) {
		return false;
	}


	if(	!radioChecked(FormName.kbxbz)) {
		alert("��ѡ��[�ɱ��ޱ�־]��");
		FormName.kbxbz[0].focus();
		return false;
	}
	//if (FormName.kbxbz[0].checked)
//	{
//		if(	javaTrim(FormName.bxkssj)=="") {
//			alert("������[���޿�ʼʱ��]��");
//			FormName.bxkssj.focus();
//			return false;
//		}
//		if(!(isDatetime(FormName.bxkssj, "���޿�ʼʱ��"))) {
//			return false;
//		}
//		if(	javaTrim(FormName.bxjzsj)=="") {
//			alert("������[���޽�ֹʱ��]��");
//			FormName.bxjzsj.focus();
//			return false;
//		}
//		if(!(isDatetime(FormName.bxjzsj, "���޽�ֹʱ��"))) {
//			return false;
//		}
//		FormName.bybxsm.value="";
//	}
//	else if (FormName.kbxbz[1].checked)
//	{
//		FormName.bxkssj.value="";
//		FormName.bxjzsj.value="";
//		if(	javaTrim(FormName.bybxsm)=="") {
//			alert("��ѡ��[���豣��˵��]��");
//			FormName.bybxsm.focus();
//			return false;
//		}
//	}

	
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

