<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
//�����İ�������ʾ����
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth="";
String sjs=null;
String kgrq="";
String jyjdrq=null;
String jgrq="";
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String dh=null;
String hxbm=null;
String ysshbz="";
String ysshr="";

int row=0;

int count=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		dh=cf.fillHtml(rs.getString("dh"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));
		hth=cf.fillNull(rs.getString("hth"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khzcmxnew";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<form method="post" action="" name="editform">

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><B>�ͻ�������ϸ
      <input type="button" value="����" onclick="window.open('LoadData.jsp?khbh=<%=khbh%>')">
      <input type="button" value="����" onclick="window.open('expZc.jsp?khbh=<%=khbh%>')">
    </B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td   >�ͻ�������<%=khxm%></td>
	<td align="left">���ʦ��<%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" >���̵�ַ��<%=fwdz%></td>
  </tr>
</table>

<table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="130%" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCFF" height="20" align="center"  >
  <td width="6%">�ṹλ��</td>
  <td width="8%">Ʒ��</td>
  <td width="12%">����</td>
  <td width="12%">�ͺ�</td>
  <td width="10%">���</td>
  <td width="6%">����</td>
  <td width="5%">ԭ��</td>
  <td width="5%">����</td>
  <td width="6%">�ɱ���</td>
  <td width="4%">Զ�̷�</td>
  <td width="4%">��������Ŀ</td>
  <td width="4%">������</td>
  <td width="18%">��Ӧ��</td>
</tr>
</tr>

<%

	String bgcolor="";

	//�ײ������������:��Ϊ��
	String jgwzbm=null;
	String lrxh=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String zcbm=null;
	String zcmc=null;
	String ppbm=null;
	String gys=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double cbj=0;
	double sl=0;
	double ycf=0;
	String qtfy=null;
	double qtfyje=0;

	ls_sql="SELECT zcpzwzbm,xh,zcdlbm,zcxlbm,zcbm,zcmc,ppbm,gys,xinghao,gg,zcysbm,jldwbm,zqdj,dpzk,zqdj,dpzk,dj,cbj,sl,ycf, qtfy,qtfyje";
	if (count>0)
	{
		ls_sql+=" FROM bj_khzcmxnew";
	}
	else{
		ls_sql+=" FROM bj_khzcmx";
	}
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zcpzwzbm,xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		lrxh=rs.getString("xh");
		zcdlbm=rs.getString("zcdlbm");
		zcxlbm=rs.getString("zcxlbm");

		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));


		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		cbj=rs.getDouble("cbj");
		sl=rs.getDouble("sl");
		ycf=rs.getDouble("ycf");
		qtfy=cf.fillNull(rs.getString("qtfy"));
		qtfyje=rs.getDouble("qtfyje");


		row++;


		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//���ÿ������
		%>
		<tr bgcolor="<%=bgcolor%>" align="center"  >
		  <td><%=jgwzbm%>
		  </td>
		  <td><%=ppbm%></td>
		  <td><%=zcmc%></td>
		  <td><%=xinghao%></td>
		  <td><%=gg%></td>
		  <td>
			<input type="text" name="sl" size="6" maxlength="16"  value="<%=sl%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<%=jldwbm%></td>
		  <td><%=zqdj%>
			<input type="hidden" name="zqdj"  value="<%=zqdj%>" >
			</td>
		  <td>
			<input type="text" name="dj" size="6" maxlength="16"  value="<%=dj%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
		  <td>
			<input type="hidden" name="xh"   value="<%=lrxh%>" > 
			<input type="text" name="cbj" size="6" maxlength="16"  value="<%=cbj%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
		  </td>
		  <td>
			<input type="text" name="ycf" size="6" maxlength="16"  value="<%=ycf%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
		  <td>
			<select name="qtfy" style="FONT-SIZE:12PX;WIDTH:50PX" >
			  <option value=""></option>
			  <%
				cf.selectToken(out,"1+��װ��&2+�ӹ���&3+�����շ�&W+��",qtfy);
			  %>
			</select>			
			</td>
		  <td>
			<input type="text" name="qtfyje" size="6" maxlength="16"  value="<%=qtfyje%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
		  <td><%=gys%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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
<tr> 
	<td colspan="9" align="center"  >
		<input type="hidden" name="count" value="<%=count%>">
		<input type="hidden" name="khbh" value="<%=khbh%>">
		<input type="button" value="����" onClick="f_do(editform)" >
	</td>
	<td colspan="23" >&nbsp;</td>
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
	if (<%=row%>==1)
	{
		if(	javaTrim(FormName.cbj)=="") {
			alert("������[�����]��");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "�����"))) {
			return false;
		}
		if (parseFloat(FormName.cbj.value)<0 )
		{
			alert("[�����]С��0��");
			FormName.cbj.select();
			return false;
		}

		if(	javaTrim(FormName.qtfy)=="") 
		{
			alert("��������ѡ��[��������]��");
			FormName.qtfy.select();
			return false;
		}

		if (FormName.qtfy.value!="W")
		{
			if(	javaTrim(FormName.qtfyje)=="") {
				alert("���ı���["+FormName.zcbm.value+"]������������[�����ѽ��]��");
				FormName.qtfyje.focus();
				return false;
			}
			if(!(isFloat(FormName.qtfyje, "�����ѽ��"))) {
				return false;
			}
			if (FormName.qtfyje.value=="0")
			{
				alert("���ı���["+FormName.zcbm.value+"]������[�����ѽ��]����Ϊ0��");
				FormName.qtfyje.select();
				return false;
			}
		}
		else{
				FormName.qtfyje.value="0";
		}
	
	
	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			if(	javaTrim(FormName.cbj[i])=="") {
				alert("������[�����]��");
				FormName.cbj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.cbj[i], "�����"))) {
				return false;
			}
			if (parseFloat(FormName.cbj[i].value)<0 )
			{
				alert("[�����]С��0��");
				FormName.cbj[i].select();
				return false;
			}

			if(	javaTrim(FormName.qtfy[i])=="") 
			{
				alert("��������ѡ��[��������]��");
				FormName.qtfy[i].focus();
				return false;
			}

			if (FormName.qtfy[i].value!="W")
			{
				if(	javaTrim(FormName.qtfyje[i])=="") {
					alert("������������[�����ѽ��]��");
					FormName.qtfyje[i].focus();
					return false;
				}
				if(!(isFloat(FormName.qtfyje[i], "�����ѽ��"))) {
					return false;
				}
				if (FormName.qtfyje[i].value=="0")
				{
					alert("������[�����ѽ��]����Ϊ0��");
					FormName.qtfyje[i].select();
					return false;
				}
			}
			else{
				FormName.qtfyje[i].value="0";
			}
		}
	}


	FormName.action="SaveAllBj_khzcmxJsd.jsp";
	FormName.submit();
	return true;
}




//-->
</SCRIPT>