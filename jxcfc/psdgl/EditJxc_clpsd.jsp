<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�����</title>
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
String fclb=null;
String jhshsj=null;
String fkje=null;
String lx=null;
double yf=0;
double qtsf=0;
String ssbm=null;
String lrr=null;
String lrrq=null;
String bz=null;


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
double qye=0;
String dwbh=null;
String fgs=null;

double allbzlyje=0;
double alllyxxje=0;
double alllysxje=0;


try { 
	conn=cf.getConnection();

	ls_sql="select khbh,psfs,fclb,jhshsj,fkje,yf,qtsf,ssbm,lrr,lrrq,bz";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		psfs=cf.fillNull(rs.getString("psfs"));
		fclb=cf.fillNull(rs.getString("fclb"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		ssbm=cf.fillNull(rs.getString("ssbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		bz=cf.fillNull(rs.getString("bz"));
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
		qye=rs.getDouble("qye");
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();

	ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allbzlyje=rs.getDouble(1);
		alllyxxje=rs.getDouble(2);
		alllysxje=rs.getDouble(3);
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
<div align="center">�޸Ĳ��ϵ������ϵ��ţ�<%=psph%>��
  <BR>
  <strong><font color="#FF0000">ע�⣺���ύǰ���������ͳ�ơ���ť���鿴�Ƿ���ϱ�׼�������ύ�󾭹������������ܳ���</font></strong>

</div>
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
      <td align="right"><strong><font color="#0000CC">ǩԼ��</font></strong></td>
      <td><%=qye%>�����̣�����ѣ�˰��</td>
      <td align="right"><strong><font color="#0000CC">��׼���ö�</font></strong></td>
      <td><%=allbzlyje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><strong><font color="#0000CC">��������</font></strong></td>
      <td><%=alllyxxje%></td>
      <td align="right"><strong><font color="#0000CC">��������</font></strong></td>
      <td><%=alllysxje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>�������</td>
      <td width="32%"> <%
	cf.radioToken(out, "fclb","1+����&2+����&3+����",fclb);
%> </td>
      <td align="right" width="18%"></td>
      <td width="32%"> 
        </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>���ͷ�ʽ</td>
      <td width="32%"> <%
	cf.radioToken(out, "psfs","1+����&2+����&9+����",psfs);
%> </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�ƻ��ͻ�ʱ��</td>
      <td width="32%"> 
      <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>�����˷�</td>
      <td width="32%"> 
      <input type="text" name="yf" value="<%=yf%>" size="20" maxlength="10" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�����շ�</td>
      <td width="32%"> 
      <input type="text" name="qtsf" value="<%=qtsf%>" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>������</td>
      <td width="32%"> 
      <input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="32%"><select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="32%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"> 
      <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <p>
          <input type="hidden" name="dqbm" value="<%=dqbm%>">
          <input type="hidden" name="psph" value="<%=psph%>" >
          <input type="hidden" name="khbh" value="<%=khbh%>">
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="button"  value="���Ϸ���ת��" onClick="f_glfx(insertform)" name="glfx" >
          <input type="button"  value="���ò���¼��" onClick="f_pllr(insertform)" name="pllr">
          <input type="button"  value="ѡ��¼��" onClick="f_cklr(insertform)" name="cklr" >
          <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" >
          <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" >
          <input type="reset"  value="����" name="reset">
        </p>
      <p>
        <input type="button"  value="����ͳ��" onClick="f_fltj(insertform)" name="fltj" >        
        <input type="button"  value="������ӡ" onClick="f_print(insertform)" name="print" >
        <input type="button"  value="��Ӧ�̴�ӡ" onClick="f_gysprint(insertform)" name="gysprint" >
      </p></td>
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
	if(	!radioChecked(FormName.psfs)) {
		alert("��ѡ��[���ͷ�ʽ]��");
		FormName.psfs[0].focus();
		return false;
	}
  if(	!radioChecked(FormName.fclb)) {
		alert("��ѡ��[�������]��");
		FormName.fclb[0].focus();
		return false;
	}
	if (FormName.psfs[0].checked)
	{
		if(	javaTrim(FormName.jhshsj)=="") {
			alert("������[�ƻ��ͻ�ʱ��]��");
			FormName.jhshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.jhshsj.value="";
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

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("������[¼�벿��]��");
		FormName.ssbm.focus();
		return false;
	}

	FormName.action="SaveEditJxc_clpsd.jsp";
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

	FormName.action="GetGlfx.jsp";
	FormName.submit();
	return true;
}


function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="PlJxc_clpsmx.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="tjpsd.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="/jxcdy/dypsd.jsp";
	FormName.submit();
	return true;
}

function f_gysprint(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psph)=="") {
		alert("������[���ϵ���]��");
		FormName.psph.focus();
		return false;
	}

	FormName.action="/jxcdy/gysdy.jsp";
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

	FormName.action="/khxx/ViewGlfx.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
