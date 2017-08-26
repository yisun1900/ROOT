<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by ssfgs,dwbh");

String gwbh=null;
String gwmc=null;
String gwnr=null;
String gwfj=null;
String fbsj=null;
String fbr=null;
String fbfw=null;
String fbfgs=null;
String fbbm=null;
String lrsj=null;
String bz=null;
String lrr=null;
String bt=null;
String fl=null;
String wheregwbh=request.getParameter("gwbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bt,fl,gwbh,gwmc,gwnr,gwfj,fbsj,fbr,fbbm,lrsj,bz,lrr,fbfw,fbfgs ";
	ls_sql+=" from  qh_gwgl";
	ls_sql+=" where  (gwbh='"+wheregwbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bt=cf.fillNull(rs.getString("bt"));
		fl=cf.fillNull(rs.getString("fl"));
		gwbh=cf.fillNull(rs.getString("gwbh"));
		gwmc=cf.fillNull(rs.getString("gwmc"));
		gwnr=cf.fillNull(rs.getString("gwnr"));
		gwfj=cf.fillNull(rs.getString("gwfj"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		fbr=cf.fillNull(rs.getString("fbr"));
		fbbm=cf.fillNull(rs.getString("fbbm"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		fbfw=cf.fillNull(rs.getString("fbfw"));
		fbfgs=cf.fillNull(rs.getString("fbfgs"));
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�����ֹ�˾</td>
              <td width="35%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",fbfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fbfgs);
        out.println("        </select>");
	}
	%></td>
              <td width="15%" align="right">��������</td>
              <td width="35%"> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fbfgs+"' order by dwbh",fbbm);
		}
		else if (yhjs.equals("F0"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh",fbbm);
		}
		else
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",fbbm);
		}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ı��</div>              </td>
              <td width="35%"> 
                <input type="text" name="gwbh" size="20" maxlength="20"  value="<%=gwbh%>" >              </td>
              <td width="15%"> 
                <div align="right">������Χ</div>              </td>
              <td width="35%"><%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			cf.radioToken(out, "fbfw","1+����˾&2+����",fbfw);
		}
		else{
			cf.radioToken(out, "fbfw","1+����˾",fbfw);
		}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>              </td>
              <td colspan="3"> 
                <input type="text" name="gwmc" size="73" maxlength="100"  value="<%=gwmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">����</div></td>
              <td colspan="3"><input type="text" name="bt" value="<%=bt%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">����</div></td>
              <td colspan="3"><input type="text" name="fl" value="<%=fl%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ʱ��</div>              </td>
              <td width="35%"> 
                <input type="text" name="fbsj" size="20" maxlength="10"  value="<%=fbsj%>" >              </td>
              <td width="15%"> 
                <div align="right">������</div>              </td>
              <td width="35%"> 
                <input type="text" name="fbr" size="20" maxlength="20"  value="<%=fbr%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼����</div>              </td>
              <td width="35%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>              </td>
              <td width="15%"> 
                <div align="right">¼��ʱ��</div>              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">��������</div>              </td>
              <td colspan="3"> 
                <textarea name="gwnr" cols="71" rows="15"><%=gwnr%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
                <div align="right"></div>              </td>
            </tr>
            <input type="hidden" name="wheregwbh"  value="<%=wheregwbh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button" name="sc" value="�ϴ�����" onClick="f_do1(editform)" >
                  <input type="reset"  value="����">
                </div>              </td>
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
	if(	javaTrim(FormName.fbfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.fbfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.fbbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.fbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gwbh)=="") {
		alert("������[���ı��]��");
		FormName.gwbh.focus();
		return false;
	}
<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			%> 
			if(	!radioChecked(FormName.fbfw)) {
				alert("��ѡ��[������Χ]��");
				FormName.fbfw[0].focus();
				return false;
			}
			<%
		}
		else{
			%> 
			if(!FormName.fbfw.checked) {
				alert("������[������Χ]��");
				FormName.fbfw.focus();
				return false;
			}
			<%
		}
%>
	if(	javaTrim(FormName.gwmc)=="") {
		alert("������[��������]��");
		FormName.gwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.bt)=="") {
		alert("������[����]��");
		FormName.bt.focus();
		return false;
	}
	if(	javaTrim(FormName.fl)=="") {
		alert("������[����]��");
		FormName.fl.focus();
		return false;
	}
	if(	javaTrim(FormName.gwnr)=="") {
		alert("������[��������]��");
		FormName.gwnr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("������[����ʱ��]��");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("������[������]��");
		FormName.fbr.focus();
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	FormName.action="SaveEditQh_gwgl.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gwbh)=="") {
		alert("������[���ı��]��");
		FormName.gwbh.focus();
		return false;
	}

	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}
//-->
</SCRIPT>
