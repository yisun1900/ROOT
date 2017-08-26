<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>��������</TITLE>
</HEAD>

<BODY> 

<%
String xh=request.getParameter("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String khlx="";
String ldhm="";
String khbh="";
String lywjml="";
String lywj="";


String	khxm="";
String	xb="";
String	fwdz="";
String	sjs="";
String	zjxm="";
String	sgdmc="";

String	tsjlh="";
String	tsbxsj="";
String	tsnr="";

try {
	conn=cf.getConnection();

	ls_sql="select ldhm,khbh,lywjml,lywj,khlx";
	ls_sql+=" from  call_ldjl";
	ls_sql+=" where xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ldhm=cf.fillNull(rs.getString("ldhm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		lywjml=cf.fillNull(rs.getString("lywjml"));
		lywj=cf.fillNull(rs.getString("lywj"));
		khlx=cf.fillNull(rs.getString("khlx"));
	}
	rs.close();
	ps.close();

	if (khlx.equals("1"))
	{
		ls_sql="select khxm,DECODE(xb,'M','��','W','Ů') xb,fwdz,sjs,zjxm,sgdmc";
		ls_sql+=" FROM crm_zxkhxx,sq_sgd";
		ls_sql+=" where khbh='"+khbh+"' and crm_zxkhxx.sgd=sq_sgd.sgd(+)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			xb=cf.fillNull(rs.getString("xb"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			sjs=cf.fillNull(rs.getString("sjs"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));

			khxm=khxm+"��"+xb+"����δǩ����";
		}
	}
	else if (khlx.equals("2"))
	{
		ls_sql="select khxm,DECODE(xb,'M','��','W','Ů') xb,fwdz,sjs,zjxm,sgdmc";
		ls_sql+=" FROM crm_khxx,sq_sgd";
		ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			xb=cf.fillNull(rs.getString("xb"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			sjs=cf.fillNull(rs.getString("sjs"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			
			khxm=khxm+"��"+xb+"����ǩ����";
		}
		rs.close();
		ps.close();

		ls_sql="select tsjlh,tsbxsj,tsnr";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and clzt in('1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
		ls_sql+=" order by tsjlh desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tsjlh=rs.getString("tsjlh");
			tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
			tsnr=rs.getString("tsnr");
		}
		rs.close();
		ps.close();
	}


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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<div align="center">�������ģ�����ͻ���Ϣ
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  

  <tr>
    <td width="12%" align="center">�������</td>
    <td width="88%"><input name="innum" type="text" size="20" maxlength="20" value="<%=ldhm%>" readonly></td>
  </tr>
  
  <tr>
    <td align="center">�ͻ���Ϣ
      <input name="khbh" type="hidden" size="20" >
    <input name="xh" type="hidden" size="20" ></td>
    <td  ><table width="100%" border="0">
      <tr height="27">
        <td width="37%"><B>����</B>:<U><%=khxm%></U></td>
        <td width="21%" ><B>�ʼ�</B>:<U><%=zjxm%></U></td>
        <td width="21%" ><B>���ʦ</B>:<U><%=sjs%></U></td>
        <td width="21%" ><B>ʩ����</B>:<U><%=sgdmc%></U></td>
      </tr>
      <tr height="27">
        <td colspan="3" ><B>���ݵ�ַ</B>:<U><%=fwdz%></U></td>
        <td ><input name="button2" type="button"  onClick="window.open('ViewCrm_khxx.jsp?khbh=<%=khbh%>')" value=�鿴�ͻ�></td>
      </tr>
      <tr height="27">
        <td >
			<B>��¼��</B>:<U><%=tsjlh%></U></td>
        <td colspan="2" >
			<B>Ͷ�߱���ʱ��</B>:<U><%=tsbxsj%></U></td>
        <td ><input name="button" type="button"  onClick="window.open('/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>')" value=�鿴Ͷ��></td>
      </tr>
      <tr  >
        <td colspan="4"><B>Ͷ�߱�������</B>:
		<BR>&nbsp;&nbsp;&nbsp;&nbsp;<U><%=tsnr%></U></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td align="center">¼���ļ�</td>
    <td height="37"><%=lywj%></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>



