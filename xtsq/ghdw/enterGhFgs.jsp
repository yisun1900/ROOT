<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010150")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<html>
<head>
<title>�����ֹ�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String[] dwbh=request.getParameterValues("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String dwmc=null;


try {
	conn=cf.getConnection();
	
%>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �����ֹ�˾</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4" height="31" bgcolor="#CCCCFF"><b>����������</b></td>
            </tr>
            <%
	for (int i=0;i<dwbh.length ;i++ )
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			dwmc=cf.fillNull(rs.getString("dwmc"));

			%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                ��λ���              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <input type="text" name="dwbh" size="20" maxlength="5"  value="<%=dwbh[i]%>" readonly>
              </td>
              <td width="17%" bgcolor="#CCCCFF" align="right">��λ����</td>
              <td width="33%" bgcolor="#CCCCFF"><%=dwmc%> </td>
            </tr>
            <%
		}
		rs.close();
		ps.close();
	}
%> 
            <tr align="center" bgcolor="#FFFFFF"> 
              <td colspan="4" height="34"><b>�������·ֹ�˾</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>�������ֹ�˾</td>
              <td width="31%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh","");
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>���ϼ���λ</td>
              <td width="33%"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('F0')  order by dwlx,ssfgs,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="31%"> 
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="33%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <input type="button"  value="��ʼ�����ֹ�˾" onClick="f_do(editform)">
                </div>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdw)=="") {
		alert("��ѡ��[�ϼ���λ]��");
		FormName.ssdw.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.ssdqbm.focus();
		return false;
	}


	FormName.action="SaveEnterGhFgs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


<%
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








