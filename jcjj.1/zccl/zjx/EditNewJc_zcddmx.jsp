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
double cbj=0;
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
double bzcxhdbl=0;
double lscxhdbl=0;
String sftjcp=null;
String sfzp=null;
double zsdj=0;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double zjsl=0;
double zqzjje=0;
double zjje=0;
double zjycf=0;
double zjqtfy=0;
double zjcbje=0;
double zjcxhdje=0;

try {
	conn=cf.getConnection();

	ls_sql="select sfzp,zsdj,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,bzcxhdbl,lscxhdbl,cbj,DECODE(sftjcp,'Y','��','N','��') sftjcp ";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		cbj=rs.getDouble("cbj");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=cf.fillNull(rs.getString("qtfyje"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
	}
	rs.close();
	ps.close();
	if (qtfy.equals(""))
	{
		qtfy="W";
	}

	ls_sql="select bz";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where clbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zjsl,zqzjje,zjje,zjycf,zjqtfy,zjcbje,zjcxhdje,bz ";
	ls_sql+=" from  jc_zczjxmx";
	ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjsl=rs.getDouble("zjsl");
		zqzjje=rs.getDouble("zqzjje");
		zjje=rs.getDouble("zjje");
		zjycf=rs.getDouble("zjycf");
		zjqtfy=rs.getDouble("zjqtfy");
		zjcbje=rs.getDouble("zjcbje");
		zjcxhdje=rs.getDouble("zjcxhdje");
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���������������ţ�<%=ddbh%>���������ţ�<%=zjxbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditNewJc_zcddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">Ʒ��</font></td>
              <td width="32%"><%=ppmc%></td>
              <td width="20%" align="right"><font color="#0000CC">��Ӧ��</font></td>
              <td width="30%"><%=gys%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">���ı���</font></td>
              <td width="32%"><%=zcbm%></td>
              <td width="20%" align="right"><font color="#0000CC">��������</font></td>
              <td width="30%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�ͺ�</font></td>
              <td width="32%"><%=xinghao%></td>
              <td width="20%" align="right"><font color="#0000CC">���</font></td>
              <td width="30%"><%=gg%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">���/ϵ��</font></td>
              <td><%=zclbbm%></td>
              <td align="right"><strong><font color="#0000CC">�Ƿ��Ƽ���Ʒ</font></strong></td>
              <td><%=sftjcp%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�Ƿ�������</font></td>
              <td width="32%"> <%
	cf.radioToken(out, "sfbhpj","Y+����&N+������",sfbhpj,true);
%> </td>
              <td width="20%" align="right"><font color="#0000CC">���������</font></td>
              <td width="30%"><%=pjts%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�г����</font></td>
              <td width="32%"><%=lsj%></td>
              <td width="20%" align="right"><font color="#0000CC">�����޼�</font></td>
              <td width="30%"><%=yhj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">������������</font></td>
              <td width="32%"><%=bzcxhdbl%>%</td>
              <td width="20%" align="right"><font color="#0000CC">�����ڼ�������</font></td>
              <td width="30%"><%=lscxhdbl%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">�����Ƿ��д���</font></td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���",sfycx,true);
%></td>
              <td width="20%" align="right"><font color="#0000CC">������</font></td>
              <td width="30%"><%=cxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">������ʼʱ��</font></td>
              <td width="32%"><%=cxkssj%></td>
              <td width="20%" align="right"><font color="#0000CC">��������ʱ��</font></td>
              <td width="30%"><%=cxjzsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">��ע</font></td>
              <td colspan="3"><%=bjbz%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>ѡ��۸�</td>
              <td width="32%"> 
<%
	cf.radioToken(out, "xzjg","0+��д��Ŀ&1+�����޼�&2+������",xzjg,true);
%>			  </td> 
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��ǰʵ������</font></td>
              <td width="30%"><input type="text" name="zqdj" size="17" maxlength="9"  value="<%=zqdj%>" readonly>
Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�ۿ���</font></td>
              <td><input type="text" name="dpzk" size="8" maxlength="9"  value="<%=dpzk%>" readonly>
                <b><font color="#0000FF">��>0��<=10��</font></b></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�ۺ�ʵ������</font></td>
              <td><input type="text" name="dj" size="17" maxlength="9"  value="<%=dj%>" readonly>
Ԫ</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> ��ɫ</td>
              <td width="32%"> 
                <input type="text" name="zcysbm" size="20" maxlength="50"  value="<%=zcysbm%>" onKeyUp="keyGo(zcpzwzbm)" ></td>
              <td width="20%" align="right">��װλ��</td>
              <td width="30%"> 
              <select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:132PX" >
                <option value=""></option>
                <%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz",zcpzwzbm);
					%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>��������</td>
              <td width="32%"> 
                <input type="text" name="zjsl" size="10" maxlength="8"  value="<%=zjsl%>" onChange="f_jsjg(editform)" onKeyUp="keyGo(zjycf)">
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> </td>
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��ǰ���Ϸ�</font></td>
              <td width="30%"><input type="text" name="zqzjje" size="17" maxlength="9"  value="<%=zqzjje%>" readonly>
Ԫ </td>
            </tr>
            
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">����Զ�̷�</td>
              <td width="32%"><input type="text" name="zjycf" size="17" maxlength="9"  value="<%=zjycf%>" onKeyUp="keyTo(qtfy[0])">
Ԫ </td>
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�ۺ���Ϸ�</font></td>
              <td width="30%"><input type="text" name="zjje" size="17" maxlength="9"  value="<%=zjje%>" readonly>
Ԫ</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="32%"> <%
			cf.radioToken(out, "qtfy","1+��װ��&2+�ӹ���&3+�����շ�&W+��",qtfy);
%> </td>
              <td width="20%" align="right">���������ѽ��</td>
              <td width="30%"> 
                <input type="text" name="zjqtfy" size="17" maxlength="9"  value="<%=zjqtfy%>" onKeyUp="keyTo(cxhdbz[0])">
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
              <td align="right"><font color="#FF0000">*</font>�μӴ������־</td>
              <td><%
			cf.radioToken(out, "cxhdbz","Y+�μ�&N+���μ�",cxhdbz,true);
%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#000099">������������</font></td>
              <td width="32%"><input type="text" name="cxhdbl" size="14" maxlength="9"  value="<%=cxhdbl%>" onKeyUp="keyGo(bz)" onChange="f_jsjg(editform)" readonly>
% </td>
              <td width="20%" align="right"><font color="#0000CC">�����������</font></td>
              <td width="30%"><input type="text" name="zjcxhdje" size="17" maxlength="9"  value="<%=zjcxhdje%>" readonly>
Ԫ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4">
                <div align="center"> 
                  <input type="hidden" name="zjcbje"  value="<%=zjcbje%>" >
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
                  <input type="hidden" name="xh"  value="<%=xh%>" >
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
	var dj=FormName.dpzk.value/10.0*FormName.zqdj.value;
	dj=round(dj,2);
	FormName.dj.value=dj;

	var zqzjje=FormName.zqdj.value*FormName.zjsl.value;
	zqzjje=round(zqzjje,2);
	FormName.zqzjje.value=zqzjje;

	var zjje=FormName.dj.value*FormName.zjsl.value;
	zjje=round(zjje,2);
	FormName.zjje.value=zjje;

	var zjcxhdje=FormName.zjje.value*FormName.cxhdbl.value/100;
	zjcxhdje=round(zjcxhdje,2);
	FormName.zjcxhdje.value=zjcxhdje;

	var zjcbje=<%=cbj%>*FormName.zjsl.value;
	zjcbje=round(zjcbje,2);
	FormName.zjcbje.value=zjcbje;
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

	if(	javaTrim(FormName.zjsl)=="") {
		alert("������[��������]��");
		FormName.zjsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjsl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.zjsl.value)<=0)
	{
		alert("[��������]����<=0��");
		FormName.zjsl.select();
		return false;
	}
	if(	javaTrim(FormName.zqzjje)=="") {
		alert("������[��ǰ�������Ϸ�]��");
		FormName.zqzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqzjje, "��ǰ�������Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("������[�ۺ��������Ϸ�]��");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "�ۺ��������Ϸ�"))) {
		return false;
	}


	if(	javaTrim(FormName.zjycf)=="") {
		alert("������[����Զ�̷�]��");
		FormName.zjycf.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycf, "����Զ�̷�"))) {
		return false;
	}


	if(	!radioChecked(FormName.qtfy)) {
		alert("��ѡ��[��������]��");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) 
	{
		if(	javaTrim(FormName.zjqtfy)=="") {
			alert("������[���������ѽ��]��");
			FormName.zjqtfy.focus();
			return false;
		}
		if(!(isFloat(FormName.zjqtfy, "���������ѽ��"))) {
			return false;
		}
		if (FormName.zjqtfy.value=="0")
		{
			alert("[���������ѽ��]����Ϊ0��");
			FormName.zjqtfy.select();
			return false;
		}
	}
	else{
		FormName.zjqtfy.value="0";
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
