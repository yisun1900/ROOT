<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqr=null;
String sqsj=null;
double sqzkl=0;
double sqzjxzkl=0;
String sfsqqtyh=null;
String sqqtyhnr=null;
String sqyysm=null;
String spr=null;
String spsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String zklx=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String zxdm=null;
String sjs=null;
String xxlrr=null;
String xxlrsj=null;
String zxdjbm=null;
String ssfgs=null;
String dqbm=null;

try {
	conn=cf.getConnection();

	ls_sql="select sqr,sqsj,sqzkl,sqzjxzkl,sfsqqtyh,sqqtyhnr,sqyysm,lrr,lrsj,lrbm,zklx,spr,spsj ";
	ls_sql+=" from  crm_dzyhsq";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqr=cf.fillNull(rs.getString("sqr"));
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqzkl=rs.getDouble("sqzkl");
		sqzjxzkl=rs.getDouble("sqzjxzkl");
		sfsqqtyh=cf.fillNull(rs.getString("sfsqqtyh"));
		sqqtyhnr=cf.fillNull(rs.getString("sqqtyhnr"));
		sqyysm=cf.fillNull(rs.getString("sqyysm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		zklx=cf.fillNull(rs.getString("zklx"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,xb,fwdz,lxfs,zxdm,sjs,lrr,lrsj,zxdjbm,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		xxlrr=cf.fillNull(rs.getString("lrr"));
		xxlrsj=cf.fillNull(rs.getDate("lrsj"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_dzyhsq.jsp" name="editform">
<div align="center">�޸Ĵ����Ż�����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        �ͻ����      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="19%" align="right"> 
        �ͻ�����      </td>
      <td width="31%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right" bgcolor="#CCCCFF"> 
        �Ա�      </td>
      <td width="31%"> <%
	cf.radioToken(out, "M+��&W+Ů",xb,true);
%> </td>
      <td width="19%" align="right"> 
        ��ϵ��ʽ      </td>
      <td width="31%"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        ���ݵ�ַ      </td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        ��ѯ����      </td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
      <td width="19%" align="right"> 
        ���ʦ      </td>
      <td width="31%"><%=sjs%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        ¼��ʱ��      </td>
      <td width="31%"> <%=xxlrsj%> </td>
      <td width="19%" align="right"> 
        ��Ϣ¼����      </td>
      <td width="31%"><%=xxlrr%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>������</td>
      <td width="31%"> 
        <input type="text" name="sqr" size="20" maxlength="20"  value="<%=sqr%>" >      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>����ʱ��</td>
      <td width="31%"> 
        <input type="text" name="sqsj" size="20" maxlength="10"  value="<%=sqsj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
      <td><input type="radio" name="zklx" value="2" checked>
�����ۿ�</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>ֱ�ӷѺ�ͬ�ۿ�</td>
      <td><input type="text" name="sqzkl" value="<%=sqzkl%>" size="12" maxlength="9" >
��>0��<=10��</td>
      <td align="right"><font color="#FF0000">*</font>ֱ�ӷ��������ۿ�</td>
      <td><input type="text" name="sqzjxzkl" value="<%=sqzjxzkl%>" size="12" maxlength="9" >
��>0��<=10��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>�Ƿ����������Ż�</td>
      <td><%
	cf.radioToken(out, "sfsqqtyh","Y+��&N+��",sfsqqtyh);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���������Ż�����</td>
      <td colspan="3"> 
        <textarea name="sqqtyhnr" cols="74" rows="3"><%=sqqtyhnr%></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>����ԭ��˵��</td>
      <td colspan="3"> 
        <textarea name="sqyysm" cols="74" rows="3"><%=sqyysm%></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="31%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC"> 
      <td colspan="6" align="center">�����շ��ۿ���</td>
    </tr>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">��Ŀ����</td>
		<td  width="19%">�շ���Ŀ����</td>
		<td  width="14%">�շ�����</td>
		<td  width="8%">��������ۿ�</td>
		<td  width="8%">�����ۿ�</td>
		<td  width="43%">��ע</td>
	</tr>
    
 
 <%
	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	String bz=null;
	double gdje=0;
	String sfkdz=null;
	double zdzk=0;

	ls_sql="SELECT sfxmbm,sfxmmc, DECODE(sflx,'1','ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰��(�ٷֱ�)','4','�̶����(���ɸ�)','5','�����(�ٷֱ�)') sflx,gdje, DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx, DECODE(sfjrqye,'1','����','2','������') sfjrqye, DECODE(jrsjbz,'1','����','2','������') jrsjbz, DECODE(jrglfbz,'1','����','2','������') jrglfbz, DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk,bz ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfkdz='Y'";
    ls_sql+=" order by sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		sflx=cf.fillNull(rs.getString("sflx"));
		gdje=rs.getDouble("gdje");
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfjrqye=cf.fillNull(rs.getString("sfjrqye"));
		jrsjbz=cf.fillNull(rs.getString("jrsjbz"));
		jrglfbz=cf.fillNull(rs.getString("jrglfbz"));
		sfkdz=cf.fillNull(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");
		bz=cf.fillNull(rs.getString("bz"));

		double sqdxzkl=0;
		ls_sql="SELECT sqdxzkl";
		ls_sql+=" from  crm_dxdzyh";
		ls_sql+=" where khbh='"+khbh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqdxzkl=rs1.getDouble("sqdxzkl");
		}
		rs1.close();
		ps1.close();

		String xs=null;
		if (sqdxzkl==0)
		{
			xs="";
		}
		else{
			xs=""+sqdxzkl;
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=sfxmbm%>
			  <input type="hidden" name="sfxmbm" value="<%=sfxmbm%>">			</td>
			<td><%=sfxmmc%></td>
			<td><%=sflx%></td>
			<td><%=zdzk%>
			  <input type="hidden" name="zdzk" value="<%=zdzk%>">			</td>
			<td>
			<input type="text" name="sqdxzkl" size="6" maxlength="6" value="<%=xs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>	
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
        
      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("������[������]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.zklx)=="") {
		alert("��ѡ��[�ۿ�����]��");
		FormName.zklx.focus();
		return false;
	}

	
	if(	javaTrim(FormName.sqzkl)=="") {
		alert("������[ֱ�ӷѺ�ͬ�ۿ�]��");
		FormName.sqzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sqzkl, "ֱ�ӷѺ�ͬ�ۿ�"))) {
		return false;
	}
	if (FormName.sqzkl.value<=0 || FormName.sqzkl.value>10)
	{
		alert("����[ֱ�ӷѺ�ͬ�ۿ�]Ӧ����0��10֮�䣡");
		FormName.sqzkl.select();
		return false;
	}
	if(	javaTrim(FormName.sqzjxzkl)=="") {
		alert("������[ֱ�ӷ��������ۿ�]��");
		FormName.sqzjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sqzjxzkl, "ֱ�ӷ��������ۿ�"))) {
		return false;
	}
	if (FormName.sqzjxzkl.value<=0 || FormName.sqzjxzkl.value>10)
	{
		alert("����[ֱ�ӷ��������ۿ�]Ӧ����0��10֮�䣡");
		FormName.sqzjxzkl.select();
		return false;
	}
	
	
	if(	!radioChecked(FormName.sfsqqtyh)) {
		alert("��ѡ��[�Ƿ����������Ż�]��");
		FormName.sfsqqtyh[0].focus();
		return false;
	}
	if (FormName.sfsqqtyh[0].checked)
	{
		if(	javaTrim(FormName.sqqtyhnr)=="") {
			alert("������[�����Ż�����]��");
			FormName.sqqtyhnr.focus();
			return false;
		}
	}
	else{
		FormName.sqqtyhnr.value="";
	}
	if(	javaTrim(FormName.sqyysm)=="") {
		alert("������[����ԭ��˵��]��");
		FormName.sqyysm.focus();
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
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
