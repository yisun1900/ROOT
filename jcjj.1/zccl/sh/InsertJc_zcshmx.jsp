<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String xh=null;
String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
double sl=0;
double zjhsl=0;
double shsl=0;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
double qtfyje=0;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;
String sxbz=null;
String sxbzmc=null;
String sxhtyy=null;
String sfzp=null;
double zsdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;
int allrow=0;

	String shdbh=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select NVL(max(substr(shdbh,10,2)),0)";
	ls_sql+=" from  jc_zcshmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	shdbh=ddbh+cf.addZero(count+1,2);
%>

<html>
<head>
<title>���޸����Ķ�����ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<form method="post" action="" name="editform" target="_blank">

 <div align="center">�����ͻ���ϸ���ͻ�����ţ�<%=shdbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">�ͻ���</div>      </td>
      <td width="32%"> 
        <input name="shr" type="text" id="shr" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td width="18%"> 
        <div align="right">�ͻ�ʱ��</div>      </td>
      <td width="32%"> 
        <input name="shsj" type="text" id="shsj" onDblClick="JSCalendar(this)" value="<%=cf.today()%>" size="20" maxlength="10">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">�ͻ����</div>      </td>
      <td colspan="3"> 
        <textarea name="shqk" rows="3" cols="72"></textarea>      </td>
    </tr>
</table>



<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="140%" style='FONT-SIZE: 12px'>
<TR bgcolor="#CCCCCC"  align="center"> 
	<td  width="3%" >���ı���</td>
	<td  width="5%" >��������</td>
	<td  width="4%" >�ͺ�</td>
	<td  width="4%" >���</td>
	<td  width="2%">��ɫ</td>
	<td  width="3%" >��װλ��</td>
	<td  width="2%" >������λ</td>
	<td  width="2%" >��������</td>
	<td  width="2%" >���ͻ�����</td>
	<td  width="3%" bgcolor="#CC99FF" >�ͻ�����</td>
	<td  width="2%" >�Ƿ���Ʒ</td>
	<td  width="19%" >��ע</td>
	<td  width="7%" >ϵ��</td>
</tr>


<%
	ls_sql="select xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zjhsl,shsl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,DECODE(sfbhpj,'Y','����','N','������') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','��','N','��') sftjcp";
	ls_sql+=" ,sxbz,DECODE(sxbz,'1','����д','2','��д') sxbzmc,sxhtyy,sfzp,zsdj ";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by sxbz,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zjhsl=rs.getDouble("zjhsl");
		shsl=rs.getDouble("shsl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));

		String slStr="";
		if (sl!=0)
		{
			slStr=sl+"";
		}
		String ycfStr="";
		if (ycf!=0)
		{
			ycfStr=ycf+"";
		}
		String qtfyjeStr="";
		if (qtfyje!=0)
		{
			qtfyjeStr=qtfyje+"";
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<%=zcbm%>
				<input type="hidden" name="xh" value="<%=xh%>">
				<input type="hidden" name="zcbm" value="<%=zcbm%>">			</td>
			<td >
				<%=zcmc%>			</td>
			<td >
				<%=xinghao%>			</td>
			<td >
				<%=gg%>			</td>
			<td><%=zcysbm%></td>
			<td><%=zcpzwzbm%></td>
			<td><%=jldwbm%></td>
			<td><%=zjhsl%></td>
			<td><%=shsl%></td>
			<td >
				<input type="hidden" name="yshsl" value="<%=cf.round(zjhsl-shsl,2)%>" >
				<input type="text" name="shsl" size="7" maxlength="16"  value="<%=cf.round(zjhsl-shsl,2)%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td >
				  <%
					cf.selectToken(out,"Y+��Ʒ&N+��",sfzp,true);
				  %>			</td>
			<td >
				<input name="bz" type="text" value="<%=bz%>" size="67" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td bgcolor="#CC99FF"><%=zclbbm%></td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();


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
<tr> 
	<td colspan="5" align="center" >
		<input type="hidden" name="shdbh" value="<%=shdbh%>">
		<input type="hidden" name="ddbh" value="<%=ddbh%>">
		<input type="button" value="����" onClick="f_do(editform)" >
          <input type="button"  value="��ӡ�ͻ���" onClick="f_dy(editform)" >
	</td>
	<td colspan="23" >&nbsp;</td>
</tr>
</form>
</table>
</DIV>





</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.shr)=="") {
		alert("��ѡ��[�ͻ���]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("��ѡ��[�ͻ�ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "�ͻ�ʱ��"))) {
		return false;
	}

	if (<%=row%>==1)
	{
		f_jsjg(FormName,1);

		if(	javaTrim(FormName.shsl)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[�ͻ�����]��");
			FormName.shsl.focus();
			return false;
		}
		if(!(isFloat(FormName.shsl, "�ͻ�����"))) {
			return false;
		}
		if (parseFloat(FormName.shsl.value)<0)
		{
			alert("���ı���["+FormName.zcbm.value+"]����[�ͻ�����]����<0��");
			FormName.shsl.select();
			return false;
		}

	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			if(	javaTrim(FormName.shsl[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]����������[�ͻ�����]��");
				FormName.shsl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.shsl[i], "�ͻ�����"))) {
				return false;
			}
			if (parseFloat(FormName.shsl[i].value)<0)
			{
				alert("���ı���["+FormName.zcbm[i].value+"]����[�ͻ�����]����<0��");
				FormName.shsl[i].select();
				return false;
			}

			if (parseFloat(FormName.shsl[i].value)>parseFloat(FormName.yshsl[i].value))
			{
				alert("���ı���["+FormName.zcbm[i].value+"]����[�ͻ�����]���ܴ���[��������]��");
				FormName.shsl[i].select();
				return false;
			}

		}
	}


	FormName.action="SaveInsertJc_zcshmx.jsp";
	FormName.submit();
	return true;
}


function f_dy(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="/jcjj/dygl/DyShd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
