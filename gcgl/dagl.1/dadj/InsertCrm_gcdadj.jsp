<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String khbh=request.getParameter("khbh");	
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><b>���̵����Ǽ�(�ͻ���ţ�<%=khbh%>)</b></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFFF">
	  <td width="16%"><strong>��������</strong></td>
	  <td width="6%"><strong><span class="STYLE2">*</span>����</strong></td>
	  <td width="17%"><strong><span class="STYLE2">*</span>���ܲ���</strong></td>
	  <td width="9%"><strong><span class="STYLE2">*</span>������</strong></td>
	  <td width="10%"><strong><span class="STYLE2">*</span>����ʱ��</strong></td>
	  <td width="42%"><strong>��ע</strong></td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String damxbm=null;
String damxmc=null;
String ls_sql=null;
String ssfgs=null;
int i=0;
try {

	conn=cf.getConnection();

	ls_sql="select fgsbh from crm_khxx where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs= ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	ls_sql="select damxbm,damxmc";
	ls_sql+=" from dm_damxbm ";
	ls_sql+=" where damxbm not in(select damxbm from crm_gcdagl where khbh='"+khbh+"') ";
	ls_sql+=" order by damxbm ";
	ps= conn.prepareStatement(ls_sql);
	rs= ps.executeQuery();
	while (rs.next())
	{
		i++;
		damxbm=rs.getString("damxbm");
		damxmc=rs.getString("damxmc");
					

			%>
			<tr align="center" bgcolor="#FFFFFF"> 
			  <td >
				<%=damxmc%>
				<input type="hidden" name="damxbm" value="<%=damxbm%>">
			  </td>
				
			  <td>
				  <input type="text" name="sl" value="" size="5" maxlength="8" >
			  </td>
			
			  <td>
				<select name="bgrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <option value=""></option>
				  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwlx,dwbh",dwbh);
	%>
				</select>
			  </td>

			  <td>
				  <input name="bgr" type="text"  value="<%=yhmc%>" size="8" maxlength="20" >
			  </td>
			  <td>
				  <input type="text" name="bgsj" size="10" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
			  </td>
			  <td>
				  <input name="bz" type="text" value="" size="54" maxlength="200">
			  </td>
			</tr>
			<%
		
	}
	rs.close();
	ps.close();
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
	%>
             <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right"> 
                <span class="STYLE1"><span class="STYLE2">*</span>¼��ʱ��</span>              
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="10" maxlength="10" readonly></td>
              <td colspan="2" bgcolor="#FFFFFF"><span class="STYLE1"><span class="STYLE2">*</span>¼����</span>               
               <input type="text" name="lrr" value="<%=yhmc%>" size="10" maxlength="20" readonly>              </td>
            </tr>
           <tr align="center"> 
				<td colspan="6"> 
				  <input type="hidden" name="bgrfgs" value="<%=ssfgs%>" >
				  <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)" name="save">
                <input type="reset"  value="����" name="reset">  
          </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if (<%=i%>==1)
	{
		if(	javaTrim(FormName.sl)!="") 
		{
			if((!isNumber(FormName.sl, "����"))) 
			{
				return false;
			}

			if(	javaTrim(FormName.bgrdw)=="") {
				alert("������[���ܲ���]��");
				FormName.bgrdw.focus();
				return false;
			}
			if(	javaTrim(FormName.bgr)=="") {
				alert("������[����������]��");
				FormName.bgr.focus();
				return false;
			}


			if(!(isDatetime(FormName.bgsj, "��ʼ����ʱ��"))) {
				return false;
			}
			if(	javaTrim(FormName.bgsj)=="") {
				alert("������[��ʼ����ʱ��]��");
				FormName.bgsj.focus();
				return false;
			}
		}
	}
	else if (<%=i%> > 1)
	{
		for (var j=0;j< <%=i%> ;j++ )
		{
			if(	javaTrim(FormName.sl[j])!="") 
			{
				if((!isNumber(FormName.sl[j], "����"))) 
				{
					return false;
				}

				if(	javaTrim(FormName.bgrdw[j])=="") {
					alert("������[���ܲ���]��");
					FormName.bgrdw[j].focus();
					return false;
				}
				if(	javaTrim(FormName.bgr[j])=="") {
					alert("������[����������]��");
					FormName.bgr[j].focus();
					return false;
				}


				if(!(isDatetime(FormName.bgsj[j], "��ʼ����ʱ��"))) {
					return false;
				}
				if(	javaTrim(FormName.bgsj[j])=="") {
					alert("������[��ʼ����ʱ��]��");
					FormName.bgsj[j].focus();
					return false;
				}
			}
		}
	}
	

	
	FormName.action="SaveInsertCrm_gcdadj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
