<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String ddbh=request.getParameter("ddbh");
String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String dqbm=null;
String fgsbh=null;
String htqrr=null;
String htqrsj=null;
String htqrbz=null;
double htze=0;
double wdzje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double yfkze=0;
double jjfk=0;
int yfksl=0;
String mark="";

double jjzkl=0;
String dzyy=null;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,htqrr,htqrsj,htqrbz,htze,wdzje,fgsbh,jjzkl,dzyy";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		htze=rs.getDouble("htze");
		wdzje=rs.getDouble("wdzje");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

	ls_sql="select hth,khxm,fwdz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//�Ҿ�Ԥ����
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='24'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if ( jjfk < (htze-11))
	{
		if ( yfkze < (htze-11-jjfk))
		{
			mark="1";//Ԥ����㣬�˳�
			out.println("<strong><font color=\"#FF0000\">���ѣ�����㣬����ȷ�ϣ�</font></strong>");
			out.println("<BR>����ʵ�����"+jjfk+",���üҾ�Ԥ�����"+yfkze);
			out.println("<BR>��������"+cf.formatDouble(htze)+"��Ӧ���������"+cf.formatDouble(htze-jjfk));
			return ;
		}
		else{
			mark="2";//�����,��Ԥ����ת��
		}
	}
%>

<html>
<head>
<title>����ȷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >


        <div align="center">�Ҿ߶�����������ȷ�ϣ�������ţ�<%=ddbh%>��</div>
            
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#000099">�ͻ����</font></td>
              <td width="34%"><%=khbh%></td>
              <td width="17%" align="right"><font color="#000099">��ͬ��</font></td>
              <td width="33%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="34%"><%=khxm%></td>
              <td width="17%" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td width="33%"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#000099"><b>δ���۽��</b></font></td>
              <td width="34%"><%=wdzje%></td>
              <td width="17%" align="right"><font color="#000099"><b>��ͬ�ܶ�</b></font></td>
              <td width="33%"><%=htze%></td>
            </tr>
			<tr bgcolor="#FFFFFF">
			  <td align="right" bgcolor="#FFFFFF"><font color="#000099">�����ۿ�</font></td>
			  <td><%=jjzkl%></td>
			  <td align="right">&nbsp;</td>
			  <td valign="top">&nbsp;</td>
			</tr>
			<tr bgcolor="#FFFFFF">
			  <td align="right" bgcolor="#FFFFFF"><font color="#000099">����ԭ��</font></td>
			  <td colspan="3"><%=dzyy%></td>
			</tr>


  </TABLE>

<%
	  if (mark.equals("2"))
	  {
%>
  
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC" ><strong><font color="#FF0000">���ѣ�����㣬����Ԥ����ת����</font></strong></td>
	</tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2" rowspan="5" align="center" valign="top" >


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="10%">&nbsp;</td>
	<td  width="45%">����Ԥ����</td>
	<td  width="45%">���ý��</td>
  </tr>
  <%
	String fklxbm=null;
	String fklxmc=null;
	double fkje=0;

	ls_sql="SELECT cw_khfkjl.fklxbm,cw_fklxbm.fklxmc,sum(cw_khfkjl.fkje) fkje";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm";
	ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+) ";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ls_sql+=" group by cw_khfkjl.fklxbm,cw_fklxbm.fklxmc";
	ls_sql+=" having sum(cw_khfkjl.fkje)!=0 ";
	ls_sql+=" order by sum(cw_khfkjl.fkje) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fklxbm=rs.getString("fklxbm");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		fkje=rs.getDouble("fkje");

		yfksl++;

		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td>
				<input name="fklxbm" type="checkbox" value="<%=fklxbm%>">			</td>
			<td><%=fklxmc%></td>
			<td align="right"><%=cf.formatDouble(fkje)%>
				<input name="fkje" type="hidden" value="<%=fkje%>">			</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	%> 
</table>	  </td>
      <td width="18%" align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">�������</font></b></td>
      <td width="32%" bgcolor="#FFFFCC"><%=cf.round(htze,2)%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">�����Ѹ���</font></b></td>
      <td bgcolor="#FFFFCC"><%=jjfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">Ӧ��������</font></strong></td>
      <td bgcolor="#FFFFCC"><%=cf.round(htze-jjfk,2)%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">����Ԥ����</font></strong></td>
      <td bgcolor="#FFFFCC"><%=yfkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>Ԥ����ת����</td>
      <td bgcolor="#FFFFCC"><input type="text" name="sfkje" size="20" maxlength="20" value="<%=cf.round(htze-jjfk,2)%>"></td>
    </tr>
  </TABLE>

<%
	}
	else{
		%>
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF">
	  <td width="16%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">�Ҿ�Ԥ����</font></b></td>
	  <td width="34%"><%=yfkze%></td>
	  <td width="17%" align="right"><b><font color="#0000FF">�����Ѹ���</font></b></td>
	  <td width="33%" valign="top"><%=jjfk%>
      <input type="hidden" name="sfkje" value="0"></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">�������</font></b></td>
	  <td><%=cf.round(htze,2)%></td>
	  <td align="right"><font color="#CC0033"><strong>Ƿ��</strong></font></td>
	  <td valign="top"><font color="#CC0033"><strong><%=cf.round(htze-jjfk,2)%></strong></font></td>
	</tr>
  </TABLE>
		<%
	}
		
%>

	<BR>	 

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			
			
			<tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>����ȷ����</td>
              <td width="34%"> 
                <input type="text" name="htqrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>����ȷ��ʱ��</td>
              <td width="33%"> 
                <input type="text" name="htqrsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">����ȷ��˵��</td>
              <td colspan="3"> 
                <textarea name="htqrbz" cols="71" rows="3"><%=htqrbz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button"  value="�鿴�տ����" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button">
                </div>              </td>
            </tr>
  </table>

</form>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
<%
if (mark.equals("2"))
{
	%>

	if(	javaTrim(FormName.sfkje)=="") {
		alert("����㣬����Ԥ����ת����������[Ԥ����ת����]��");
		FormName.sfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkje, "Ԥ����ת����"))) {
		return false;
	}
	if (parseFloat(FormName.sfkje.value)< <%=(htze-jjfk-11)%> || parseFloat(FormName.sfkje.value)> <%=(htze-jjfk+11)%>)
	{
		alert("[Ԥ����ת����]����С��[<%=cf.round(htze-jjfk-11,2)%>]�������[<%=cf.round(htze-jjfk+11,2)%>]��");
		FormName.sfkje.select();
		return false;
	}

	
	
	var choo=0;
	var zkje=0;

	if (<%=yfksl%>==1)
	{
		if( FormName.fklxbm.checked )
		{
			choo=1;
			zkje=zkje+parseFloat(FormName.fkje.value);
		}
	} 
	else
	{ 
		for (var i=0;i <<%=yfksl%>;i++ )
		{
			if( FormName.fklxbm[i].checked )
			{
				choo=1;
				zkje=zkje+parseFloat(FormName.fkje[i].value);
			}
		} 
	} 

	if (choo == 0){
		alert("����㣬��Ԥ����ת�����������ѡ��ת������");
		return false;
	}

	if (zkje < parseFloat(FormName.sfkje.value) ){
		alert("ת��㣬ת��ϼƣ�"+zkje+"����ת�"+parseFloat(FormName.sfkje.value));
		return false;
	}

	<%
}
%>

	if(	javaTrim(FormName.htqrr)=="") {
		alert("������[����ȷ����]��");
		FormName.htqrr.focus();
		return false;
	}
	if(	javaTrim(FormName.htqrsj)=="") {
		alert("������[����ȷ��ʱ��]��");
		FormName.htqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htqrsj, "����ȷ��ʱ��"))) {
		return false;
	}

	FormName.action="SaveQrJc_jjdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
