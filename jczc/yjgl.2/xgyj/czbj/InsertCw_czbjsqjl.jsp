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
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgbz=null;

String gcjdbm=null;
String zt=null;

String fgsbh=null;
String dwbh=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String lrsj=null;
String bjjb="";

double wdzgce=0;
double zkl=0;
double qye=0;
double suijin=0;
double suijinbfb=0;
double sjf=0;
double glf=0;
double guanlif=0;


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where  khbh='"+khbh+"' and wcbz='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("���󣡿ͻ�[��������]�ѱ���Ȩ");
		return;
	}

	ls_sql="select bjjb,hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,zjxm  ,gcjdbm,zt,qyrq,kgrq,jgrq,lrsj,  wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,guanlif   ,dwbh,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));

		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		zt=cf.fillNull(rs.getString("zt"));

		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));

		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");

		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	if (!gcjdbm.equals("1") && !gcjdbm.equals("2"))
	{
		out.println("�����깤�ͻ�������������");
		return;
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
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
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">����������Ȩ��¼</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#000099">�ͻ����</font></div>
      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="19%"> 
        <div align="right"><font color="#000099">��ͬ��</font></div>
      </td>
      <td width="31%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#000099">�ͻ�����</font></div>
      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="19%"> 
        <div align="right"><font color="#000099">ǩԼ����</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#000099">���ʦ</font></div>
      </td>
      <td width="32%"> <%=sjs%> </td>
      <td width="19%"> 
        <div align="right"><font color="#000099">�ʼ�Ա</font></div>
      </td>
      <td width="31%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" height="8"> 
        <div align="right"><font color="#000099">ʩ����</font></div>
      </td>
      <td width="32%" height="8"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="19%" height="8"> 
        <div align="right"><font color="#000099">ʩ������</font></div>
      </td>
      <td width="31%" height="8"> <%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">����ԭ����</font></td>
      <td width="32%"><%=wdzgce%></td>
      <td width="19%" align="right"><font color="#000099">�ۿ���</font></td>
      <td width="31%"><%=zkl%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">ǩԼ��</font></td>
      <td width="32%"><%=qye%></td>
      <td width="19%" align="right"><font color="#000099">��Ʒ�</font></td>
      <td width="31%"><%=sjf%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">˰��ٷֱ�</font></td>
      <td width="32%"><%=suijinbfb%>%</td>
      <td width="19%" align="right"><font color="#000099">˰��</font></td>
      <td width="31%"><%=suijin%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">�����</font></td>
      <td width="32%"><%=glf%></td>
      <td width="19%" align="right"><font color="#000099">�����</font></td>
      <td width="31%"><%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">ǩԼ����</font></td>
      <td width="32%"><%=qyrq%></td>
      <td width="19%" align="right"><font color="#000099">¼��ʱ��</font></td>
      <td width="31%"><%=lrsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">��ͬ��������</font></td>
      <td width="32%"><%=kgrq%></td>
      <td width="19%" align="right"><font color="#000099">��ͬ�깤����</font></td>
      <td width="31%"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" align="right">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#CC0000">*</font>���ۼ���</td>
      <td width="32%">
        <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (bjjb!=null && !bjjb.equals(""))
	{
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjb+"'",bjjb);
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhmc='"+sjs+"' and zwbm='04' and dwbh='"+dwbh+"') order by bjjbbm","");
		out.println("select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhmc='"+sjs+"' and zwbm='04' and dwbh='"+dwbh+"') order by bjjbbm");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#CC0000">*</font><font color="#000099">��Ȩ��</font></td>
      <td width="32%"> 
        <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="19%" align="right"><font color="#CC0000">*</font><font color="#000099">��Ȩʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#CC0000">*</font>��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("��ѡ��[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.sqr)=="") {
		alert("������[��Ȩ��]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[��Ȩʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "��Ȩʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.bz)=="") {
		alert("������[��ע]��");
		FormName.bz.focus();
		return false;
	}

	FormName.action="SaveInsertCw_czbjsqjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
