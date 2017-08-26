<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String azr=null;
String sazrq=null;
String azsm=null;
String aztzr=null;
String kazsj=null;
String jhazrq=null;
String aztzsj=null;
String ksazsj=null;
String ycyybm=null;
String clzt=null;
String ycclzt=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ksazsj,ycyybm,azr,sazrq,azsm,aztzr,kazsj,aztzsj,jhazrq,ycclzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		azr=cf.fillNull(rs.getString("azr"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�Ҿ߶�������--�ӳٴ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
  
<form method="post" action="" name="selectform" >
<div align="center">�Ҿ߶�������--�ӳٴ���������ţ�<%=ddbh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">Э�̰�װʱ��</span></td>
      <td bgcolor="#CCCCFF"><%=kazsj%></td>
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">��ͬ��װʱ��</span></td>
      <td bgcolor="#CCCCFF"><%=jhazrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">����װ֪ͨ��</span></td>
      <td bgcolor="#CCCCFF"><%=aztzr%></td>
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">����װ֪ͨʱ��</span></td>
      <td bgcolor="#CCCCFF"><%=aztzsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCCCFF">��װ��ʼʱ��</td>
      <td bgcolor="#CCCCFF"><%=ksazsj%></td>
      <td align="right" bgcolor="#CCCCFF">��װ���ʱ��</td>
      <td bgcolor="#CCCCFF"><%=sazrq%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right" bgcolor="#CCCCFF">      �ӳ�ԭ��</td>
      <td width="31%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",ycyybm,true);
%> </td>
      <td width="18%" align="right" bgcolor="#CCCCFF">      �ӳٴ���״̬</td>
      <td width="32%" bgcolor="#CCCCFF"> <%
	cf.radioToken(out, "1+�ӳ�δ��ʵ&2+�ӳ�ԭ����ʵ&3+�ӳ�ԭ����ʵ",ycclzt,true);
%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right" bgcolor="#CCCCFF">��װ˵��</td>
      <td colspan="3"><%=azsm%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�ӳٺ�ʵʱ��</td>
      <td width="31%"> 
        <input type="text" name="ychssj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>      </td>
      <td width="18%" bgcolor="#E8E8FF" align="right">�ӳٺ�ʵ��</td>
      <td width="32%"> 
        <input type="text" name="ychsr" size="20" maxlength="10" value="<%=yhmc%>" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�ӳ�ԭ���Ƿ���ʵ</td>
      <td width="31%"> 
        <select name="ycclzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <option value="2">�ӳ�ԭ����ʵ</option>
          <option value="3">�ӳ�ԭ����ʵ</option>
        </select>      </td>
      <td width="18%" bgcolor="#E8E8FF" align="right">��ʵ�ӳ�ԭ��</td>
      <td width="32%"> 
        <select name="zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">�ӳٺ�ʵ���</td>
      <td colspan="3"> 
        <textarea name="ychsqk" cols="71" rows="5"></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">��֧��ΥԼ��</td>
      <td><input type="radio" name="sfxwyj" value="Y">
        ��Ҫ
      <input type="radio" name="sfxwyj" value="N">
      ����Ҫ</td>
      <td bgcolor="#E8E8FF" align="right">ΥԼ��</td>
      <td><input type="text" name="wyj" size="20" maxlength="10" value="" ></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">�������</td>
      <td colspan="3"><textarea name="jjfa" cols="71" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button"  value="�� ��" onClick="f_do(selectform)">
          <input type="reset" name="Reset" value="����">
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
        </div>      </td>
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
	if(	javaTrim(FormName.ychssj)=="") {
		alert("������[�ӳٺ�ʵʱ��]��");
		FormName.ychssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ychssj, "�ӳٺ�ʵʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ychsr)=="") {
		alert("������[�ӳٺ�ʵ��]��");
		FormName.ychsr.focus();
		return false;
	}

	if(	javaTrim(FormName.ycclzt)=="") {
		alert("������[�ӳ�ԭ���Ƿ���ʵ]��");
		FormName.ycclzt.focus();
		return false;
	}
	if(	javaTrim(FormName.zsycyybm)=="") {
		alert("������[��ʵ�ӳ�ԭ��]��");
		FormName.zsycyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.ychsqk)=="") {
		alert("������[�ӳٺ�ʵ���]��");
		FormName.ychsqk.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfxwyj)) {
		alert("��ѡ��[��֧��ΥԼ��]��");
		FormName.sfxwyj[0].focus();
		return false;
	}
	if (FormName.sfxwyj[0].checked)
	{
		if(	javaTrim(FormName.wyj)=="") {
			alert("������[ΥԼ��]��");
			FormName.wyj.focus();
			return false;
		}
		if(!(isFloat(FormName.wyj, "ΥԼ��"))) {
			return false;
		}
		if(	javaTrim(FormName.jjfa)=="") {
			alert("������[�������]��");
			FormName.jjfa.focus();
			return false;
		}
	}
	else{
		FormName.wyj.value="";
		FormName.jjfa.value="";
	}


	FormName.action="SaveHsJc_jjdd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
