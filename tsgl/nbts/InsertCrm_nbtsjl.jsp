<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String slbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwlx,dwbh");
String yhjs=(String)session.getAttribute("yhjs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//Ͷ�߼�¼��
int tsjlh=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(tsjlh)+1,1)";
	ls_sql+=" from  crm_nbtsjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=rs.getInt(1);
	}
	ps.close();
	rs.close();

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼���ڲ�������¼</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_nbtsjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>��������</div>
              </td>
              <td width="35%">
                <input type="text" name="btsr" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right"><font color="#FF0000">*</font>�������ֹ�˾</td>
              <td width="35%">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"btsfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(btsfgs,btsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",ssfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"btsfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(btsfgs,btsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' OR dwlx in('A0')","");
        out.println("        </select>");
	}
%> 
              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>����������</td>
              <td width="35%">
                <select name="btsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N'  order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="tssj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="tsr" value="<%=yhmc%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ֹ�˾</font></div>
              </td>
              <td width="35%"> 
                <select name="slfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></div>
              </td>
              <td width="35%">
                <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��������<font color="#FF0000">*</font></td>
              <td colspan="3"> 
                <textarea name="tsnr" cols="71" rows="7"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="reset"  value="����" name="reset">
              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.btsr)=="") {
		alert("������[��Ͷ����]��");
		FormName.btsr.focus();
		return false;
	}
	if(	javaTrim(FormName.btsfgs)=="") {
		alert("������[��Ͷ�߷ֹ�˾]��");
		FormName.btsfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.btsbm)=="") {
		alert("������[��Ͷ�߲���]��");
		FormName.btsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsnr)=="") {
		alert("������[Ͷ������]��");
		FormName.tsnr.focus();
		return false;
	}
	if(	javaTrim(FormName.tsr)=="") {
		alert("������[Ͷ����]��");
		FormName.tsr.focus();
		return false;
	}
	if(	javaTrim(FormName.tssj)=="") {
		alert("������[Ͷ��ʱ��]��");
		FormName.tssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tssj, "Ͷ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("������[¼����]��");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.slbm.focus();
		return false;
	}
	if(	javaTrim(FormName.slfgs)=="") {
		alert("��ѡ��[¼��ֹ�˾]��");
		FormName.slfgs.focus();
		return false;
	}
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
