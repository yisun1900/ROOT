<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>批量照片审核</title>
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
<CENTER><B>检查记录号<%=xjjlh%></B><BR><HR>
</CENTER>

<form method="post" action="" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">客户姓名</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">合同号</td>
    <td width="32%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">房屋地址</td>
    <td><%=fwdz%></td>
    <td align="right">设计师 </td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 项目总监 </td>
    <td><%=sgd%> </td>
    <td align="right"> 品管 </td>
    <td><%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 检查类型 </td>
    <td><%=xjlxbm%> </td>
    <td align="right"> 检查结果 </td>
    <td><%=xjjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 检查人 </td>
    <td><%=xjr%> </td>
    <td align="right"> 检查时间 </td>
    <td><%=xjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>


      <tr bgcolor="#FFFFFF">
	<td height="36" colspan="4" align="center" > 
		<input type="hidden" name="xjjlh" value="<%=xjjlh%>">
		<input type=button value='存盘' onClick="f_xg(editform)">	</td>
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
	ls_sql+=" and (kp_xjgdjlzp.zpshbz='N' or kp_xjgdjlzp.zpshbz='C' or kp_xjgdjlzp.zpshbz is null) ";//Y：合格；B：不合格；C：不合格重拍；N：未审核
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
					<BR>文件名称：<%=xjzpmc%>
					<BR>对应项目：<%=zpgjz%>
					<BR>照片说明：<%=zpsm%>	

					<BR><U>客户可看照片</U>：
					<%
						cf.radioToken(out, "kkzpbz"+js,"0+不可看&1+可看",kkzpbz);
					%>
					<BR><U>照片是否合格</U>：
					<%
						cf.radioToken(out, "zpshbz"+js,"Y+合格&B+不合格",zpshbz);
					%>
					<BR><U>照片审核说明</U>：
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
						<BR>文件名称：<%=xjzpmc%>
						<BR>对应项目：<%=zpgjz%>
						<BR>照片说明：<%=zpsm%>	

						<BR><U>客户可看照片</U>：
						<%
							cf.radioToken(out, "kkzpbz"+js,"0+不可看&1+可看",kkzpbz);
						%>
						<BR><U>照片是否合格</U>：
						<%
							cf.radioToken(out, "zpshbz"+js,"Y+合格&B+不合格",zpshbz);
						%>
						<BR><U>照片审核说明</U>：
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
						<BR>文件名称：<%=xjzpmc%>
						<BR>对应项目：<%=zpgjz%>
						<BR>照片说明：<%=zpsm%>	

						<BR><U>客户可看照片</U>：
						<%
							cf.radioToken(out, "kkzpbz"+js,"0+不可看&1+可看",kkzpbz);
						%>
						<BR><U>照片是否合格</U>：
						<%
							cf.radioToken(out, "zpshbz"+js,"Y+合格&B+不合格",zpshbz);
						%>
						<BR><U>照片审核说明</U>：
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
						<BR>文件名称：<%=xjzpmc%>
						<BR>对应项目：<%=zpgjz%>
						<BR>照片说明：<%=zpsm%>	

						<BR><U>客户可看照片</U>：
						<%
							cf.radioToken(out, "kkzpbz"+js,"0+不可看&1+可看",kkzpbz);
						%>
						<BR><U>照片是否合格</U>：
						<%
							cf.radioToken(out, "zpshbz"+js,"Y+合格&B+不合格",zpshbz);
						%>
						<BR><U>照片审核说明</U>：
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


	ls_sql="SELECT xjzpmc,zpgjz,lx,zpsm,zpml,DECODE(kkzpbz,'0','不可看','1','可看') kkzpbz,DECODE(zpshbz,'Y','合格','B','不合格','C','不合格重拍','N','未审核') zpshbz,shsm";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" and (kp_xjgdjlzp.zpshbz='Y' or kp_xjgdjlzp.zpshbz='B'  ) ";//Y：合格；B：不合格；C：不合格重拍；N：未审核
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
					<BR>文件名称：<%=xjzpmc%>
					<BR>对应项目：<%=zpgjz%>
					<BR>照片说明：<%=zpsm%>	

					<BR>客户可看照片：<%=kkzpbz%>
					<BR>照片是否合格：<%=zpshbz%>
					<BR>照片审核说明：<%=shsm%>
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
						<BR>文件名称：<%=xjzpmc%>
						<BR>对应项目：<%=zpgjz%>
						<BR>照片说明：<%=zpsm%>	

						<BR>客户可看照片：<%=kkzpbz%>
						<BR>照片是否合格：<%=zpshbz%>
					    <BR>照片审核说明：<%=shsm%>
					  </td>
					<%
				}
				else if (js%lines==0)
				{
					%>
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>文件名称：<%=xjzpmc%>
						<BR>对应项目：<%=zpgjz%>
						<BR>照片说明：<%=zpsm%>	

						<BR>客户可看照片：<%=kkzpbz%>
						<BR>照片是否合格：<%=zpshbz%>
					    <BR>照片审核说明：<%=shsm%>
					  </td>
					</tr>
					<%
				}
				else
				{
					%>
					  <td width="50%"> 
						<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="470"></A>
						<BR>文件名称：<%=xjzpmc%>
						<BR>对应项目：<%=zpgjz%>
						<BR>照片说明：<%=zpsm%>	

						<BR>客户可看照片：<%=kkzpbz%>
						<BR>照片是否合格：<%=zpshbz%>
					    <BR>照片审核说明：<%=shsm%>
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
  out.print("上载照片失败，Exception:" + e);
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
				alert("请选择[客户可看照片]！");
				eval("FormName.kkzpbz"+i+"[0].focus()");
				return false;
			}

			if(	!eval("radioChecked(FormName.zpshbz"+i+")") ) {
				alert("请选择[是否合格]！");
				eval("FormName.zpshbz"+i+"[0].focus()");
				return false;
			}
			if (eval("FormName.zpshbz"+i+"[1].checked"))
			{
				if(	eval("javaTrim(FormName.shsm"+i+")" )=="") {
					alert("不合格请输入[审核说明]！");
					eval("FormName.shsm.focus()");
					return false;
				}

				if (eval("FormName.kkzpbz"+i+"[1].checked"))
				{
					alert("错误！照片不合格客户不能看！");
					eval("FormName.kkzpbz"+i+"[0].focus()");
					return false;
				}
			}

		}
	}
	else{
		if(	!radioChecked(FormName.kkzpbz1)) {
			alert("请选择[客户可看照片]！");
			FormName.kkzpbz1[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zpshbz1)) {
			alert("请选择[是否合格]！");
			FormName.zpshbz1[0].focus();
			return false;
		}
		if (FormName.zpshbz1[1].checked)
		{
			if(	javaTrim(FormName.shsm1)=="") {
				alert("不合格请输入[审核说明]！");
				FormName.shsm1.focus();
				return false;
			}

			if (FormName.kkzpbz1[1].checked)
			{
				alert("错误！照片不合格客户不能看！");
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