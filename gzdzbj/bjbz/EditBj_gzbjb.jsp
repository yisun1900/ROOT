<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

//**************************************************************************888
double zcf=0;//A�����ķ�
double clf=0;
double rgf=0;//A���˹���
double jjf=0;//A����е��
double glfbl=0;//A������Ѱٷֱ�
String zcmc=null;//A����������
String zcgg=null;//A�����Ĺ��


//*******************************************************************************88
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double cbenj=0;
double sgdbj=0;
double bj=0;
String gycl=null;
String xh=null;
String sfxycl=null;
String sfbxx=null;


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfxycl,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,sgdbj,cbenj,bj,gycl,xh,clf,zcf,jjf,rgf,glfbl,zcmc,zcgg,sfbxx";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where  dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sgdbj=rs.getDouble("sgdbj");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		clf=rs.getDouble("clf");

		zcf=rs.getDouble("zcf");
		jjf=rs.getDouble("jjf");
		rgf=rs.getDouble("rgf");
		glfbl=rs.getDouble("glfbl");
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcgg=cf.fillNull(rs.getString("zcgg"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
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
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
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
      <div align="center"> ���޸Ĺ�װ���۱�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>����</td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
              <td align="right" width="18%"><font color="#FF0000">*</font>���ۼ���</td>
              <td width="32%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��Ŀ����</td>
              <td width="33%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>��ĿС��</td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>��Ŀ���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" >
              </td>
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="74" maxlength="100"  value="<%=xmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#FF0000">*</font>�Ƿ���Ҫ����</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfxycl","1+��Ҫ&2+����Ҫ",sfxycl);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="17%">�ɱ���</td>
              <td bgcolor="#E8E8FF" width="33%"> 
                <input type="text" name="cbenj" value="<%=cbenj%>" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF" width="18%">ʩ���ӱ���</td>
              <td bgcolor="#E8E8FF" width="32%"> 
                <input type="text" name="sgdbj" value="<%=sgdbj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td height="22" align="right" width="17%"> <font color="#FF0000">*</font>�ͻ�����</td>
              <td width="33%"> 
                <input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">����Ѱٷֱ�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="glfbl" value="<%=glfbl%>" size="8" maxlength="17" >
                % </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">��������</td>
              <td width="33%"> 
                <input type="text" name="zcmc" value="<%=zcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="18%">���Ĺ��</td>
              <td width="32%"> 
                <input type="text" name="zcgg" value="<%=zcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">���ķ�</td>
              <td width="33%"> 
                <input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">���ķ�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">�˹���</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="rgf" value="<%=rgf%>" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">��е��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jjf" value="<%=jjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">�������</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="72" rows="8"><%=gycl%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
              <td colspan="3"><%
	cf.radioToken(out, "sfbxx","1+��ѡ&2+�Ǳ�ѡ&3+����ѡ",sfbxx);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>�޸���</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�޸�ʱ��</td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button" onClick="f_lr(editform)"  value="¼�빤�Ϸ���" name="lr" >
                  <input type="button" onClick="f_wh(editform)"  value="ά�����Ϸ���" name="wh" >
                  <input type="reset"  value="����">
                  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherexmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="wherebjjbbm"  value="<%=bjjbbm%>" >
                </div>
              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "�ɱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "ʩ���ӱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("������[�ͻ�����]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "�ͻ�����"))) {
		return false;
	}
	if(!(isFloat(FormName.glfbl, "����Ѱٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.zcf, "���ķ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "���ķ�"))) {
		return false;
	}
	if(!(isFloat(FormName.rgf, "�˹���"))) {
		return false;
	}
	if(!(isFloat(FormName.jjf, "��е��"))) {
		return false;
	}
	if(!(isInt(FormName.xh, "���"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("��ѡ��[�޸���]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("��ѡ��[�޸�ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "�޸�ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}

	FormName.action="SaveEditBj_gzbjb.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="InsertBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="EditBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
