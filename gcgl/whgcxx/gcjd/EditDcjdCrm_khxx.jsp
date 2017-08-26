<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="SaveEditGcjdCrm_khxx.jsp" name="editform">
      <div align="center">�޸ģ����̽���</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        <font color="#0000FF">�ͻ����</font>      </td>
      <td width="31%"><%=khbh%> </td>
      <td width="18%" align="right"> 
        <font color="#0000FF">��ͬ��</font>      </td>
      <td width="32%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        <font color="#0000FF">�ͻ�����</font>      </td>
      <td width="31%"> <%=khxm%> </td>
      <td width="18%" align="right"><font color="#0000FF">���̵���</font></td>
      <td width="32%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000FF">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000FF">ʩ����</font></td>
      <td width="31%"><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
      <td width="18%" align="right"><font color="#0000FF">ʩ������</font></td>
      <td width="32%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        <font color="#0000FF">���ʦ</font>      </td>
      <td width="31%"><%=sjs%> </td>
      <td width="18%" align="right"> 
        <font color="#0000FF">ǩԼ����</font>      </td>
      <td width="32%"><%=dwmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000FF">ǩԼ����</font></td>
      <td width="31%"><%=qyrq%> </td>
      <td width="18%" align="right"><font color="#0000FF">���齻������</font></td>
      <td width="32%"><%=jyjdrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000FF">��ͬ��������</font></td>
      <td width="31%"><%=kgrq%> </td>
      <td width="18%" align="right"><font color="#0000FF">��ͬ��������</font></td>
      <td width="32%"><%=jgrq%> </td>
    </tr>
    <tr bgcolor="#E8E8FF" align="center"> 
      <td colspan="4" height="29">�޸�������Ϣ</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="19%" align="right">���̽���</td>
      <td width="31%">
        <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",gcjdbm);
%> 
        </select>      </td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">ʵ�ʿ�������</td>
      <td width="31%"><input type="text" name="sjkgrq" size="20" maxlength="10"  value="<%=sjkgrq%>" onDblClick="JSCalendar(this)"></td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">���ι�����������</td>
      <td width="31%"><input type="text" name="sybgcrq" size="20" maxlength="10"  value="<%=sybgcrq%>" onDblClick="JSCalendar(this)"></td>
      <td width="18%" align="right">ʵ����������ʱ��</td>
      <td width="32%"> 
        <input type="text" name="szqsj" size="20" maxlength="10"  value="<%=szqsj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">ʵ�ʿ�������</td>
      <td width="31%"><input type="text" name="sjjgrq" size="20" maxlength="10"  value="<%=sjjgrq%>" onDblClick="JSCalendar(this)"></td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">ʵ���������</td>
      <td width="31%"><input type="text" name="sjwjrq" size="20" maxlength="10"  value="<%=sjwjrq%>" onDblClick="JSCalendar(this)"></td>
      <td width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">      </td>
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
	if(	javaTrim(FormName.khbh)=="") 
	{
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") 
	{
		alert("������[���̽���]��");
		FormName.gcjdbm.focus();
		return false;
	}

	if(!(isDatetime(FormName.sjkgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sybgcrq, "���ι���ʵ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.szqsj, "ʵ����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjjgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "ʵ���������"))) {
		return false;
	}

	if( FormName.gcjdbm.value=="1") 
	{
		if(	javaTrim(FormName.sjkgrq)!="") 
		{
			alert("[ʵ�ʿ�������]ӦΪ�գ�");
			FormName.sjkgrq.select();
			return false;
		}
	}
	else if( FormName.gcjdbm.value=="2") 
	{
		if(	javaTrim(FormName.sjkgrq)=="") 
		{
			alert("������[ʵ�ʿ�������]��");
			FormName.sjkgrq.focus();
			return false;
		}
	}
	else if( FormName.gcjdbm.value=="3") 
	{
		if(	javaTrim(FormName.szqsj)=="") 
		{
			alert("������[ʵ����������ʱ��]��");
			FormName.szqsj.focus();
			return false;
		}
	}
	else if( FormName.gcjdbm.value=="6") 
	{
		if(	javaTrim(FormName.sybgcrq)=="") 
		{
			alert("������[���ι�����������]��");
			FormName.sybgcrq.focus();
			return false;
		}
	}
	else if( FormName.gcjdbm.value=="4") 
	{
		if(	javaTrim(FormName.sjjgrq)=="") 
		{
			alert("������[ʵ�ʿ�������]��");
			FormName.sjjgrq.focus();
			return false;
		}
	}
	else if( FormName.gcjdbm.value=="5") 
	{
		if(	javaTrim(FormName.sjwjrq)=="") 
		{
			alert("������[ʵ���������]��");
			FormName.sjwjrq.focus();
			return false;
		}
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
