<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>������Ƭ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String xjjlh=request.getParameter("xjjlh");

String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgmc=null;
String bz=null;

String khbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String sgd=null;
String zjxm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int lines=2;

int s1=1;
int e1=20000;

int js=0;
int count=0;
try 
{
	conn=cf.getConnection();

	ls_sql="select khbh,dm_xjjgbm.xjjgmc,kp_xjgdjl.xjr,kp_xjgdjl.xjsj ,xjlxmc,kp_xjgdjl.bz";
	ls_sql+=" from  kp_xjgdjl,dm_xjjgbm,kp_xjlxbm";
	ls_sql+=" where kp_xjgdjl.xjjlh='"+xjjlh+"'";
	ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
	ls_sql+=" and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		xjjgmc=cf.fillNull(rs.getString("xjjgmc"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxmc"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.zjxm ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	int sl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();


%>
<body bgcolor="#FFFFFF">
<CENTER><B>����¼��<%=xjjlh%></B><BR><HR>
</CENTER>

<form method="post" action="" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">�ͻ�����</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">��ͬ��</td>
    <td width="32%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ݵ�ַ</td>
    <td><%=fwdz%></td>
    <td align="right">���ʦ </td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ��Ŀ�ܼ� </td>
    <td><%=sgd%> </td>
    <td align="right"> Ʒ�� </td>
    <td><%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ������� </td>
    <td><%=xjlxbm%> </td>
    <td align="right"> ����� </td>
    <td><%=xjjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ����� </td>
    <td><%=xjr%> </td>
    <td align="right"> ���ʱ�� </td>
    <td><%=xjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>


      <tr bgcolor="#FFFFFF">
	<td height="36" colspan="4" align="center" > 
		<input type="hidden" name="xjjlh" value="<%=xjjlh%>">
		<input type=button value='����' onClick="f_xg(editform)">	</td>
	</tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<%

	String xjzpmc=null;
	String zpgjz=null;
	String lx=null;
	String zpsm=null;
	String zpml=null;
	String kkzpbz=null;
	String zpshbz=null;
	String shsm=null;

	ls_sql="SELECT xjzpmc,zpgjz,lx,zpsm,zpml,kkzpbz,zpshbz,shsm";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" and (kp_xjgdjlzp.zpshbz='N' or kp_xjgdjlzp.zpshbz='C' or kp_xjgdjlzp.zpshbz is null) ";//Y���ϸ�B�����ϸ�C�����ϸ����ģ�N��δ���
	ls_sql+=" order by xjzpmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xjzpmc=rs.getString(1);
		zpgjz=cf.fillNull(rs.getString(2));
		lx=cf.fillNull(rs.getString("lx"));
		zpsm=cf.fillNull(rs.getString("zpsm"));
		zpml=cf.fillNull(rs.getString("zpml"));
		kkzpbz=cf.fillNull(rs.getString("kkzpbz"));
		zpshbz=cf.fillNull(rs.getString("zpshbz"));
		shsm=cf.fillNull(rs.getString("shsm"));

		if (zpshbz.equals("") || zpshbz.equals("N") || zpshbz.equals("C"))
		{
			zpshbz="Y";
		}

		if (kkzpbz.equals(""))
		{
			kkzpbz="0";
		}

		js++;
		count++;

		if (js>=s1 && js<=e1)
		{
			if (lines==1)
			{
				%>
				<tr bgcolor="#FFFFFF" valign="top"> 
				  <td width="50%"> 
					<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
					<BR>�ļ����ƣ�<%=xjzpmc%>
					<BR>��Ӧ��Ŀ��<%=zpgjz%>
					<BR>��Ƭ˵����<%=zpsm%>	

					<BR><U>�ͻ��ɿ���Ƭ</U>��
					<%
						cf.radioToken(out, "kkzpbz"+js,"0+���ɿ�&1+�ɿ�",kkzpbz);
					%>
					<BR><U>��Ƭ�Ƿ�ϸ�</U>��
					<%
						cf.radioToken(out, "zpshbz"+js,"Y+�ϸ�&B+���ϸ�",zpshbz);
					%>
					<BR><U>��Ƭ���˵��</U>��
					<input type="hidden" name="xjzpmc" value="<%=xjzpmc%>">
					<input type="hidden" name="zpxh" value="<%=js%>">
					<textarea name="shsm<%=js%>" cols="50" rows="3"><%=shsm%></textarea>
				  </td>
				</tr>
				<%
			}
			else{
				if (js%lines==1)
				{
					%>
					<tr bgcolor="#FFFFFF" valign="top"> 
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=xjzpmc%>
						<BR>��Ӧ��Ŀ��<%=zpgjz%>
						<BR>��Ƭ˵����<%=zpsm%>	

						<BR><U>�ͻ��ɿ���Ƭ</U>��
						<%
							cf.radioToken(out, "kkzpbz"+js,"0+���ɿ�&1+�ɿ�",kkzpbz);
						%>
						<BR><U>��Ƭ�Ƿ�ϸ�</U>��
						<%
							cf.radioToken(out, "zpshbz"+js,"Y+�ϸ�&B+���ϸ�",zpshbz);
						%>
						<BR><U>��Ƭ���˵��</U>��
						<input type="hidden" name="xjzpmc" value="<%=xjzpmc%>">
						<input type="hidden" name="zpxh" value="<%=js%>">
						<textarea name="shsm<%=js%>" cols="50" rows="3"><%=shsm%></textarea>
					  </td>
					<%
				}
				else if (js%lines==0)
				{
					%>
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=xjzpmc%>
						<BR>��Ӧ��Ŀ��<%=zpgjz%>
						<BR>��Ƭ˵����<%=zpsm%>	

						<BR><U>�ͻ��ɿ���Ƭ</U>��
						<%
							cf.radioToken(out, "kkzpbz"+js,"0+���ɿ�&1+�ɿ�",kkzpbz);
						%>
						<BR><U>��Ƭ�Ƿ�ϸ�</U>��
						<%
							cf.radioToken(out, "zpshbz"+js,"Y+�ϸ�&B+���ϸ�",zpshbz);
						%>
						<BR><U>��Ƭ���˵��</U>��
						<input type="hidden" name="xjzpmc" value="<%=xjzpmc%>">
						<input type="hidden" name="zpxh" value="<%=js%>">
						<textarea name="shsm<%=js%>" cols="50" rows="3"><%=shsm%></textarea>
					  </td>
					</tr>
					<%
				}
				else
				{
					%>
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=xjzpmc%>
						<BR>��Ӧ��Ŀ��<%=zpgjz%>
						<BR>��Ƭ˵����<%=zpsm%>	

						<BR><U>�ͻ��ɿ���Ƭ</U>��
						<%
							cf.radioToken(out, "kkzpbz"+js,"0+���ɿ�&1+�ɿ�",kkzpbz);
						%>
						<BR><U>��Ƭ�Ƿ�ϸ�</U>��
						<%
							cf.radioToken(out, "zpshbz"+js,"Y+�ϸ�&B+���ϸ�",zpshbz);
						%>
						<BR><U>��Ƭ���˵��</U>��
						<input type="hidden" name="xjzpmc" value="<%=xjzpmc%>">
						<input type="hidden" name="zpxh" value="<%=js%>">
						<textarea name="shsm<%=js%>" cols="50" rows="3"><%=shsm%></textarea>
					  </td>
					<%
				}
			}
		}

	}
	rs.close();
	ps.close();


	ls_sql="SELECT xjzpmc,zpgjz,lx,zpsm,zpml,DECODE(kkzpbz,'0','���ɿ�','1','�ɿ�') kkzpbz,DECODE(zpshbz,'Y','�ϸ�','B','���ϸ�','C','���ϸ�����','N','δ���') zpshbz,shsm";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" and (kp_xjgdjlzp.zpshbz='Y' or kp_xjgdjlzp.zpshbz='B'  ) ";//Y���ϸ�B�����ϸ�C�����ϸ����ģ�N��δ���
	ls_sql+=" order by xjzpmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xjzpmc=rs.getString(1);
		zpgjz=cf.fillNull(rs.getString(2));
		lx=cf.fillNull(rs.getString("lx"));
		zpsm=cf.fillNull(rs.getString("zpsm"));
		zpml=cf.fillNull(rs.getString("zpml"));
		kkzpbz=cf.fillNull(rs.getString("kkzpbz"));
		zpshbz=cf.fillNull(rs.getString("zpshbz"));
		shsm=cf.fillNull(rs.getString("shsm"));



		js++;

		if (js>=s1 && js<=e1)
		{
			if (lines==1)
			{
				%>
				<tr bgcolor="#FFFFFF" valign="top"> 
				  <td width="50%"> 
					<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
					<BR>�ļ����ƣ�<%=xjzpmc%>
					<BR>��Ӧ��Ŀ��<%=zpgjz%>
					<BR>��Ƭ˵����<%=zpsm%>	

					<BR>�ͻ��ɿ���Ƭ��<%=kkzpbz%>
					<BR>��Ƭ�Ƿ�ϸ�<%=zpshbz%>
					<BR>��Ƭ���˵����<%=shsm%>
				  </td>
				</tr>
				<%
			}
			else{
				if (js%lines==1)
				{
					%>
					<tr bgcolor="#FFFFFF" valign="top"> 
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=xjzpmc%>
						<BR>��Ӧ��Ŀ��<%=zpgjz%>
						<BR>��Ƭ˵����<%=zpsm%>	

						<BR>�ͻ��ɿ���Ƭ��<%=kkzpbz%>
						<BR>��Ƭ�Ƿ�ϸ�<%=zpshbz%>
					    <BR>��Ƭ���˵����<%=shsm%>
					  </td>
					<%
				}
				else if (js%lines==0)
				{
					%>
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=xjzpmc%>
						<BR>��Ӧ��Ŀ��<%=zpgjz%>
						<BR>��Ƭ˵����<%=zpsm%>	

						<BR>�ͻ��ɿ���Ƭ��<%=kkzpbz%>
						<BR>��Ƭ�Ƿ�ϸ�<%=zpshbz%>
					    <BR>��Ƭ���˵����<%=shsm%>
					  </td>
					</tr>
					<%
				}
				else
				{
					%>
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=xjzpmc%>
						<BR>��Ӧ��Ŀ��<%=zpgjz%>
						<BR>��Ƭ˵����<%=zpsm%>	

						<BR>�ͻ��ɿ���Ƭ��<%=kkzpbz%>
						<BR>��Ƭ�Ƿ�ϸ�<%=zpshbz%>
					    <BR>��Ƭ���˵����<%=shsm%>
					  </td>
					<%
				}
			}
		}

	}
	rs.close();
	ps.close();

	if (lines==1)
	{
	}
	else{
		if (js%lines!=0)
		{
			for (int j=js%lines;j<lines ;j++ )
			{
				%>
				  <td width="50%">&nbsp;</td>
				<%
			}

			%>
			</tr>
			<%
		}
	}
}
catch (Exception e) {
  out.print("������Ƭʧ�ܣ�Exception:" + e);
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
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_xg(FormName)
{
	if (<%=count%>>1)
	{
		for (var i=1;i<= <%=count%> ;i++ )
		{
			if(	! eval("radioChecked(FormName.kkzpbz"+i+")")  ) {
				alert("��ѡ��[�ͻ��ɿ���Ƭ]��");
				eval("FormName.kkzpbz"+i+"[0].focus()");
				return false;
			}

			if(	!eval("radioChecked(FormName.zpshbz"+i+")") ) {
				alert("��ѡ��[�Ƿ�ϸ�]��");
				eval("FormName.zpshbz"+i+"[0].focus()");
				return false;
			}
			if (eval("FormName.zpshbz"+i+"[1].checked"))
			{
				if(	eval("javaTrim(FormName.shsm"+i+")" )=="") {
					alert("���ϸ�������[���˵��]��");
					eval("FormName.shsm.focus()");
					return false;
				}

				if (eval("FormName.kkzpbz"+i+"[1].checked"))
				{
					alert("������Ƭ���ϸ�ͻ����ܿ���");
					eval("FormName.kkzpbz"+i+"[0].focus()");
					return false;
				}
			}

		}
	}
	else{
		if(	!radioChecked(FormName.kkzpbz1)) {
			alert("��ѡ��[�ͻ��ɿ���Ƭ]��");
			FormName.kkzpbz1[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zpshbz1)) {
			alert("��ѡ��[�Ƿ�ϸ�]��");
			FormName.zpshbz1[0].focus();
			return false;
		}
		if (FormName.zpshbz1[1].checked)
		{
			if(	javaTrim(FormName.shsm1)=="") {
				alert("���ϸ�������[���˵��]��");
				FormName.shsm1.focus();
				return false;
			}

			if (FormName.kkzpbz1[1].checked)
			{
				alert("������Ƭ���ϸ�ͻ����ܿ���");
				FormName.kkzpbz1[0].focus();
				return false;
			}
		}
	}


	FormName.action="SaveEditKp_xjgdjlzpAll.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>