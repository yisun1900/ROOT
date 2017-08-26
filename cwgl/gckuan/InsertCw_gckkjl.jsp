<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*,java.util.*"%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String khbh=request.getParameter("khbh");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxje=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String kkjlh=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,sgbz,jgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();


	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(kkjlh,8,2)),0)";
	ls_sql+=" from  cw_gckkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	kkjlh=khbh+cf.addZero(count+1,2);
	
	}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��¼�빤�̿ۿ�ۿ��¼�ţ�<%=kkjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCw_gckkjl.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ����</td>
  <td><%=khbh%></td>
  <td align="right">��ͬ��</td>
  <td><%=hth%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">�ͻ�����</div></td>
  <td><%=khxm%> </td>
  <td><div align="right">�ʼ�����</div></td>
  <td><%=zjxm%>��<%=zjdh%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ݵ�ַ</td>
  <td colspan="3"><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">ǩԼ����</div></td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>  </td>
  <td><div align="right">���ʦ</div></td>
  <td><%=sjs%>��<%=sjsdh%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%></td>
  <td align="right">���������</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʩ����</td>
  <td><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
  <td align="right">�೤</td>
  <td><%=sgbz%>��<%=bzdh%>��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">ǩԼ����</div></td>
  <td><%=qyrq%> </td>
  <td><div align="right">��ͬ��������</div></td>
  <td><%=jgrq%> </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td><div align="right">��װ����ǩԼ��</div></td>
  <td><%=qye%> </td>
  <td><div align="right">����ԭ����</div></td>
  <td><%=wdzgce%> </td>
</tr>

<tr bgcolor="#E8E8FF">
  <td align="right">��Ʒ�</td>
  <td><%=sjf%></td>
  <td align="right">�����</td>
  <td><%=glf%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">�������ܶ�</td>
  <td><%=cf.formatDouble(zjxje)%>��</td>
  <td align="right"><font color="#0000FF">���չ��̿�</font></td>
  <td><font color="#0000FF"><%=cf.formatDouble(sfke)%>������<font color="#0000FF">δ��<%=cf.formatDouble(qye+zjxje-sfke)%>��</font>��</font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">���̿ۿ�</div>  </td>
  <td width="32%"> 
    <input type="text" name="gckk" value="" size="20" maxlength="17" >  </td>
  <td width="18%"> 
    <div align="right">���ʦ�е�����</div>  </td>
  <td width="32%"> 
    <input type="text" name="sjsfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">ʩ���ӳе�����</div>  </td>
  <td width="32%"> 
    <input type="text" name="sgdfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
  <td width="18%"> 
    <div align="right">�ʼ�е�����</div>  </td>
  <td width="32%"> 
    <input type="text" name="zjfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">��˾�е�����</div>  </td>
  <td width="32%"> 
    <input type="text" name="gsfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
  <td width="18%"> 
    <div align="right">�������е�����</div>  </td>
  <td width="32%"> 
    <input type="text" name="qtfy" value="" size="20" maxlength="17" onchange="f_js(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">¼����</div>  </td>
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td width="18%"> 
    <div align="right">¼��ʱ��</div>  </td>
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">¼�벿��</div>  </td>
  <td colspan="3"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%"> 
    <div align="right">��ע</div>  </td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea> 
    <div align="right"></div></td>
  </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="hidden" name="kkjlh" value="<%=kkjlh%>" size="20" maxlength="9" readonly>
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly ></td>
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
function f_js(FormName)//����FormName:Form������
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=round(gk,2);
	FormName.gckk.value=gk;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kkjlh)=="") {
		alert("������[�ۿ��¼��]��");
		FormName.kkjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gckk)=="") {
		alert("������[���̿ۿ�]��");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "���̿ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("������[���ʦ�е�����]��");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "���ʦ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("������[ʩ���ӳе�����]��");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "ʩ���ӳе�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("������[�ʼ�е�����]��");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "�ʼ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("������[��˾�е�����]��");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "��˾�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("������[�������е�����]��");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "�������е�����"))) {
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
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	if (FormName.gckk.value!=(FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0))
	{
		alert("����[���̿ۿ�]����ϸ����һ����ֵ������");
		FormName.gckk.focus();
		return false;
	}

	if(	javaTrim(FormName.bz)=="") {
		alert("������[��ע]��");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
