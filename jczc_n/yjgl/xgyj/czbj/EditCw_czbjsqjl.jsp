<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String sqsj=null;
String sqr=null;
String wcbz=null;
String wcsj=null;
String wcr=null;
String yjjzsj=null;
String gxqwdzgce=null;
String gxqzkl=null;
String gxqqye=null;
String gxqsuijin=null;
String gxqsuijinbfb=null;
String gxqsjf=null;
String gxqglf=null;
String gxqguanlif=null;

double gxhwdzgce=0;
double gxhzkl=0;
double gxhqye=0;
double gxhsuijin=0;
double gxhsuijinbfb=0;
double gxhsjf=0;
double gxhglf=0;
double gxhguanlif=0;

String bz=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String zt=null;
String gcjdbm=null;
String fgsbh=null;
String dwbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sqsj,fgsbh,sqr,wcbz,wcsj,wcr,yjjzsj,gxqwdzgce,gxqzkl,gxqqye,gxqsuijin,gxqsuijinbfb,gxqsjf,gxqglf,gxqguanlif,gxhwdzgce,gxhzkl,gxhqye,gxhsuijin,gxhsuijinbfb,gxhsjf,gxhglf,gxhguanlif,bz ";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where khbh='"+khbh+"' and  wcbz='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqr=cf.fillNull(rs.getString("sqr"));
		wcbz=cf.fillNull(rs.getString("wcbz"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		wcr=cf.fillNull(rs.getString("wcr"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		gxqwdzgce=cf.fillNull(rs.getString("gxqwdzgce"));
		gxqzkl=cf.fillNull(rs.getString("gxqzkl"));
		gxqqye=cf.fillNull(rs.getString("gxqqye"));
		gxqsuijin=cf.fillNull(rs.getString("gxqsuijin"));
		gxqsuijinbfb=cf.fillNull(rs.getString("gxqsuijinbfb"));
		gxqsjf=cf.fillNull(rs.getString("gxqsjf"));
		gxqglf=cf.fillNull(rs.getString("gxqglf"));
		gxqguanlif=cf.fillNull(rs.getString("gxqguanlif"));

/*
		gxhwdzgce=rs.getDouble("gxhwdzgce");
		gxhzkl=rs.getDouble("gxhzkl");
		gxhqye=rs.getDouble("gxhqye");
		gxhsuijin=rs.getDouble("gxhsuijin");
		gxhsuijinbfb=rs.getDouble("gxhsuijinbfb");
		gxhsjf=rs.getDouble("gxhsjf");
		gxhglf=rs.getDouble("gxhglf");
		gxhguanlif=rs.getDouble("gxhguanlif");
*/

		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,zjxm,kgrq,jgrq,sjkgrq,sjjgrq,zt,gcjdbm,fgsbh,dwbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	rs.close();
	ps.close();

	String jzbz=null;
	String bjjb=null;
	String zklx="";
	double spzkl=0;
	ls_sql="select jzbz,bjjb,zklx,spzkl";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jzbz=rs.getString("jzbz");
		bjjb=rs.getString("bjjb");
		zklx=cf.fillNull(rs.getString("zklx"));
		spzkl=rs.getDouble("spzkl");
	}
	else{
		out.println("������ѯ�ͻ���Ϣ�����ڣ�"+khbh);
		return;
	}
	rs.close();
	ps.close();

	if (bjjb==null)
	{
		out.println("<P>������ѯ�ͻ����ۼ��𲻴���");
		return;
	}

	if (spzkl==0)//��׼�ۿ���
	{
		spzkl=10;
	}

	gxhzkl=spzkl;
////////////////
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	qye=dzbj.getBjje(conn,khbh,"yzf");

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="SaveEditCw_czbjsqjl.jsp" name="editform" target="_blank">
  <div align="center">�������ۣ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ͻ����</font></div>
      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">��ͬ��</font></div>
      </td>
      <td width="31%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ͻ�����</font></div>
      </td>
      <td width="31%"> <%=khxm%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">ǩԼ����</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">���ʦ</font></div>
      </td>
      <td width="31%"> <%=sjs%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
      </td>
      <td width="31%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">ʩ����</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">ʩ������</font></div>
      </td>
      <td width="31%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ȩ��</td>
      <td width="31%"><%=sqr%> </td>
      <td align="right" width="19%">��Ȩʱ��</td>
      <td width="31%"><%=sqsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�����</td>
      <td width="31%"> 
        <input type="text" name="wcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>���ʱ��</td>
      <td width="31%"> 
        <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ��ͬԭ����</font></td>
      <td width="31%"> 
        <input type="text" name="gxqwdzgce" size="20" maxlength="17"  value="<%=gxqwdzgce%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">���º��ͬԭ����</font></td>
      <td width="31%"> 
        <input type="text" name="gxhwdzgce" size="20" maxlength="17"  value="<%=gxhwdzgce%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ�ۿ���</font></td>
      <td width="31%"> 
        <input type="text" name="gxqzkl" size="10" maxlength="9"  value="<%=gxqzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b> </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">���º��ۿ���</font></td>
      <td width="31%"> 
        <input type="text" name="gxhzkl" size="10" maxlength="9"  value="<%=gxhzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰǩԼ��</font></td>
      <td width="31%"> 
        <input type="text" name="gxqqye" size="20" maxlength="17"  value="<%=gxqqye%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">���º�ǩԼ��</font></td>
      <td width="31%"> 
        <input type="text" name="gxhqye" size="20" maxlength="17"  value="<%=gxhqye%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ˰��ٷֱ�</font></td>
      <td width="31%"> 
        <input type="text" name="gxqsuijinbfb" size="10" maxlength="9"  value="<%=gxqsuijinbfb%>" readonly>
        % </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">���º�˰��ٷֱ�</font></td>
      <td width="31%"> 
        <input type="text" name="gxhsuijinbfb" size="10" maxlength="9"  value="<%=gxhsuijinbfb%>" readonly>
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ˰��</font></td>
      <td width="31%"> 
        <input type="text" name="gxqsuijin" size="20" maxlength="17"  value="<%=gxqsuijin%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">���º�˰��</font></td>
      <td width="31%"> 
        <input type="text" name="gxhsuijin" size="20" maxlength="17"  value="<%=gxhsuijin%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ��Ʒ�</font></td>
      <td width="31%"> 
        <input type="text" name="gxqsjf" size="20" maxlength="17"  value="<%=gxqsjf%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>���º���Ʒ�</td>
      <td width="31%"> 
        <input type="text" name="gxhsjf" size="20" maxlength="17"  value="<%=gxhsjf%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ�����</font></td>
      <td width="31%"> 
        <input type="text" name="gxqglf" size="20" maxlength="17"  value="<%=gxqglf%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>���º�����</td>
      <td width="31%"> 
        <input type="text" name="gxhglf" size="20" maxlength="17"  value="<%=gxhglf%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#0000CC">����ǰ�����</font></td>
      <td width="31%"> 
        <input type="text" name="gxqguanlif" size="20" maxlength="17"  value="<%=gxqguanlif%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>���º�����</td>
      <td width="31%"> 
        <input type="text" name="gxhguanlif" size="20" maxlength="17"  value="<%=gxhguanlif%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="sqsj"  value="<%=sqsj%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wcr)=="") {
		alert("������[�����]��");
		FormName.wcr.focus();
		return false;
	}
	if(	javaTrim(FormName.wcsj)=="") {
		alert("������[���ʱ��]��");
		FormName.wcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "���ʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.gxhwdzgce)=="") {
		alert("������[���º��ͬԭ����]��");
		FormName.gxhwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhwdzgce, "���º��ͬԭ����"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhzkl)=="") {
		alert("������[���º��ۿ���]��");
		FormName.gxhzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzkl, "���º��ۿ���"))) {
		return false;
	}
	if (FormName.gxhzkl.value<0 || FormName.gxhzkl.value>10)
	{
		alert("����[���º��ۿ���]Ӧ����0��10֮�䣡");
		FormName.gxhzkl.select();
		return false;
	}


	if(	javaTrim(FormName.gxhqye)=="") {
		alert("������[���º�ǩԼ��]��");
		FormName.gxhqye.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhqye, "���º�ǩԼ��"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsuijin)=="") {
		alert("������[���º�˰��]��");
		FormName.gxhsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijin, "���º�˰��"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhsuijinbfb)=="") {
		alert("������[���º�˰��ٷֱ�]��");
		FormName.gxhsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijinbfb, "���º�˰��ٷֱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhsjf)=="") {
		alert("������[���º���Ʒ�]��");
		FormName.gxhsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjf, "���º���Ʒ�"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhglf)=="") {
		alert("������[���º�����]��");
		FormName.gxhglf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglf, "���º�����"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhguanlif)=="") {
		alert("������[���º�����]��");
		FormName.gxhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhguanlif, "���º�����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
