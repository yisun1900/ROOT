<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ϵ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");

String psph=request.getParameter("psph");

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;
String lx=null;
double yf=0;
double qtsf=0;
String ssbm=null;
String lrr=null;
String lrrq=null;
String bz=null;
String psdzt=null;


String dqbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;
String fwmj=null;

try { 
	conn=cf.getConnection();

	ls_sql="select khbh,psfs,jhshsj,fkje,yf,qtsf,ssbm,lrr,lrrq,bz,psdzt";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		ssbm=cf.fillNull(rs.getString("ssbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		bz=cf.fillNull(rs.getString("bz"));
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (psdzt.equals("2") || psdzt.equals("6")  || psdzt.equals("7"))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
	{
		out.print("���󣡲��ϵ�["+psph+"]�������ɣ��������޸ģ������޸����ڡ����ϵ����޻���ˡ���ɾ�������Ϣ");
		return;
	}
	else if (!psdzt.equals("1"))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6������ˣ�
	{
		out.print("���󣡲��ϵ�["+psph+"]���ǵȴ����״̬��");
		return;
	}


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh,fwmj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><strong>���ϵ������</strong>�����ϵ��ţ�<%=psph%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">�ͻ����</font> </td>
      <td><%=khbh%> </td>
      <td align="right"><font color="#0000CC">��ͬ��</font> </td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">�ͻ�����</font> </td>
      <td><%=khxm%> </td>
      <td align="right"><font color="#0000CC">�ʼ�Ա</font></td>
      <td><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td align="right"><font color="#0000CC">���ʦ</font></td>
      <td><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">ʩ����</font> </td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>      </td>
      <td align="right"><font color="#0000CC">ʩ������</font> </td>
      <td><%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td bgcolor="#FFFFFF"><%=kgrq%> </td>
      <td align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td><%=jgrq%> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">���ͷ�ʽ</font></td>
      <td width="32%"> <%
	cf.radioToken(out,"1+����&2+����&9+����",psfs,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">�ƻ��ͻ�ʱ��</font></td>
      <td width="32%"><%=jhshsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">¼����</font></td>
      <td width="32%"> <%=lrr%></td>
      <td align="right" width="18%"><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"><%=lrrq%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">��ע</font></td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">���̶�</font></td>
      <td><%=qye%></td>
      <td align="right"><font color="#0000CC">�������</font></td>
      <td><%=fwmj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>�����˷�</td>
      <td><input type="text" name="yf" value="<%=yf%>" size="20" maxlength="10" >      </td>
      <td align="right"><font color="#CC0000">*</font>�����շ�</td>
      <td><input type="text" name="qtsf" value="<%=qtsf%>" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>������</td>
      <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" >      </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>��˽���</td>
      <td colspan="3"><%
	cf.radioToken(out, "shjl","Y+ͬ��&N+���ϣ����ܴ�ӡ���ܳ��⣩&M+���������޸ģ����ܴ�ӡ���ܳ��⣩","");
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">�����</font></td>
      <td><input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">���ʱ��</font></td>
      <td><input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���˵��</td>
      <td colspan="3"><textarea name="shsm" cols="75" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <p>
          <input type="hidden" name="dqbm" value="<%=dqbm%>">
          <input type="hidden" name="psph" value="<%=psph%>" >
          <input type="hidden" name="khbh" value="<%=khbh%>">
          <input type="button"  value="������" onClick="f_do(insertform)">
          <input type="button"  value="�����ϸ" onClick="f_ck(insertform)" name="ckmx" >
          
          <input type="button"  value="����ͳ��" onClick="f_fltj(insertform)" name="fltj" >
          <input type="button"  value="���Ϸ���" onClick="f_glfx(insertform)" name="glfx" >
          <input type="reset"  value="����" name="reset"></p>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("������[������]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "������"))) {
		return false;
	}

	
	if(	javaTrim(FormName.yf)=="") {
		alert("������[�����˷�]��");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "�����˷�"))) {
		return false;
	}
	if(	javaTrim(FormName.qtsf)=="") {
		alert("������[�����շ�]��");
		FormName.qtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsf, "�����շ�"))) {
		return false;
	}

	if(	!radioChecked(FormName.shjl)) {
		alert("��ѡ��[��˽���]��");
		FormName.shjl[0].focus();
		return false;
	}

	if (FormName.shjl[1].checked || FormName.shjl[2].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("������[���˵��]��");
			FormName.shsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}

	FormName.target="";
	FormName.action="SaveShJxc_clpsd.jsp";
	FormName.submit();

	return true;
}



function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ShAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
}


function f_fltj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="fltj.jsp";
	FormName.submit();
	return true;
}

function f_glfx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="/khxx/ViewGlfx.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
