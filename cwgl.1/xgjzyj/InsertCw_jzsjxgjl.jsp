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
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;
String tdsj=null;
double wdzgce=0;
double qye=0;

String yjjzsj="";
String tdyjjzsj="";
String zt=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select yjjzsj,tdyjjzsj,khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq,tdsj,wdzgce,qye  ,zt";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");

		zt=cf.fillNull(rs.getString("zt"));
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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jzsjxgjl.jsp" name="insertform" target="_blank">
  <div align="center">�޸ģ���תʱ��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">�ͻ����</font></td>
      <td width="32%"><%=khbh%></td>
      <td align="right" width="22%"><font color="#000099">��ͬ��</font></td>
      <td width="28%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">�ͻ�����</font></td>
      <td width="32%"><%=khxm%></td>
      <td align="right" width="22%"><font color="#000099">���ݵ�ַ</font></td>
      <td width="28%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">���ʦ</font></td>
      <td width="32%"><%=sjs%></td>
      <td align="right" width="22%"><font color="#000099">�ʼ�Ա</font></td>
      <td width="28%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ʩ����</font></td>
      <td width="32%"><%=sgdmc%></td>
      <td align="right" width="22%"><font color="#000099">ʩ������</font></td>
      <td width="28%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ǩԼ����</font></td>
      <td width="32%"><%=dwmc%></td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099"><b>ǩԼ����</b></font></td>
      <td width="32%"><%=qyrq%></td>
      <td align="right" width="22%"><b>�˵�ʱ��</b></td>
      <td width="28%"><%=tdsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="28" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>�޸�����</td>
      <td width="32%"> 
        <input type="radio" name="xglx"  value="1" checked>
        �޸� </td>
      <td align="right" width="22%"><font color="#CC0000">*</font>�ͻ�����</td>
      <td width="28%"> 
        <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectToken(out,"2+��װ�ͻ�&3+�˵��ͻ�&4+���ɿͻ�&5+��ƿͻ�",zt,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ԭ��ǩ����תʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="yqdjzsj" value="<%=yjjzsj%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="22%"><b><font color="#CC0000">�޸ĺ�ǩ����תʱ��</font></b></td>
      <td width="28%"> 
        <input type="text" name="xghqdjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ԭ���˵���תʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="ytdjzsj" value="<%=tdyjjzsj%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="22%"><b><font color="#CC0000">�޸ĺ��˵���תʱ��</font></b></td>
      <td width="28%"> 
        <input type="text" name="xghtdjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ԭ����ԭ����</font></td>
      <td width="32%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ԭ����ǩԼ��</font></td>
      <td width="32%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">�޸���</font></td>
      <td width="32%"> 
        <input type="text" name="xgr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="22%"><font color="#CC0000">*</font><font color="#000099">�޸�ʱ��</font></td>
      <td width="28%"> 
        <input type="text" name="xgsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>�޸�˵��</td>
      <td colspan="3"> 
        <textarea name="xgsm" rows="3" cols="76"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="hidden" name="hth"  value="<%=hth%>" >
        <input type="hidden" name="khxm"  value="<%=khxm%>" >
        <input type="button"  value="����" name="bc" onClick="f_do(insertform)">
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
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
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
	if(	javaTrim(FormName.xgr)=="") {
		alert("������[�޸���]��");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.zt)=="") {
		alert("��ѡ��[�ͻ�����]��");
		FormName.zt.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ԭ����]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}

	if(	javaTrim(FormName.xgsm)=="") {
		alert("������[�޸�˵��]��");
		FormName.xgsm.focus();
		return false;
	}

	if(!(isDatetime(FormName.yqdjzsj, "ԭǩ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ytdjzsj, "ԭ�˵���תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghqdjzsj, "�޸ĺ�ǩ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghtdjzsj, "�޸ĺ��˵���תʱ��"))) {
		return false;
	}


	//���¼���Ƿ���ȷ
	if ("<%=zt%>"!="3")//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	{
		if(	javaTrim(FormName.xghtdjzsj)!="") {
			alert("���󣡷��˵��ͻ��������С��޸ĺ��˵���תʱ�䡻");
			FormName.xghtdjzsj.select();
			return false;
		}
	}

	if(	javaTrim(FormName.xghtdjzsj)!="") 
	{
		if(	javaTrim(FormName.xghqdjzsj)=="") {
			alert("������¼�롺�޸ĺ��˵���תʱ�䡻�����޸ĺ�ǩ����תʱ�䡻����Ϊ��");
			FormName.xghqdjzsj.select();
			return false;
		}
		if (FormName.xghqdjzsj.value>FormName.xghtdjzsj.value)
		{
			alert("���󣡡�ǩ����תʱ�䡻���ܴ��ڡ��˵���תʱ�䡻");
			FormName.xghqdjzsj.select();
			return false;
		}
	}


	if(	javaTrim(FormName.xghqdjzsj)!="") 
	{
		if (FormName.xghqdjzsj.value > "<%=cf.today()%>")
		{
			alert("���󣡡�ǩ����תʱ�䡻���ܴ��ڡ����졻");
			FormName.xghqdjzsj.select();
			return false;
		}

		if (FormName.xghqdjzsj.value < "<%=qyrq%>")
		{
			alert("���󣡡�ǩ����תʱ�䡻����С�ڡ�ǩԼ���ڡ�");
			FormName.xghqdjzsj.select();
			return false;
		}
	}

	if(	javaTrim(FormName.xghtdjzsj)!="") 
	{
		if (FormName.xghtdjzsj.value > "<%=cf.today()%>")
		{
			alert("���󣡡��˵���תʱ�䡻���ܴ��ڡ����졻");
			FormName.xghtdjzsj.select();
			return false;
		}
		if (FormName.xghtdjzsj.value < "<%=tdsj%>")
		{
			alert("���󣡡��˵���תʱ�䡻����С�ڡ��˵�ʱ�䡻");
			FormName.xghtdjzsj.select();
			return false;
		}
	}


	if (javaTrim(FormName.xghtdjzsj)==""  && javaTrim(FormName.xghqdjzsj)=="")
	{
		if (!confirm("���ѣ���ǩ����תʱ�䡻�͡��˵���תʱ�䡻ȫΪ�գ���ɾ��ȫ����ת��¼��ȷʵҪ������?") )	
		{
			return;
		}
	}
	else{
		if (!confirm("ȷʵҪ������?") )	
		{
			return;
		}
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
