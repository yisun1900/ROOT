<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clcb=0;
double rgcb=0;
double cbenj=0;
double clbj=0;
double rgbj=0;
double bj=0;
String gycl=null;
String xh=null;
String sfbxx=null;
String glxmbh=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;


String xmflbm=null;
String sfyxdz=null;
double sgcbj=0;
double zdzk=0;

String bjbbh=cf.GB2Uni(cf.getParameter(request,"bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=request.getParameter("xmbh");
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmflbm,sfyxdz,sgcbj,zdzk,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clcb,rgcb,cbenj,bj,clbj,rgbj,gycl,xh,sfbxx,glxmbh,flmcgg,bz,sfxycl,sfxyyjd";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		sfyxdz=cf.fillNull(rs.getString("sfyxdz"));
		sgcbj=rs.getDouble("sgcbj");
		zdzk=rs.getDouble("zdzk");
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		clbj=rs.getDouble("clbj");
		rgbj=rs.getDouble("rgbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		glxmbh=cf.fillNull(rs.getString("glxmbh"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
		bz=cf.fillNull(rs.getString("bz"));
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
       <div align="center">���޸ļ�װ���۱�
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">���۰汾��</font></td>
              <td colspan="3">
			  <input type="text" name="bjbbh" value="<%=bjbbh%>" size="73" maxlength="50" readonly>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">����</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���ۼ���</font></td>
              <td width="32%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��Ŀ����</td>
              <td width="32%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>��ĿС��</td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��Ŀ����</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm",xmflbm);
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <div align="right"><font color="#FF0000">*</font>��Ŀ���              </td>
              <td width="32%"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" >              </td>
              <td width="18%" align="right"> 
              <div align="right">�������              </td>
              <td width="32%"> 
              <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="72" maxlength="100"  value="<%=xmmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>������������λ</td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
              <td colspan="3"><%
	cf.radioToken(out, "sfbxx","1+�ر���&2+������&3+��ѡ��&9+������",sfbxx);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������Ŀ���</td>
              <td colspan="3"><input type="text" name="glxmbh" size="56" maxlength="100"  value="<%=glxmbh%>" >
              <font color="#FF0000"><strong>����Ŀ����ö��ŷָ</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ���Ҫ����</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+��Ҫ&N+��",sfxycl);
%></td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ���ҪԤ����</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+��Ҫ&N+��",sfxyyjd);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>�ɱ���</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">���ϳɱ�</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="clcb" value="<%=clcb%>" size="20" maxlength="17" readonly onChange="f_jscb(editform)"></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">�˹��ɱ�</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="rgcb" value="<%=rgcb%>" size="20" maxlength="17" readonly onChange="f_jscb(editform)"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">�ɱ���</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="cbenj" value="<%=cbenj%>" size="20" maxlength="17" readonly>
                  <font color="#0000CC"><strong>ע�⣺�ɱ��ۣ����ϳɱ����˹��ɱ�</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>���ⱨ��</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>���Ϸ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="<%=clbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>�˹���</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="<%=rgbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font><font color="#0000CC">����Ԥ���</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" readonly>
                <font color="#0000CC"><strong>����Ԥ��ۣ����Ϸ�+���ķ�</strong></font></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>ʩ���ӱ���</td>
              <td colspan="3" bgcolor="#CCCCFF"><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="17"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ��������</td>
              <td bgcolor="#CCCCFF">
			  <%
 	cf.radioToken(out, "sfyxdz","Y+�������&N+��",sfyxdz);
%>				</td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>����ۿ�</td>
              <td bgcolor="#CCCCFF"><input name="zdzk" type="text" value="<%=zdzk%>" size="10" maxlength="10" >
                (0��10֮��)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="71" rows="8"><%=gycl%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������ƹ��</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="4"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="4"><%=bz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�޸���</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�޸�ʱ��</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button" onClick="f_wh(editform)"  value="ά�����Ϸ���" name="wh" >
                  <input type="reset"  value="����">
                  <input type="hidden" name="wherebjbbh"  value="<%=bjbbh%>" >
                  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherexmbh"  value="<%=xmbh%>" >
              <input type="hidden" name="wherebjjbbm"  value="<%=bjjbbm%>" ></td>
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
function f_jscb(FormName)//����FormName:Form������
{
	var cbenj=FormName.clcb.value*1+FormName.rgcb.value*1;
	cbenj=round(cbenj,2);
	FormName.cbenj.value=cbenj;
}

function f_jsjg(FormName)//����FormName:Form������
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//����FormName:Form������
{
	f_jscb(FormName);
	f_jsjg(FormName);

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
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

	if(	javaTrim(FormName.sgcbj)=="") {
		alert("������[ʩ���ӱ���]��");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "ʩ���ӱ���"))) {
		return false;
	}
	
	if(	javaTrim(FormName.bj)=="") {
		alert("������[����Ԥ���]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "����Ԥ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clbj)=="") {
		alert("������[���Ϸ�]��");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("������[�˹���]��");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "�˹���"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyxdz)) {
		alert("��ѡ��[�Ƿ�ɴ���]��");
		FormName.sfyxdz[0].focus();
		return false;
	}
	if (FormName.sfyxdz[0].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("������[����ۿ�]��");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "����ۿ�"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("����[����ۿ�]Ӧ����0��10֮�䣡");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}


	if(!(isFloat(FormName.xh, "���"))) {
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

	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("��ѡ��[�Ƿ���ҪԤ����]��");
		FormName.sfxyyjd[0].focus();
		return false;
	}

	FormName.action="SaveEditBj_jzbjb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
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
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="EditBj_jzglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
