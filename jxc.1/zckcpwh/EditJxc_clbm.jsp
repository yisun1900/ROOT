<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%

String clmc=null;
String cldlbm=null;
String clxlbm=null;
String xh=null;
String gg=null;
String lsj=null;
String xsj=null;
String ppmc=null;
String zp=null;
String bz=null;
String cllbbm=null;
String clysbm=null;
String jldwbm=null;
String sfbhpj=null;
String pjts=null;
String sfyh=null;

String cbj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sftjcp=null;

double jsbl=0;
double cxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String cpjb=null;
String fgsx=null;
String cd=null;
String gysmc=null;
String cpsm=null;
String nbbm=null;
String xsfs=null;

double zdxsj=0;
double yjjrj=0;
String jsfs=null;
double cxjsbl=0;

String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jxc_cljgb.xsfs,jxc_clbm.nbbm,jxc_cljgb.sftjcp,jxc_cljgb.lscxhdbl,jxc_cljgb.cxcbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cd,jxc_cljgb.gysmc,jxc_cljgb.dqbm,jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.xh,jxc_clbm.gg,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_clbm.ppmc,jxc_clbm.zp,jxc_clbm.bz,jxc_clbm.cllbbm,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_cljgb.sfyh,jxc_cljgb.cbj,jxc_cljgb.sfycx,jxc_cljgb.cxj,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_clbm.cpsm ";
	ls_sql+=" ,jxc_cljgb.zdxsj,jxc_cljgb.yjjrj,jxc_cljgb.jsfs,jxc_cljgb.cxjsbl";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	ls_sql+=" and jxc_clbm.clbm='"+clbm+"' and jxc_cljgb.dqbm='"+dqbm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdxsj=rs.getDouble("zdxsj");
		yjjrj=rs.getDouble("yjjrj");
		jsfs=cf.fillNull(rs.getString("jsfs"));
		cxjsbl=rs.getDouble("cxjsbl");

		xsfs=cf.fillNull(rs.getString("xsfs"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		jsbl=rs.getDouble("jsbl");
		cxhdbl=rs.getDouble("cxhdbl");
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cd=cf.fillNull(rs.getString("cd"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		clysbm=cf.fillNull(rs.getString("clysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		sfyh=cf.fillNull(rs.getString("sfyh"));

		cbj=cf.fillNull(rs.getString("cbj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cpsm=cf.fillNull(rs.getString("cpsm"));
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
String yhjs=(String)session.getAttribute("yhjs");
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
      <div align="center"> ���޸����ı�����Ϣ�����ı��룺<%=clbm%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td width="17%" align="right"><strong><font color="#FF0000">*</font></strong>�Ƿ��Ƽ���Ʒ</td>
              <td width="33%"><%
	cf.radioToken(out, "sftjcp","Y+��&N+��",sftjcp);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���Ĵ���</font></td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') and cldlmc='"+cldlbm+"'",cldlbm);
%> 
                </select>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>����С��</td>
              <td width="33%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
					 <OPTION  value=""></OPTION>
				     <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+cldlbm+"' order by clxlmc",clxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��Ʒ��</font></td>
              <td width="32%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="<%=ppmc%>"><%=ppmc%></option>
                </select>              </td>
              <td width="17%" align="right">�ڲ�����</td>
              <td width="33%"><input type="text" name="nbbm" size="20" maxlength="100"  value="<%=nbbm%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��������</td>
              <td colspan="3"> 
                <input type="text" name="clmc" size="73" maxlength="50"  value="<%=clmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="cllbbm" value="<%=cllbbm%>" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xh" size="73" maxlength="100"  value="<%=xh%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="gg" size="73" maxlength="100"  value="<%=gg%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ɫ</td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="<%=clysbm%>" size="20" maxlength="100" >              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>�г����              </td>
              <td width="32%"> 
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >              </td>
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>���ۼ�              </td>
              <td width="33%"> 
                <input type="text" name="xsj" size="20" maxlength="9"  value="<%=xsj%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><font color="#FF0000">*</font>��������޼�</td>
              <td><input name="zdxsj" type="text" id="zdxsj" value="<%=zdxsj%>" size="20" maxlength="9" ></td>
              <td align="right"><font color="#FF0000">*</font>ҵ�������</td>
              <td><input name="yjjrj" type="text" id="yjjrj" value="<%=yjjrj%>" size="20" maxlength="9" ></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><font color="#FF0000">*</font>���㷽ʽ</td>
              <td><%
	cf.radioToken(out, "jsfs","1+�����&2+�������",jsfs);
%></td>
              <td align="right"><font color="#FF0000">*</font>��������</td>
              <td><input type="text" name="cxhdbl" value="<%=cxhdbl%>" size="10" maxlength="8" >
% <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="9" >              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>�������</td>
              <td width="33%"> 
                <input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="8" >
                % <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ��д���</td>
              <td><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���",sfycx);
%></td>
              <td align="right">������</td>
              <td><input type="text" name="cxj" value="<%=cxj%>" size="20" maxlength="9" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">������ʼʱ��</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" value="<%=cxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��������ʱ��</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj" value="<%=cxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">���������</td>
              <td width="32%"><input type="text" name="cxcbj" value="<%=cxcbj%>" size="20" maxlength="9" ></td>
              <td width="17%" align="right">�����������</td>
              <td width="33%"><input type="text" name="cxjsbl" value="<%=cxjsbl%>" size="10" maxlength="9" >
              % <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">�����ڼ�������</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="lscxhdbl" value="<%=lscxhdbl%>" size="10" maxlength="9" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
              <td width="17%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ��л�</td>
              <td width="33%" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "sfyh","Y+�л�&N+�޻�",sfyh);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>�Ƿ�������              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfbhpj","Y+����&N+������",sfbhpj);
%> </td>
              <td width="17%" align="right"> 
                �������              </td>
              <td width="33%"> 
                <input type="text" name="pjts" size="20" maxlength="8"  value="<%=pjts%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ��Ʒ����              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="<%=cpjb%>" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"> 
                �������              </td>
              <td width="33%"> 
                <input type="text" name="fgsx" value="<%=fgsx%>" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ʒ˵��</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200"  value="<%=cpsm%>">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="cd" value="<%=cd%>" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"><font color="#0000CC">��Ƭ����</font></td>
              <td width="33%"> 
                <input type="text" name="zp" size="20" maxlength="50"  value="<%=zp%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���۷�ʽ</td>
              <td colspan="3"><%
	cf.radioToken(out, "xsfs","2+�ֻ�����&3+�ڻ�����",xsfs);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
				<input type="hidden" name="clbm"  value="<%=clbm%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_do1(editform)" name="button">
                  <input type="button"  value="�鿴��Ƭ" onClick="f_do2(editform)" name="button">              </td>
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
	if(	!radioChecked(FormName.sftjcp)) {
		alert("��ѡ��[�Ƿ��Ƽ���Ʒ]��");
		FormName.sftjcp[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ı���]��");
		FormName.clbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.clmc)=="") {
		alert("������[��������]��");
		FormName.clmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("������[�г����]��");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "�г����"))) {
		return false;
	}
	if(	javaTrim(FormName.xsj)=="") {
		alert("������[���ۼ�]��");
		FormName.xsj.focus();
		return false;
	}
	if(!(isFloat(FormName.xsj, "���ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zdxsj)=="") {
		alert("������[��������޼�]��");
		FormName.zdxsj.focus();
		return false;
	}
	if(!(isFloat(FormName.zdxsj, "��������޼�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjjrj)=="") {
		alert("������[ҵ�������]��");
		FormName.yjjrj.focus();
		return false;
	}
	if(!(isFloat(FormName.yjjrj, "ҵ�������"))) {
		return false;
	}

	if(	!radioChecked(FormName.jsfs)) {
		alert("��ѡ��[���㷽ʽ]��");
		FormName.jsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�����]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[�������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
	{
		alert("����[�������]Ӧ��0��100֮��");
		FormName.jsbl.focus();
		return false;
	}

	if (FormName.jsfs[0].checked)//�����
	{
		if (parseFloat(FormName.cbj.value)==0)
		{
			alert("���ѣ���[�����]���㣬[�����]=0");
		}
	}
	else{
		if (parseFloat(FormName.jsbl.value)==0)
		{
			alert("���ѣ���[�������]���㣬[�������]=0");
		}
	}

	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("������[��������]��");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.cxhdbl.value)<0 || parseFloat(FormName.cxhdbl.value)>100)
	{
		alert("����[��������]Ӧ��0��100֮��");
		FormName.cxhdbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("��ѡ��[�Ƿ��д���]��");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("������[������]��");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "������"))) {
			return false;
		}
		if(	javaTrim(FormName.cxcbj)=="") {
			alert("������[���������]��");
			FormName.cxcbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcbj, "���������"))) {
			return false;
		}
		if(	javaTrim(FormName.lscxhdbl)=="") {
			alert("������[�����ڼ�������]��");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.lscxhdbl, "�����ڼ�������"))) {
			return false;
		}
		if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
		{
			alert("����[�����ڼ�������]Ӧ��0��100֮��");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjzsj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjzsj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjzsj.select();
			return false;
		}

		if (FormName.jsfs[0].checked)//�����
		{
			if (parseFloat(FormName.cxcbj.value)==0)
			{
				alert("���ѣ���[���������]���㣬[���������]=0");
			}
		}
		else{
			if (parseFloat(FormName.cxjsbl.value)==0)
			{
				alert("���ѣ���[�����������]���㣬[�����������]=0");
			}
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.cxjsbl.value="";
		FormName.lscxhdbl.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
	}

	if(	!radioChecked(FormName.sfyh)) {
		alert("��ѡ��[�Ƿ��л�]��");
		FormName.sfyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbhpj)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfbhpj[0].focus();
		return false;
	}
	if (FormName.sfbhpj[0].checked)
	{
		if(	javaTrim(FormName.pjts)=="") {
			alert("������[�������]��");
			FormName.pjts.focus();
			return false;
		}
		if(!(isNumber(FormName.pjts, "�������"))) {
			return false;
		}
	}
	else{
		FormName.pjts.value="";
	}

	if(	!radioChecked(FormName.xsfs)) {
		alert("��ѡ��[���۷�ʽ ]��");
		FormName.xsfs[0].focus();
		return false;
	}


	
	FormName.action="SaveEditJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ı���]��");
		FormName.clbm.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ı���]��");
		FormName.clbm.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
