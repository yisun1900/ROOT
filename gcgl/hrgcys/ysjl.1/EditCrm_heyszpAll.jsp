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
String ysjlh=request.getParameter("ysjlh");

String khbh=null;
String gcysxmmc=null;
String yssj=null;
String ysr=null;
String sjysjg=null;
String clbz=null;

String khxm=null;
String fwdz=null;
String sjs=null;
String sgdmc=null;
String zjxm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int lines=2;

int s1=1;
int e1=20000;

int js=0;
try 
{
	conn=cf.getConnection();

	ls_sql="SELECT khbh,gcysxmmc,yssj,ysr,DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','���ϸ�') sjysjg,DECODE(crm_heysjl.clbz,'9','¼��δ���','0','û����','1','����δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') clbz";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		gcysxmmc=rs.getString("gcysxmmc");
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT khxm,fwdz,sjs,sgdmc,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	int sl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
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
<CENTER><B>���ռ�¼�ţ�<%=ysjlh%></B><BR><HR>
</CENTER>

<form method="post" action="" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	    
	    <tr bgcolor="#FFFFFF">
          <td width="18%" align="right"> �ͻ���� </td>
	      <td width="32%"><%=khbh%> </td>
	      <td width="18%" align="right"> �ͻ����� </td>
	      <td width="32%"><%=khxm%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ���ݵ�ַ </td>
	      <td><%=fwdz%> </td>
	      <td align="right"> ���ʦ </td>
	      <td><%=sjs%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ��Ŀ�ܼ� </td>
	      <td><%=sgdmc%> </td>
	      <td align="right"> Ʒ�� </td>
	      <td><%=zjxm%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right">���ռ�¼��</td>
	      <td><%=ysjlh%></td>
	      <td align="right">������Ŀ����</td>
	      <td><%=gcysxmmc%></td>
      </tr>
	    
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ��Ŀ����ʱ�� </td>
	      <td><%=yssj%> </td>
	      <td align="right"> ��Ŀ������ </td>
	      <td><%=ysr%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ��Ŀ���ս�� </td>
	      <td><%=sjysjg%>          </td>
	      <td align="right"> ���Ĵ���״̬ </td>
	      <td><%=clbz%>          </td>
      </tr>


      <tr bgcolor="#FFFFFF">
	<td height="36" colspan="4" align="center" > 
		<input type="hidden" name="ysjlh" value="<%=ysjlh%>">
		<input type=button value='����' onClick="f_xg(editform)">	</td>
	</tr>

</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<%

	String yszpmc=null;
	String zpxm=null;
	String zplx=null;
	String zpsm=null;
	String zpml=null;
	String kkzpbz=null;
	String zpshbz=null;
	String shsm=null;

	ls_sql="SELECT yszpmc,zpxm,zplx,zpsm,zpml,kkzpbz,zpshbz,shsm";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ls_sql+=" and (crm_heyszp.zpshbz='N' or crm_heyszp.zpshbz='C' or crm_heyszp.zpshbz is null) ";//Y���ϸ�B�����ϸ�C�����ϸ����ģ�N��δ���
	ls_sql+=" order by yszpmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);
		zpxm=cf.fillNull(rs.getString(2));
		zplx=cf.fillNull(rs.getString("zplx"));
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

		if (js>=s1 && js<=e1)
		{
			if (lines==1)
			{
				%>
				<tr bgcolor="#FFFFFF" valign="top"> 
				  <td width="50%"> 
					<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="470"></A>
					<BR>�ļ����ƣ�<%=yszpmc%>
					<BR>��Ӧ��Ŀ��<%=zpxm%>
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
					<input type="hidden" name="yszpmc" value="<%=yszpmc%>">
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
						<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=yszpmc%>
						<BR>��Ӧ��Ŀ��<%=zpxm%>
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
						<input type="hidden" name="yszpmc" value="<%=yszpmc%>">
						<input type="hidden" name="zpxh" value="<%=js%>">
						<textarea name="shsm<%=js%>" cols="50" rows="3"><%=shsm%></textarea>
					  </td>
					<%
				}
				else if (js%lines==0)
				{
					%>
					  <td width="50%"> 
						<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=yszpmc%>
						<BR>��Ӧ��Ŀ��<%=zpxm%>
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
						<input type="hidden" name="yszpmc" value="<%=yszpmc%>">
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
						<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="470"></A>
						<BR>�ļ����ƣ�<%=yszpmc%>
						<BR>��Ӧ��Ŀ��<%=zpxm%>
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
						<input type="hidden" name="yszpmc" value="<%=yszpmc%>">
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
	if (<%=js%>>1)
	{
		for (var i=1;i<= <%=js%> ;i++ )
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


	FormName.action="SaveEditCrm_heyszpAll.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>