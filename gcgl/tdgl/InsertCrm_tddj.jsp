<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String tdxh=null;
String qye=null;
String qyrq=null;
String sffj=null;
String sfyrz=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int sflqlp=0;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sgd,zjxm,sgbz,sjs,qye,qyrq,sffj,sfyrz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sgbz=cf.fillNull(rs.getString("sgbz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sffj=cf.fillNull(rs.getString("sffj"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
	}
	rs.close();

	ls_sql="select count(*)";
	ls_sql+=" from  yx_lqlpdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sflqlp=rs.getInt(1);
	}
	rs.close();

	//�˵��˿����
	int count=0;
	ls_sql="select NVL(max(substr(tdxh,8,2)),0)";
	ls_sql+=" from  crm_tddj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	
	tdxh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">

<%
if (sflqlp>0)
{
	%>
	<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=120 >
	<b><font color='#0000CC' class='3dfont' size='2' >��ע��:�ÿͻ���ȡ����Ʒ</font></b></marquee>

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%">�ͻ�����</td>
		<td  width="22%">��Ʒ����</td>
		<td  width="8%">��Ʒ����</td>
		<td  width="10%">��ȡʱ��</td>
		<td  width="8%">�Ƿ��˻�</td>
		<td  width="10%">�˻صǼ���</td>
		<td  width="10%">�˻�ʱ��</td>
		<td  width="22%">��ע</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT crm_khxx.khxm,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','��ȡ','2','�˻�'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,yx_lqlpdj.bz";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,yx_lqlpdj  ";
		ls_sql+=" where yx_lqlpdj.khbh=crm_khxx.khbh and yx_lqlpdj.lrbm=a.dwbh ";
		ls_sql+=" and yx_lqlpdj.khbh='"+khbh+"'";;
		ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";
		
		pageObj.sql=ls_sql;
	//���ж����ʼ��
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.out=out;
		pageObj.getDate(1);
		pageObj.printDate();
	%>
	</table>
	<%
}
%>

<form method="post" action="SaveInsertCrm_tddj.jsp" name="insertform"  >
<div align="center"> ��¼���˵���Ϣ���˵���ţ�<%=tdxh%>��</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">�ͻ����</font></div>
      </td>
      <td width="33%"> 
        <input type="hidden" name="tdxh" value="<%=tdxh%>" >
        <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
      </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">�ͻ�����</font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="74" maxlength="100"  value="<%=fwdz%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">�绰</font></div>
      </td>
      <td width="33%"> 
        <input type="text" name="dh" value="<%=lxfs%>" size="20" maxlength="20" readonly>
      </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">ǩԼ����</font></div>
      </td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">ʩ����</font></div>
      </td>
      <td width="33%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
        </select>
      </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">ʩ������</font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC">���ʦ</font></td>
      <td width="33%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
      </td>
      <td width="18%" align="right"><font color="#0000CC">���̵���</font></td>
      <td width="32%"> 
        <input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">ǩԼ��</font></div>
      </td>
      <td width="33%"> 
        <input type="text" name="qye" size="20" maxlength="8"  value="<%=qye%>" readonly>
      </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">ǩԼ����</font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">�Ƿ�ȯ</font></div>
      </td>
      <td width="33%"><%
	cf.radioToken(out, "sffj","Y+��&N+��",sffj,true);
%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">�Ƿ�����֤</font></div>
      </td>
      <td width="32%"><%
	cf.radioToken(out, "sfyrz","Y+��&N+��",sfyrz,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="17%" align="right"><font color="#FF0000">*</font>�Ƿ��˻�ȫ����Ʒ</td>
      <td width="33%">
<%
if (sflqlp>0)
{
	cf.radioToken(out, "sfthlp","Y+�˻�&N+δ�˻�","");
}
else{
	cf.radioToken(out, "sfthlp","W+δ����Ʒ","");
}
%>
	  </td>
      <td width="18%" align="right"><font color="#FF0000">*</font>�˵�ʱ��</td>
      <td width="32%">
        <input type="text" name="tdsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#FF0000">*</font>Ӧ�˽��</div>
      </td>
      <td width="33%"> 
        <input type="text" name="ytje" value="" size="20" maxlength="17" >
      </td>
      <td width="18%"> 
        <div align="right"><font color="#FF0000">*</font>ʵ�˽��</div>
      </td>
      <td width="32%"> 
        <input type="text" name="stje" value="" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#FF0000">*</font>�˵�ԭ��</div>
      </td>
      <td width="33%"> 
        <select name="tdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select tdyybm,tdyymc from dm_tdyybm order by tdyybm","");
%> 
        </select>
      </td>
      <td width="18%"> 
        <div align="right"><font color="#FF0000">*</font><font color="#0000FF">¼�뵥λ</font></div>
      </td>
      <td width="32%"> 
        <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></div>
      </td>
      <td width="33%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">
      </td>
      <td width="18%"> 
        <div align="right"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#FF0000">*</font>�˵�ԭ��˵��</td>
      <td colspan="3"> 
        <textarea name="tdyysm" cols="72" rows="5"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right">��ע</div>
      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.ytje)=="") {
		alert("��ѡ��[Ӧ�˽��]��");
		FormName.ytje.focus();
		return false;
	}
	if(!(isFloat(FormName.ytje, "Ӧ�˽��"))) {
		return false;
	}
	if(	javaTrim(FormName.stje)=="") {
		alert("��ѡ��[ʵ�˽��]��");
		FormName.stje.focus();
		return false;
	}
	if(!(isFloat(FormName.stje, "ʵ�˽��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdyybm)=="") {
		alert("��ѡ��[�˵�ԭ��]��");
		FormName.tdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdyysm)=="") {
		alert("��ѡ��[�˵�˵��]��");
		FormName.tdyysm.focus();
		return false;
	}

	if (FormName.tdyysm.value=="�ͻ�����ԭ��" || FormName.tdyysm.value=="�ͻ�ԭ��" )
	{
		alert("����ȷ¼��[�˵�˵��]��");
		FormName.tdyysm.select();
		return false;
	}
	if (FormName.tdyysm.value.length<10)
	{
		alert("[�˵�˵��]�������10���֣�");
		FormName.tdyysm.select();
		return false;
	}


	<%
	if (sflqlp>0)
	{
		%>
		if(	!radioChecked(FormName.sfthlp)) {
			alert("��ѡ��[�Ƿ��˻�ȫ����Ʒ]��");
			FormName.sfthlp[0].focus();
			return false;
		}
		<%
	}
	else{
		%>
		if(!FormName.sfthlp.checked) {
			alert("��ѡ��[�Ƿ��˻�ȫ����Ʒ]��");
			FormName.sfthlp.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.tdsj)=="") {
		alert("������[�˵�ʱ��]��");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "�˵�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
