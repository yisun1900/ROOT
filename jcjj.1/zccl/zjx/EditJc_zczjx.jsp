<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String yhmc=(String)session.getAttribute("yhmc");

String zczjxyybm=null;
String zjxze=null;
String htshsj=null;
String lrr=null;
String lrsj=null;
String zjxfssj=null;
String dwbh=null;
String bz=null;
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String ddhtshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String ddbz=null;
double hkze=0;
double zjhze=0;
String ddlx=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;
String ztjjgw=null;
String htcxhdje=null;

String ddbh=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
double zjxzkl=0;
String dzyy=null;

String djlrfs="";//���Ķ�������¼�뷽ʽ  1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
String kgcxhdbl="";//���Ķ����Ƿ�ɸĴ��������  Y���ɸģ�N�����ɸ�
String lx="";

try {
	conn=cf.getConnection();

	ls_sql="select ddbh,zczjxyybm,zjxze,htshsj,lrr,lrsj,zjxfssj,dwbh,bz,ddlx,zjxzkl,dzyy ";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where (zjxbh='"+zjxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zczjxyybm=cf.fillNull(rs.getString("zczjxyybm"));
		zjxze=cf.fillNull(rs.getString("zjxze"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		zjxzkl=rs.getDouble("zjxzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();


	ls_sql="select ztjjgw,htcxhdje,zcdlbm,zcxlbm,ppbm,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		ddhtshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		ddbz=cf.fillNull(rs.getString("bz"));
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	String bjjb="";
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
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
<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="" name="editform" target="_blank">
  <div align="center"> 
  <div align="center">�޸����������������ţ�<%=ddbh%>����ţ�<%=zjxbh%>��
          
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#CCCCFF"> 
        �ͻ����      </td>
      <td width="40%" bgcolor="#CCCCFF"> <%=khbh%> </td>
      <td width="18%" align="right" bgcolor="#CCCCFF"> 
        ��ͬ��      </td>
      <td width="26%" bgcolor="#CCCCFF"><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="16%" align="right">�ͻ�����</td>
      <td width="40%"><%=khxm%></td>
      <td width="18%" align="right">�ʼ�</td>
      <td width="26%"><%=zjxm%></td>
    </tr>
    <tr> 
      <td width="16%" bgcolor="#CCCCFF" align="right">���ݵ�ַ</td>
      <td width="40%" bgcolor="#CCCCFF"><%=fwdz%></td>
      <td width="18%" bgcolor="#CCCCFF" align="right">��װǩԼ��</td>
      <td width="26%" bgcolor="#CCCCFF"><%=qye%></td>
    </tr>
    <tr> 
      <td width="16%" bgcolor="#CCCCFF" align="right">���桢���ʦ</td>
      <td width="40%" bgcolor="#CCCCFF"><%=dwmc%>��<%=sjs%></td>
      <td width="18%" bgcolor="#CCCCFF" align="right">��װǩԼ����</td>
      <td width="26%" bgcolor="#CCCCFF"><%=qyrq%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="16%" align="right">ʩ���ӡ��೤</td>
      <td width="40%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>        ��<%=sgbz%></td>
      <td width="18%" align="right">��ͬ������������</td>
      <td width="26%"><%=kgrq%>---<%=jgrq%></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">�μӴ����</td>
      <td colspan="3"> <%=cxhdbm%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">�������ʡ��ص�</td>
      <td width="40%"><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%>��<%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
      <td width="18%" align="right">��ĿרԱ</td>
      <td width="26%"><%=xmzy%></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        פ��Ҿӹ���      </td>
      <td width="40%"> <%=clgw%> </td>
      <td width="18%" align="right"> 
        չ���Ҿӹ���      </td>
      <td width="26%"><%=ztjjgw%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">�������־</td>
      <td width="40%"><%
	cf.selectToken(out,"1+�������&2+�ȴ�����֪ͨ&3+������֪ͨ&4+�Ѳ���",xclbz,true);
%></td>
      <td width="18%" align="right">�ƻ�����ʱ��</td>
      <td width="26%"><%=jhclsj%></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        �ȴ��ͻ�֪ͨ      </td>
      <td width="40%"><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
      <td width="18%" align="right"> 
        ��ͬ�ͻ�ʱ��      </td>
      <td width="26%"><%=ddhtshsj%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        ǩ��ͬʱ��      </td>
      <td width="40%"><%=qhtsj%> </td>
      <td width="18%" align="right"> 
        �ɼ����ֹʱ��      </td>
      <td width="26%"><%=kjxsj%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        ��ͬ�ܶ�      </td>
      <td width="40%"> <%=hkze%> </td>
      <td width="18%" align="right"> 
        ��������      </td>
      <td width="26%"><%=zjhze%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right"> 
        �������ܶ�      </td>
      <td width="40%"><%=cf.formatDouble(hkze+zjhze)%> </td>
      <td width="18%" align="right"> 
        �����������      </td>
      <td width="26%"><%=htcxhdje%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td width="16%" align="right">��ͬ��ע</td>
      <td colspan="3"><%=ddbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" bgcolor="#FFFFFF" align="right"><font color="#FF0033">*</font><font color="#0000CC">���Ĵ���</font></td>
      <td width="40%"> 
        <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>      </td>
      <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">����С��</font></td>
      <td width="26%"> 
        <input type="text" name="zcxlbm" value="<%=zcxlbm%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">Ʒ��</font></td>
      <td width="40%"> 
        <input type="text" name="ppbm" value="<%=ppbm%>" readonly>      </td>
      <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�������ܶ�</font></td>
      <td width="26%"><input type="text" name="zjxze" size="20" maxlength="10"  value="<%=zjxze%>" readonly></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�������ۿ�</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" >
          <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���������ԭ��</td>
      <td colspan="3"><textarea name="dzyy" cols="80" rows="2" readonly><%=dzyy%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>������ԭ��</td>
      <td width="40%"><select name="zczjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm",zczjxyybm);
%>
      </select></td>
      <td width="18%" align="right"><font color="#FF0033">*</font>��ͬ�ͻ�ʱ��</td>
      <td width="26%"><input type="text" name="htshsj" size="20" maxlength="10"  value="<%=htshsj%>" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>�������ʱ��      </td>
      <td width="40%">
        <input type="text" name="zjxfssj" size="20" maxlength="10"  value="<%=zjxfssj%>" onDblClick="JSCalendar(this)">      </td>
      <td width="18%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">¼����</font>      </td>
      <td width="26%"> 
        <input type="text" name="lrr" size="20" maxlength="20" readonly  value="<%=yhmc%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font>      </td>
      <td width="40%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>      </td>
      <td width="18%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">¼�벿��</font>      </td>
      <td width="26%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="80" rows="2"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4" align="center"> 
		<input type="hidden" name="ddlx" value="<%=ddlx%>" >
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
          <input type="button"  value="���" onClick="f_wc(editform)" name="wc" >
          <input type="button"  value="��ӡ��ͬ" onClick="window.open('/jcjj/dygl/zcfjzjx.jsp?zjxbh=<%=zjxbh%>')" name="dy" >
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button"  value="�����޸���ϸ" onClick="f_plxg(editform)" name="plxg" >
		  <input type="button"  value="�����޸���ϸ" onClick="f_dpxg(editform)" name="dpxg" >

          <BR>
          <BR>
          <input type="button"  value="����[�ѹ���]�ͺ�" onClick="f_oldp(editform)" name="oldp" >
          <input type="button"  value="¼�룭�����ͺ�" onClick="f_lrxh(editform)" name="newpbz" <% if (lx.equals("2")) out.println("disabled");%>>
          <input type="button"  value="¼�룭��ѯ�ͺ�" onClick="f_cxxh(editform)" name="cxxh" <% if (lx.equals("2")) out.println("disabled");%>>
          <input type="button"  value="¼����д��Ŀ" onClick="f_newpsx(editform)" name="newpsx" <% if (lx.equals("2")) out.println("disabled");%>>
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
	if(	javaTrim(FormName.zczjxyybm)=="") {
		alert("��ѡ��[������ԭ��]��");
		FormName.zczjxyybm.focus();
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "��ͬ�ͻ�ʱ��"))) {
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
	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "�������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "�������ۿ�"))) {
		return false;
	}



	FormName.action="SaveEditJc_zczjx.jsp";
	FormName.submit();
	return true;
}
function f_oldp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrxh(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";

	FormName.submit();
	return true;
}
function f_cxxh(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}


function f_newpsx(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtDj.jsp";
		<%
	}
	else if (djlrfs.equals("2"))
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtZk.jsp";
		<%
	}
	else
	{
		%>
		FormName.action="InsertJc_zcddmxSxht.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_plxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			%>
			FormName.action="EditAllDjBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllDjJc_zcddmx.jsp";
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			%>
			FormName.action="EditAllZkBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllZkJc_zcddmx.jsp";
			<%
		}
	}
	else
	{
		%>
		FormName.action="EditAllNoJc_zcddmx.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}


function f_dpxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zczjxmxList.jsp";

	FormName.submit();
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("������[��������]��");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zczjx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
