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
<%
String kpxh=request.getParameter("kpxh");
String xmstr=cf.getItemData("select distinct kpxmbm,kpxmmc,kpdlbm from kp_gckpxm  order by kpdlbm,kpxmbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%" height="41"> 
      <div align="center"> ��¼�뿼�����ݣ�<font color="#0000CC">������ţ�<%=kpxh%></font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_jcmxb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right" height="2">��������</td>
              <td width="36%" height="2"> 
                <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getKpxm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%> 
                </select>
                <input type="hidden" name="kpxh" value="<%=kpxh%>" size="27" maxlength="8" readonly>
              </td>
              <td rowspan="3" width="18%"> 
                <div align="right"></div>
                <div align="right">��������</div>
              </td>
              <td rowspan="3" width="32%"> 
			  <%
				Connection conn  = null;
				PreparedStatement ps=null;
				ResultSet rs=null;
				String ls_sql=null;
				String kpcfbm=null;
				String kpcfmc=null;
				int row=0;
				try {
					conn=cf.getConnection();

					ls_sql="select kpcfbm,kpcfmc";
					ls_sql+=" from  kp_kpcfbm";
					ls_sql+=" order by kpcfbm ";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery(ls_sql);
					while (rs.next())
					{
						row++;
						kpcfbm=rs.getString("kpcfbm");
						kpcfmc=rs.getString("kpcfmc");
						%> 
						<input type="checkbox" name="kpcfbm" value="<%=kpcfbm%>" disabled='true'><%=kpcfmc%><BR>
						<%
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
						if (rs != null) rs.close(); 
						if (ps!= null) ps.close(); 
						if (conn != null) cf.close(conn); 
					}
					catch (Exception e){
						if (conn != null) cf.close(conn); 
					}
				}
				%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right" height="2">������Ŀ</td>
              <td width="36%" height="2"> 
                <select name="kpxmbm" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getKpjg(insertform)">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" height="2"> 
                <div align="right">�������</div>
              </td>
              <td width="36%" height="2"> 
                <select name="kpjg" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getKpcf(insertform)">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
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

function getKpxm(FormName)
{               
	FormName.kpxmbm.length=0;  
	FormName.kpjg.length=0;  
	for (var i=0;i<<%=row%> ;i++ )
	{
		FormName.kpcfbm[i].disabled=true;  
		FormName.kpcfbm[i].checked=false;  
	}

	if(	javaTrim(FormName.kpdlbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpdlbm="+FormName.kpdlbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpjg(FormName)
{               
	FormName.kpjg.length=0;  
	for (var i=0;i<<%=row%> ;i++ )
	{
		FormName.kpcfbm[i].disabled=true;  
		FormName.kpcfbm[i].checked=false;  
	}

	if(	javaTrim(FormName.kpxmbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpcf(FormName)
{               
	for (var i=0;i<<%=row%> ;i++ )
	{
		FormName.kpcfbm[i].disabled=true;  
		FormName.kpcfbm[i].checked=false;  
	}

	if(	javaTrim(FormName.kpjg)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?row=<%=row%>&kpxmbm="+FormName.kpxmbm.value+"&kpjg="+FormName.kpjg.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kpxh)=="") {
		alert("������[�������]��");
		FormName.kpxh.focus();
		return false;
	}
	if(!(isNumber(FormName.kpxh, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("��ѡ��[������Ŀ]��");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("��ѡ��[�������]��");
		FormName.kpjg.focus();
		return false;
	}

	if (!radioChecked(FormName.kpcfbm)){
		alert("��ѡ��[��������]��");
//		FormName.kpcfbm[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
