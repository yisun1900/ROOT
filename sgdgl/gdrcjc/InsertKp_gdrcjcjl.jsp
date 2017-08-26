<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String xjr=cf.GB2Uni(request.getParameter("ysr"));
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgdmc=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

int count=0;
//����¼��
String jcjlh=null;

try {
	conn=cf.getConnection();

//����¼��
	ls_sql="select NVL(max(substr(jcjlh,8,3)),0)";
	ls_sql+=" from  kp_gdrcjcjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jcjlh=khbh+cf.addZero(count+1,3);

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,crm_khxx.sgd,sgdmc,zjxm,sgbz";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();

	if (xjr.equals(""))
	{
		xjr=zjxm;
	}


}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">

<div align="center">�����ճ���飨��¼�ţ�<%=jcjlh%>��</div>

	<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����¼��</td>
	<td  width="5%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="5%">�������</td>
	<td  width="5%">�����</td>
	<td  width="5%">������־</td>
	<td  width="5%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="15%">��ע</td>
	</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT kp_gdrcjcjl.jcjlh,kp_gdrcjcjl.jcr,kp_gdrcjcjl.jcsj,dm_rcjclxbm.rcjclxmc,dm_rcjcjgbm.rcjcjgmc, DECODE(kp_gdrcjcjl.spbz,'1','δ����','2','����'),kp_gdrcjcjl.spr,kp_gdrcjcjl.spsj,kp_gdrcjcjl.lrr,kp_gdrcjcjl.lrsj,kp_gdrcjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,dm_rcjcjgbm,dm_rcjclxbm,kp_gdrcjcjl  ";
    ls_sql+=" where kp_gdrcjcjl.rcjcjgbm=dm_rcjcjgbm.rcjcjgbm(+) and kp_gdrcjcjl.rcjclxbm=dm_rcjclxbm.rcjclxbm(+) and kp_gdrcjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and kp_gdrcjcjl.khbh='"+khbh+"'";
    ls_sql+=" order by kp_gdrcjcjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jcjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_gdrcjcjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jcjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%> 
</table>

<form method="post" action="" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#000099">ʵ��������</font> </td>
    <td><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ͻ�����</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">���ʦ</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">ʩ����</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ʼ�����</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�����</td> 
  <td width="32%"><input type="text" name="jcr" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>���ʱ��</td> 
  <td width="32%"><input type="text" name="jcsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�������</td> 
  <td width="32%"><select name="rcjclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rcjclxbm,rcjclxmc from dm_rcjclxbm order by rcjclxbm","");
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�����</td> 
  <td width="32%"><select name="rcjcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rcjcjgbm,rcjcjgmc from dm_rcjcjgbm order by rcjcjgbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="sgd" value="<%=sgd%>" >
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="button"  value="����¼��" onClick="window.open('PlInserKp_rcjcmx.jsp?jcjlh=<%=jcjlh%>')" name="pllr" disabled>
	<input type="button"  value="�ϴ���Ƭ" onClick="f_lrzp(insertform)" name="lrzp" disabled>
    <input type="button"  value="�鿴��Ƭ" onClick="f_ckzp(insertform)" name="ckzp" disabled>
<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("������[����¼��]��");
		FormName.jcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jcr)=="") {
		alert("������[�����]��");
		FormName.jcr.focus();
		return false;
	}
	if(	javaTrim(FormName.jcsj)=="") {
		alert("������[���ʱ��]��");
		FormName.jcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jcsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.rcjclxbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.rcjclxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjcjgbm)=="") {
		alert("��ѡ��[�����]��");
		FormName.rcjcjgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.pllr.disabled=false;
	FormName.lrzp.disabled=false;
	FormName.ckzp.disabled=false;

	FormName.action="SaveInsertKp_gdrcjcjl.jsp";
	FormName.submit();
	return true;
}

function f_lrzp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("������[����¼��]��");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("������[����¼��]��");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
