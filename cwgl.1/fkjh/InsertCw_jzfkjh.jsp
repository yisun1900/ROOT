<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
</head>


<%
String fgsbh=null;
String dwbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String sfzhm=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
String sgbz=null;

String hth=null;
String smhtbh=null;

String ywy=null;

String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,khxm,xb,fwdz,crm_khxx.lxfs,crm_khxx.qtdh,crm_khxx.email,crm_khxx.sfzhm,sjs,zjxm,sgdmc,crm_khxx.sgbz ";
	ls_sql+=" ,hth,smhtbh,ywy ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		ywy=cf.fillNull(rs.getString("ywy"));
	}
	rs.close();
	ps.close();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform" action="">
<input type="hidden" name="khbh" value="<%=khbh%>" >
<center>
    <span class="STYLE2">��װ����ƻ����ͻ���ţ�<%=khbh%>��</span>
  </center>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="34%"><%=khxm%>      </td>
      <td width="19%" align="right"><font color="#0000FF">�Ա�      </font></td>
      <td width="31%">
<%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ֻ�</font></td>
      <td colspan="3"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�����绰</font></td>
      <td colspan="3"> <%=qtdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�����ʼ�</font></td>
      <td width="34%"> <%=email%></td>
      <td width="19%" align="right"><font color="#0000FF">ҵ�����֤����</font></td>
      <td width="31%"><%=sfzhm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">���ʦ</font></td>
      <td width="34%"> <%=sjs%></td>
      <td width="19%" align="right"><font color="#0000FF">�ʼ�</font></td>
      <td width="31%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">ʩ����</font></td>
      <td width="34%"> <%=sgdmc%></td>
      <td width="19%" align="right"><font color="#0000FF">�೤</font></td>
      <td width="31%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">��ͬ��</font></td>
      <td width="34%"><%=hth%></td>
      <td width="19%" align="right"><font color="#0000FF">�����ͬ���</font></td>
      <td width="31%"><%=smhtbh%></td>
    </tr>
  </TABLE>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
    
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="15%"><font color="#0000FF"><b>��������</b></font></td>
	<td  width="12%" ><b><font color="#0000FF">Ӧ�������</font></b></td>
	<td  width="18%" ><b><font color="#0000FF">Ӧ����ʱ��<BR>�����ʽ��YYYY-MM-DD</font></b></td>
	<td  width="18%"><font color="#0000FF"><b>Ӧ������</b></font></td>
	<td  width="49%"><font color="#0000FF"><b>��ע</b></font></td>
    </tr>

<%

	
	int fkcs=0;
	String fkcsmc=null;
	double bqfkbl=0;

	ls_sql="SELECT cw_fkfamx.fkcs,cw_fkcs.fkcsmc,cw_fkfamx.bqfkbl";
	ls_sql+=" FROM cw_khfkfa,cw_fkfamx,cw_fkcs";
    ls_sql+=" where cw_khfkfa.fkfabm=cw_fkfamx.fkfabm and cw_fkfamx.fkcs=cw_fkcs.fkcs and cw_khfkfa.khbh='"+khbh+"' and cw_fkfamx.fkcs not in(8)";
    ls_sql+=" order by cw_fkfamx.fkcs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkcs=rs.getInt("fkcs");
		fkcsmc=rs.getString("fkcsmc");
		bqfkbl=rs.getDouble("bqfkbl");


		String yfksj="";
		String yfkje="";
		String bz="";
		ls_sql="SELECT yfksj,yfkje,bz";
		ls_sql+=" FROM cw_jzfkjh";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and fkcs="+fkcs;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yfksj=cf.fillNull(rs1.getDate("yfksj"));
			yfkje=cf.fillNull(rs1.getString("yfkje"));
			bz=cf.fillNull(rs1.getString("bz"));
		}
		rs1.close();
		ps1.close();


		%> 



		<tr align="center"> 
		<td><%=fkcsmc%>
			<input type="hidden" name="fkcs" value="<%=fkcs%>">	
		</td>
		<td ><%=bqfkbl%>%
			<input type="hidden" name="yfkbl" value="<%=bqfkbl%>">
		</td>
		<td >
			<input type="text" name="yfksj" size="10" maxlength="10" value='<%=yfksj%>' style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)">
		</td>
		<td>
			<input type="text" name="yfkje" size="18" maxlength="14" value="<%=yfkje%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		</td>
		<td>
			<input type="text" name="bz" size="45" maxlength="200" value="<%=bz%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >	
		</td>
		</tr>

		<%
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
    <tr bgcolor="#FFFFFF"> 
      <td height="34" colspan="5" align="center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=button value='����' onClick="cf_submit(listform)" name="sl"></td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	formName.action="SaveInsertCw_jzfkjh.jsp";
	formName.submit();
	return true;
} 
//-->
</script>

