<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String hdr=null;

String sjs=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String xqbm=null;
String ywy=null;
String fgs=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String jzbz=null;
String louhao=null;
String bjjb=null;
String bjbbh=null;


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bjbbh,bjjb,louhao,jzbz,ysrbm,rddqbm,hxwzbm,ssfgs,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		louhao=cf.fillNull(rs.getString("louhao"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		fgs=cf.fillNull(rs.getString("ssfgs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
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
<title>�����ۼ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>�����ۼ���</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="SaveEditAllBjjb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" height="24" align="right"> 
                �ͻ�����              </td>
              <td width="31%" height="24"> <%=khxm%></td>
              <td width="18%" height="24" align="right">���۰汾��</td>
              <td width="32%" height="24"> <%=bjbbh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000FF">���ݵ�ַ</font>              </td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong><font color="#FF0000">�ͻ�����</font></strong></td>
              <td colspan="3">               
			  <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
			  <font color="#0000FF"><strong>ע�⣺�����ײͣ���ע�⻧���Ƿ���ȷ</strong> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><strong><font color="#FF0000">�����б��۴���</font></strong></td>
              <td colspan="3"><p>
                <input type="radio" name="czfs" value="1">
                ɾ�����б�����Ŀ��������</p>
                <p>
                  <input type="radio" name="czfs" value="2">
                �������б�����Ŀ��������<font color="#FF0000"><strong>��ע�⣺����漰�ײͣ�������Ŀ������������ǿ��ɾ����</strong></font></p></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong><font color="#FF0000">��������Ŀ����ʽ</font></strong></td>
              <td>
				  <input type="radio" name="xmclfs" value="1">ϵͳ�Զ�ɾ��
				  <BR>
				  <input type="radio" name="xmclfs" value="2">
				  ���˹�ɾ��ɾ��			  </td>
              <td colspan="2" bgcolor="#FFFFFF"><strong><font color="#0000CC">��Ŀ���¼��𱨼��в����ڣ��������ۼ��𡿽�ʧ��
              <BR>
			  ��ѡ��ϵͳ�Զ�ɾ���������Զ�ɾ����������Ŀ����֤�������ۼ������
			  <BR>
			  ��ѡ�����˹�ɾ��ɾ�������������ۼ���ʧ�ܣ�ɾ����Ŀ������			  </font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>���ۼ���</td>
              <td width="31%">
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm",bjjb);
%>
                </select>			  </td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#CC0000">*</font>��װ��־</td>
              <td width="32%"><%
		cf.radioToken(out, "jzbz","1+��װ�ͻ�&2+��װ�ͻ�",jzbz);
%></td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                <div align="center"> 
                  <input type="hidden" name="oldbjjb"  value="<%=bjjb%>" >
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="�����ۼ���" onClick="f_do(editform)">
                  <input type="button" onClick="f_zcxm(editform)"  value="�����ײͱ�׼������Ŀ">
                  <input type="reset"  value="����">
                  <input type="button" onClick="f_delete(editform)"  value="�����������"></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.czfs)) {
		alert("��ѡ��[�����б��۴���]��");
		FormName.czfs[0].focus();
		return false;
	}
	if (FormName.czfs[1].checked)
	{
		if(	!radioChecked(FormName.xmclfs)) {
			alert("��ѡ��[��������Ŀ����ʽ]��");
			FormName.xmclfs[0].focus();
			return false;
		}
	}

	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[�ͻ�����]��");
		FormName.hxbm.focus();
		return false;
	}
	if (FormName.hxbm.value!="<%=hxbm%>")
	{
		if (!FormName.czfs[0].checked)
		{
			alert("����[�ͻ�����]���ı䣬ֻ��ѡ��[ɾ�����б�����Ŀ��������]��");
			FormName.czfs[0].focus();
			return false;
		}
		if (!confirm("���ѣ�[�ͻ�����]���ı䣬�Ƿ����?") )	
		{
			FormName.hxbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.bjjb)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjb.focus();
		return false;
	}
	if (FormName.oldbjjb.value==FormName.bjjb.value)
	{
		alert("��ѡ��ͬ�ı��ۼ���");
		FormName.bjjb.focus();
		return false;
	}

	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}


	FormName.action="SaveEditAllBjjb.jsp";
	FormName.submit();
	return true;
}

function f_zcxm(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ������?") )	
	{
		FormName.action="fromZcxm.jsp";
		FormName.submit();
		return true;
	}
}

function f_delete(FormName)//����FormName:Form������
{
	if ( confirm("ע�⣡ɾ�����ۣ���ԭ����ʼ״̬����ɾ���󲻿ɻָ���ȷʵҪ������?") )	
	{
		FormName.action="initBjxm.jsp";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>
