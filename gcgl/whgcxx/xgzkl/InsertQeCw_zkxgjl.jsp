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

<body bgcolor="#FFFFFF">


<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String dwbh= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
double wdzgce= 0;
double qye= 0;
double suijin= 0;
double suijinbfb= 0;
double sjf= 0;
double glf= 0;
double zqguanlif= 0;
double guanlif= 0;
double zkl= 0;
double zjxzkl= 0;
double cdzwjmje= 0;
double glfjmje= 0;
double sjjmje= 0;
double zqwjrqyexm= 0;
double zhwjrqyexm= 0;
String wjrqyexmsm=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zklx="";
double glfbfb=0;//����Ѱٷֱ�


try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,fgsbh,dwbh,sjsbh,sjs,sjsgh,wdzgce,zkl,zjxzkl,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,cdzwjmje,glfjmje,sjjmje,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		zjxzkl=rs.getDouble("zjxzkl");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();


	ls_sql="select zklx";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();

	if (zklx.equals("2"))
	{
		out.println("<font color='#FF0000'>���ѣ�Ŀǰ�ÿͻ�Ϊ�����ۿ�</font>");
	}

	zklx="1";

	


%>


<form method="post" action="SaveInsertQeCw_zkxgjl.jsp" name="insertform" target="_blank">
<div align="center"><strong>�޸�ȫ���ۿ�</strong>��<font color="#0000FF">�ͻ����</font>��<%=khbh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">��ͬ��</font></td>
      <td width="32%"> <%=hth%> </td>
      <td align="right" width="19%"><font color="#0000FF">�ͻ�����</font></td>
      <td width="31%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">���ݵ�ַ</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">�ֹ�˾</font></td>
      <td width="32%"> 
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,false);
%>      </td>
      <td align="right" width="19%"><font color="#0000FF">ǩԼ����</font></td>
      <td width="31%">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">���ʦ</font></td>
      <td width="32%"><%=sjs%></td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">����ԭ����</font></td>
      <td width="32%"><%=wdzgce%></td>
      <td align="right" width="19%"><font color="#0000FF">ǩԼ��</font></td>
      <td width="31%"><%=qye%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="32%"><%=suijinbfb%>% </td>
      <td align="right" width="19%"><font color="#0000FF">˰��</font></td>
      <td width="31%"><%=suijin%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td><%=glfbfb%>%</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��ǰ�������</font></td>
      <td><%=zqguanlif%></td>
      <td align="right"><font color="#0000FF">�ۺ󣭹����</font></td>
      <td><%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">δ����ǩԼ���</font></td>
      <td><%=zqwjrqyexm%><strong><font color="#0000FF">��</font></strong><font color="#0000FF"><strong>��ǰ��</strong></font></td>
      <td align="right"><font color="#0000FF">δ����ǩԼ���</font></td>
      <td><%=zhwjrqyexm%><font color="#0000FF"><strong>���ۺ�</strong></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">δ����ǩԼ����Ŀ</font></td>
      <td colspan="3"><%=wjrqyexmsm%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">��Ʒ�</font></td>
      <td width="32%"><%=sjf%></td>
      <td align="right" width="19%"><font color="#0000FF">�����</font></td>
      <td width="31%"><%=glf%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">��˾�����</font></td>
      <td colspan="3"> <%=cxhdbm%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">С�������</font></td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#0000FF">չ������</font></td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�ۿ�����</font></td>
      <td>
      <%
	cf.radioToken(out, "zklx","1+ȫ���ۿ�&2+�����ۿ�",zklx,true);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�޸�ǰ��ͬ�ۿ�</font></td>
      <td>
        <input type="text" name="gxqzkl" value="<%=zkl%>" size="10" maxlength="6" readonly>
        ��0&lt;�ۿ�&lt;=10��</td>
      <td align="right"><font color="#FF0000">*</font>�޸ĺ��ͬ�ۿ�</td>
      <td><input type="text" name="gxhzkl" size="10" maxlength="6" value="<%=zkl%>" >
      ��0&lt;�ۿ�&lt;=10��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�޸�ǰ�������ۿ���</font></td>
      <td><input type="text" name="gxqzjxzkl" value="<%=zjxzkl%>" size="10" maxlength="6" readonly>
��0&lt;�ۿ�&lt;=10��</td>
      <td align="right"><font color="#FF0000">*</font>�޸ĺ��������ۿ���</td>
      <td><input type="text" name="gxhzjxzkl" size="10" maxlength="6" value="<%=zjxzkl%>" >
��0&lt;�ۿ�&lt;=10��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�޸�ǰ��ͬ�����</font></td>
      <td><input type="text" name="gxqcdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0000">*</font>�޸ĺ��ͬ�����</td>
      <td><input type="text" name="gxhcdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�޸�ǰ����Ѽ����</font></td>
      <td><input type="text" name="gxqglfjmje" value="<%=glfjmje%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0000">*</font>�޸ĺ����Ѽ����</td>
      <td><input type="text" name="gxhglfjmje" value="<%=glfjmje%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">�޸�ǰ˰������</font></td>
      <td><input type="text" name="gxqsjjmje" value="<%=sjjmje%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0000">*</font>�޸ĺ�˰������</td>
      <td><input type="text" name="gxhsjjmje" value="<%=sjjmje%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">�޸���</font></td>
      <td width="32%"> 
        <input type="text" name="xgr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">�޸�ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="xgsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="hidden" name="khxm" value="<%=khxm%>" >
        <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
        <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

	if(	javaTrim(FormName.zklx)=="") {
		alert("������[�ۿ�����]��");
		FormName.zklx.focus();
		return false;
	}

	if(	javaTrim(FormName.gxhzkl)=="") {
		alert("������[�޸ĺ��ۿ�]��");
		FormName.gxhzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzkl, "�޸ĺ��ۿ�"))) {
		return false;
	}
	if (FormName.gxhzkl.value<=0 || FormName.gxhzkl.value>10)
	{
		alert("����[�޸ĺ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.gxhzkl.select();
		return false;
	}
	if(	javaTrim(FormName.gxhzjxzkl)=="") {
		alert("������[���º��������ۿ���]��");
		FormName.gxhzjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzjxzkl, "���º��������ۿ���"))) {
		return false;
	}
	if (FormName.gxhzjxzkl.value<=0 || FormName.gxhzjxzkl.value>10)
	{
		alert("����[���º��������ۿ���]Ӧ����0��10֮�䣡");
		FormName.gxhzjxzkl.select();
		return false;
	}


	if(	javaTrim(FormName.gxqcdzwjmje)=="") {
		alert("������[����ǰ��ͬ�����]��");
		FormName.gxqcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxqcdzwjmje, "����ǰ��ͬ�����"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhcdzwjmje)=="") {
		alert("������[���º��ͬ�����]��");
		FormName.gxhcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhcdzwjmje, "���º��ͬ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhglfjmje)=="") {
		alert("������[���º����Ѽ����]��");
		FormName.gxhglfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglfjmje, "���º����Ѽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsjjmje)=="") {
		alert("������[���º�˰������]��");
		FormName.gxhsjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjjmje, "���º�˰������"))) {
		return false;
	}


	if(	javaTrim(FormName.xgr)=="") {
		alert("������[�޸���]��");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsj)=="") {
		alert("������[�޸�ʱ��]��");
		FormName.xgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("������[��ע]��");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
