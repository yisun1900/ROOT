<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ckph=null;
ckph=cf.GB2Uni(request.getParameter("ckph"));

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ckdw=null;
String ckr=null;
String cksj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;

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
String sgddh=null;
double ckzje=0;
double ckzsl=0;

try { 
	conn=cf.getConnection();

	ls_sql="select dwbh,ckr,cksj,lrr,lrsj,bz,khbh,ckzje,ckzsl,psfs,jhshsj,fkje";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where ckph='"+ckph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdw=cf.fillNull(rs.getString("dwbh"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ckzje=rs.getDouble("ckzje");
		ckzsl=rs.getDouble("ckzsl");
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
	}
	rs.close();
	ps.close();


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
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
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="12%">��������</td>
	<td  width="12%">���Ϲ��</td>
	<td  width="12%">���ϴ���</td>
	<td  width="7%">���ⵥ��</td>
	<td  width="7%">��������</td>
	<td  width="12%">������</td>
</tr>
<%
	int row=0;
	String bgcolor="E8E8FF";

	String clbm=null;
	String clmc=null;
	String clgg=null;
	double gdj=0;
	double cksl=0;
	double ckje=0;
	String cldlmc=null;
	double allcksl=0;
	double allckje=0;

	ls_sql="SELECT cl_ckmx.clbm clbm,ckph,cl_ckmx.clmc,cl_ckmx.clgg,cl_ckmx.gdj,cksl,ckje,cldlmc  ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=rs.getDouble("gdj");
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));

		allcksl=allcksl+cksl;
		allckje=allckje+ckje;

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else 
		{
			bgcolor="FFFFFF";
		}
%>
		<tr align="center" bgcolor="<%=bgcolor%>">
		<td> <%=row%></td>
		<td> <%=clmc%>
		</td>
		<td> <%=clgg%>
		</td>
		<td> <%=cldlmc%>
		</td>
		<td> <%=gdj%>
		</td>
		<td><%=cksl%></td>
		<td> <%=ckje%></td>
		</tr>
<%
	}
	rs.close();
	ps.close();

%>
	<tr align="center">
	<td colspan="3">�� ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td> <%=allcksl%></td>
	<td> <%=allckje%></td>
	</tr>
</table>

<form method="post" action="" name="insertform" >
<div align="center">����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">�ͻ����</font></div>
      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">��ͬ��</font></div>
      </td>
      <td width="33%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">�ͻ�����</font></div>
      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="17%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="33%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="17%" align="right"><font color="#0000CC">���ʦ</font></td>
      <td width="33%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
      </td>
      <td width="32%"><%=zjxm%> </td>
      <td width="17%"> 
        <div align="right">ǩԼ��</div>
      </td>
      <td width="33%"><%=qye%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">ʩ����</font></div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">ʩ������</font></div>
      </td>
      <td width="33%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="32%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="17%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="33%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">��������</font></td>
      <td width="32%"> <%=ckph%> </td>
      <td align="right" width="17%"><font color="#0000CC"></font><font color="#0000CC">�ֹ�˾</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ckdw+"'",ckdw,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC"></font>������</td>
      <td width="32%"> <%=ckr%> </td>
      <td align="right" width="17%"><font color="#0000CC"></font>����ʱ��</td>
      <td width="33%"> <%=cksj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����������</td>
      <td width="32%"><%=ckzsl%></td>
      <td align="right" width="17%">�����ܽ��</td>
      <td width="33%"><%=ckzje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC"></font><font color="#0000CC">¼����</font></td>
      <td width="32%"> <%=lrr%> </td>
      <td align="right" width="17%"><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="33%"> <%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>���ͷ�ʽ</td>
      <td width="32%"> <%
	cf.radioToken(out, "psfs","1+����&2+����&9+����",psfs,true);
%> </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>�ƻ��ͻ�ʱ��</td>
      <td width="33%"> 
        <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>������</td>
      <td width="32%"> 
        <input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" readonly>
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ʵ���ͻ�ʱ��</td>
      <td width="32%"> 
        <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>�˷�</td>
      <td width="33%"> 
        <input type="text" name="yf" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">����¼����</font></td>
      <td width="32%"> 
        <input type="text" name="pslrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">����¼��ʱ��</font></td>
      <td width="33%"> 
        <input type="text" name="pslrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="hidden" name="ckph" value="<%=ckph%>">
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
        <input type="button"  value="��ӡ���͵�" onClick="window.open('dypsd.jsp?ckph=<%=ckph%>')" name="button">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%
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


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[ʵ���ͻ�ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "ʵ���ͻ�ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.pslrr)=="") {
		alert("������[����¼����]��");
		FormName.pslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.pslrsj)=="") {
		alert("������[����¼��ʱ��]��");
		FormName.pslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pslrsj, "����¼��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.yf)=="") {
		alert("������[�˷�]��");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "�˷�"))) {
		return false;
	}

	
	FormName.action="SavePsCl_ckd.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
