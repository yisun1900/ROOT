<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
String sl=null;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
String qtfyje=null;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;

String dqbm=null;
double zxqdl=0;
String xsfs=null;
String xsfsmc=null;
double zcpzsl=0;
double dhsl=0;
double xhsl=0;
String sfzp=null;
double zsdj=0;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfzp,zsdj,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','��','N','��') sftjcp";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=cf.fillNull(rs.getString("sl"));
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=cf.fillNull(rs.getString("qtfyje"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
	}
	rs.close();
	ps.close();


	ls_sql="select dqbm";
	ls_sql+=" from  jc_zcdd,sq_dwxx";
	ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select zxqdl,zcpzsl,dhsl,zcpzsl-dhsl xhsl,xsfs,DECODE(xsfs,'1','����Ʒ','2','�ֻ�����','3','����޻�������') xsfsmc,bz";
	ls_sql+=" from  jxc_cljgb";
	ls_sql+=" where clbm='"+zcbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxqdl=rs.getDouble("zxqdl");
		zcpzsl=rs.getDouble("zcpzsl");//����Ʒ������
		dhsl=rs.getDouble("dhsl");
		xhsl=rs.getDouble("xhsl");
		xsfs=cf.fillNull(rs.getString("xsfs"));
		xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
		bjbz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸����Ķ�����ϸ��������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_zcddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right"><font color="#0000CC">Ʒ��</font></td>
              <td width="36%"><%=ppmc%></td>
              <td width="18%" align="right"><font color="#0000CC">��Ӧ��</font></td>
              <td width="28%"><%=gys%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">���ı���</font></td>
              <td width="36%"><%=zcbm%></td>
              <td width="18%" align="right"><font color="#0000CC">��������</font></td>
              <td width="28%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�ͺ�</font></td>
              <td width="36%"><%=xinghao%></td>
              <td width="18%" align="right"><font color="#0000CC">���</font></td>
              <td width="28%"><%=gg%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">���/ϵ��</font></td>
              <td width="36%"><%=zclbbm%> </td>
              <td width="18%" align="right"><strong><font color="#0000CC">�Ƿ��Ƽ���Ʒ</font></strong></td>
              <td width="28%"><%=sftjcp%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�Ƿ�������</font></td>
              <td width="36%"> <%
	cf.radioToken(out, "sfbhpj","Y+����&N+������",sfbhpj,true);
%> </td>
              <td width="18%" align="right"><font color="#0000CC">���������</font></td>
              <td width="28%"><%=pjts%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�г����</font></td>
              <td width="36%"><%=lsj%></td>
              <td width="18%" align="right"><font color="#0000CC">�����޼�</font></td>
              <td width="28%"><%=yhj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">������������</font></td>
              <td width="36%"><%=bzcxhdbl%>%</td>
              <td width="18%" align="right"><font color="#0000CC">�����ڼ�������</font></td>
              <td width="28%"><%=lscxhdbl%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�����Ƿ��д���</font></td>
              <td width="36%"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���",sfycx,true);
%></td>
              <td width="18%" align="right"><font color="#0000CC">������</font></td>
              <td width="28%"><%=cxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">������ʼʱ��</font></td>
              <td width="36%"><%=cxkssj%></td>
              <td width="18%" align="right"><font color="#0000CC">��������ʱ��</font></td>
              <td width="28%"><%=cxjzsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">��ע</font></td>
              <td colspan="3"><%=bjbz%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>ѡ��۸�</td>
              <td width="36%">
<%
	cf.radioToken(out, "xzjg","0+��д��Ŀ&1+�����޼�&2+������",xzjg,true);
%>			  </td> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��ǰʵ������</font></td>
              <td width="28%"> 
                <input type="text" name="zqdj" size="17" maxlength="9"  value="<%=zqdj%>" readonly>
                Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font><font color="#0000CC">�ۿ���</font></td>
              <td><input type="text" name="dpzk" size="8" maxlength="9"  value="<%=dpzk%>" readonly>
              <b><font color="#0000FF">��>0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font>�ۺ�ʵ������</td>
              <td><input type="text" name="dj" size="17" maxlength="9"  value="<%=dj%>" onChange="f_jsjg(editform)">
Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC">��ɫ</td>
              <td width="36%"> 
                <input type="text" name="zcysbm" size="20" maxlength="50"  value="<%=zcysbm%>" onKeyUp="keyGo(zcpzwzbm)" ></td>
              <td width="18%" align="right">��װλ��</td>
              <td width="28%"> 
				<select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:132PX" >
					<option value=""></option>
					<%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz",zcpzwzbm);
					%>
				</select>				</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>��������</td>
              <td colspan="3"><input type="text" name="sl" size="17" maxlength="8"  value="<%=sl%>" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)">
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> 
&nbsp;&nbsp;&nbsp;&nbsp;
<font color="#0000CC"><%=xsfsmc%>�������<%=zcpzsl%>��������<%=dhsl%>����С����<%=zxqdl%>���ɶ�����<%=xhsl%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">&nbsp;</td>
              <td width="36%">&nbsp;</td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��ǰ���Ϸ�</font></td>
              <td width="28%"><input type="text" name="zqje" size="17" maxlength="9"  value="<%=zqje%>" readonly>
Ԫ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">Զ�̷�</td>
              <td width="36%"><input type="text" name="ycf" size="17" maxlength="9"  value="<%=ycf%>" onKeyUp="keyTo(qtfy[0])">
Ԫ</td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�ۺ���Ϸ�</font></td>
              <td width="28%"><input type="text" name="je" size="17" maxlength="9"  value="<%=je%>" readonly>
Ԫ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="36%"> <%
	cf.radioToken(out, "qtfy","1+��װ��&2+�ӹ���&3+�����շ�&W+��",qtfy);
%> </td>
              <td width="18%" align="right">�����ѽ��</td>
              <td width="28%"> 
                <input type="text" name="qtfyje" size="17" maxlength="9"  value="<%=qtfyje%>" onKeyUp="keyTo(cxhdbz[0])">
                Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><strong><font color="#FF0000">*</font></strong>�Ƿ���Ʒ</td>
              <td><%
	cf.radioToken(out, "sfzp","Y+��&N+��",sfzp);
%></td>
              <td align="right"><font color="#FF0000">*</font>���͵���</td>
              <td><input type="text" name="zsdj" size="17" maxlength="9"  value="<%=zsdj%>"  >
Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�μӴ������־</td>
              <td width="36%"><%
	cf.radioToken(out, "cxhdbz","Y+�μ�&N+���μ�",cxhdbz,true);
%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="28%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>������������</td>
              <td width="36%"> 
                <input type="text" name="cxhdbl" size="17" maxlength="9"  value="<%=cxhdbl%>" onChange="f_jsjg(editform)" >
                % </td>
              <td width="18%" align="right"><font color="#0000CC">�����������</font></td>
              <td width="28%"> 
                <input type="text" name="cxhdje" size="17" maxlength="9"  value="<%=cxhdje%>" readonly>
                Ԫ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
				<input type="hidden" name="xh"  value="<%=xh%>" >

				<input type="hidden" name="xsfs"  value="<%=xsfs%>" >
				<input type="hidden" name="zxqdl"  value="<%=zxqdl%>" >
				<input type="hidden" name="zcpzsl"  value="<%=zcpzsl%>" >
				<input type="hidden" name="dhsl"  value="<%=dhsl%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>              </td>
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

function f_jsjg(FormName)//����FormName:Form������
{
	var dpzk=FormName.dj.value*10.0/FormName.zqdj.value;
	dpzk=round(dpzk,2);
	FormName.dpzk.value=dpzk;

	var zqje=FormName.zqdj.value*FormName.sl.value;
	zqje=round(zqje,2);
	FormName.zqje.value=zqje;

	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;

	var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
	cxhdje=round(cxhdje,2);
	FormName.cxhdje.value=cxhdje;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zqdj)=="") {
		alert("������[��ǰʵ������]��");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "��ǰʵ������"))) {
		return false;
	}

	if(	javaTrim(FormName.dpzk)=="") {
		alert("������[�ۿ���]��");
		FormName.dpzk.focus();
		return false;
	}
	if(!(isFloat(FormName.dpzk, "�ۿ���"))) {
		return false;
	}
	if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.dpzk.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[�ۺ�ʵ������]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "�ۺ�ʵ������"))) {
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[��������]����<=0��");
		FormName.sl.select();
		return false;
	}
	if (parseFloat(FormName.sl.value)<parseFloat(FormName.zxqdl.value))
	{
		alert("[��������]���� С�� [��С����"+parseFloat(FormName.zxqdl.value)+"]");
		FormName.sl.select();
		return false;
	}
	if (FormName.xsfs.value=="2")//1������Ʒ��2���ֻ����ۣ�3������޻�������
	{
		var kdhsl=parseFloat(FormName.zcpzsl.value);
		if (  parseFloat(FormName.sl.value)  > kdhsl )
		{
			alert("�ò�Ʒ�ֻ����ۣ�[��������]���� ���� [�ɶ�����"+kdhsl+"]");
			FormName.sl.select();
			return false;
		}
	}
	else if (FormName.xsfs.value=="3")//1������Ʒ��2���ֻ����ۣ�3������޻�������
	{
	}
	else{
		alert("����[���۷�ʽ]����ȷ��"+FormName.xsfs.value);
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("������[��ǰ���Ϸ�]��");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "��ǰ���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[�ۺ���Ϸ�]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "�ۺ���Ϸ�"))) {
		return false;
	}

	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("��ѡ��[��������]��");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) {
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("������[�����ѽ��]��");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "�����ѽ��"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[�����ѽ��]����Ϊ0��");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}


	if (FormName.cxhdbz.value=="Y")
	{
		if(	javaTrim(FormName.cxhdbl)=="") {
			alert("������[������������]��");
			FormName.cxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxhdbl, "������������"))) {
			return false;
		}
		if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>300)
		{
			alert("[������������]Ӧ��0����300��֮�䣡");
			FormName.cxhdbl.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.cxhdbl)!="" && FormName.cxhdbl.value!="0") {
			alert("���󣡲��μӴ������[������������]ӦΪ0��");
			FormName.cxhdbl.select();
			return false;
		}
		if(	javaTrim(FormName.cxhdje)!="" && FormName.cxhdje.value!="0") {
			alert("���󣡲��μӴ������[�����������]ӦΪ0��");
			FormName.cxhdbl.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfzp)) {
		alert("��ѡ��[�Ƿ���Ʒ]��");
		FormName.sfzp[0].focus();
		return false;
	}
	if (FormName.sfzp[0].checked)
	{
		if (parseFloat(FormName.dj.value)!=0)
		{
			alert("������Ʒ���ۺ�ʵ�����ۡ�ӦΪ0");
			FormName.dj.select();
			return false;
		}
		if(	javaTrim(FormName.zsdj)=="") {
			alert("������[���͵���]��");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "���͵���"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)==0)
		{
			alert("������Ʒ�����͵��ۡ�����Ϊ0");
			FormName.zsdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.dj.value)==0)
		{
			alert("���󣡷���Ʒ���ۺ�ʵ�����ۡ�����Ϊ0");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zsdj)=="") {
			alert("������[���͵���]��");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "���͵���"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)!=0)
		{
			alert("���󣡷���Ʒ�����͵��ۡ�ӦΪ0");
			FormName.zsdj.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
