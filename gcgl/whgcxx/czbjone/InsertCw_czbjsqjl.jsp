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
String bjbbh=null;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;

double wdzgce=0;
double qye=0;
double zqgczjf=0;
double zhgczjf=0;

double suijinbfb=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;//����Ѱٷֱ�
double zqguanlif= 0;
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

	ls_sql="select bjbbh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjjb,hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,zjxm  ,gcjdbm,zt,qyrq,kgrq,jgrq,lrsj,dwbh,fgsbh ";
	ls_sql+=" ,wdzgce,qye,zqgczjf,zhgczjf,zqsuijin,suijin,suijinbfb,glfbfb,zqguanlif,guanlif  ";
	ls_sql+=" ,cxhdbmxq,cxhdbmzh,cxhdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

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

		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqsuijin=rs.getDouble("zqsuijin");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
	}
	rs.close();
	ps.close();

/*
	cf.checkYjQmjz("cw_qmjz");

	if (count==1)
	{
		out.println("�������һ��δ��ת��");
		return;
	}
	else if (count==2)
	{
		out.println("�����������δ��ת��");
		return;
	}
	else if (count==-1)
	{
		out.println("����");
		return;
	}
*/


	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
		out.println("�����깤�ͻ�������������");
		return;
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">
    <p>����������Ȩ��¼</p>
    <p><strong><font color="#FF0000">(ע�⣺�ͻ�ͬһ�첻����������Ȩ����ɾ�����״̬������������)</font></strong></p>
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#000099">�ͻ����</font>      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="18%" align="right"> 
        <font color="#000099">��ͬ��</font>      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#000099">�ͻ�����</font>      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="18%" align="right"> 
        <font color="#000099">ǩԼ����</font>      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#000099">���ʦ</font>      </td>
      <td width="32%"> <%=sjs%> </td>
      <td width="18%" align="right"> 
        <font color="#000099">���̵���</font>      </td>
      <td width="32%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" height="8" align="right"> 
        <font color="#000099">ʩ����</font>      </td>
      <td width="32%" height="8"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%" height="8" align="right"> 
        <font color="#000099">ʩ������</font>      </td>
      <td width="32%" height="8"> <%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">ǩԼ����</font></td>
      <td width="32%"><%=qyrq%></td>
      <td width="18%" align="right"><font color="#000099">¼��ʱ��</font></td>
      <td width="32%"><%=lrsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#000099">��ͬ��������</font></td>
      <td width="32%"><%=kgrq%></td>
      <td width="18%" align="right"><font color="#000099">��ͬ�깤����</font></td>
      <td width="32%"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">�μӹ�˾�����</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbm%>
          <input name="button3" type="button" onClick="window.open('/dhzx/dhzx/zkzsxx.jsp?khbh=<%=khbh%>')" value="�ۿ�����"></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">�μ�С�������</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">�μ�չ������</td>
      <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmzh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��ͬ�ܶ��ǰ</td>
      <td><%=wdzgce%></td>
      <td align="right">��ͬ�ܶ�ۺ�</td>
      <td><%=qye%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����ֱ�ӷѣ���ǰ</td>
      <td><%=zqgczjf%></td>
      <td align="right">����ֱ�ӷѣ��ۺ�</td>
      <td><%=zhgczjf%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����Ѱٷֱ�</td>
      <td><%=glfbfb%>%</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">����ѣ���ǰ</td>
      <td><%=zqguanlif%></td>
      <td align="right">����ѣ��ۺ�</td>
      <td><%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">˰��ٷֱ�</td>
      <td><%=suijinbfb%> % </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">˰����ǰ</td>
      <td><%=zqsuijin%></td>
      <td align="right">˰���ۺ�</td>
      <td><%=suijin%></td>
    </tr>
  </table>
  <BR>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#CC0000">*</font>���ۼ���</td>
      <td width="32%">
        <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjb+"'",bjjb);
%> 
      </select>      </td>
      <td width="18%" align="right"><font color="#CC0000">*</font>���۰汾��</td>
      <td width="32%"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb where bj_dzbjbb.bjbbh='"+bjbbh+"' ",bjbbh);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#CC0000">*</font><font color="#000099">��Ȩ��</font></td>
      <td width="32%"> 
      <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="18%" align="right"><font color="#CC0000">*</font><font color="#000099">��Ȩʱ��</font></td>
      <td width="32%"> 
      <input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#CC0000">*</font>��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset"></td>
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
	if(	javaTrim(FormName.bjjb)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjb.focus();
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
