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

	ls_sql="SELECT khbh,gcysxmmc,yssj,ysr,DECODE(crm_heysjl.sjysjg,'0','合格','1','不合格') sjysjg,DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') clbz";
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
<CENTER><B>验收记录号：<%=ysjlh%></B><BR><HR>
</CENTER>

<form method="post" action="" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	    
	    <tr bgcolor="#FFFFFF">
          <td width="18%" align="right"> 客户编号 </td>
	      <td width="32%"><%=khbh%> </td>
	      <td width="18%" align="right"> 客户姓名 </td>
	      <td width="32%"><%=khxm%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> 房屋地址 </td>
	      <td><%=fwdz%> </td>
	      <td align="right"> 设计师 </td>
	      <td><%=sjs%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> 项目总监 </td>
	      <td><%=sgdmc%> </td>
	      <td align="right"> 品管 </td>
	      <td><%=zjxm%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right">验收记录号</td>
	      <td><%=ysjlh%></td>
	      <td align="right">验收项目名称</td>
	      <td><%=gcysxmmc%></td>
      </tr>
	    
	    <tr bgcolor="#FFFFFF">
          <td align="right"> 项目验收时间 </td>
	      <td><%=yssj%> </td>
	      <td align="right"> 项目验收人 </td>
	      <td><%=ysr%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> 项目验收结果 </td>
	      <td><%=sjysjg%>          </td>
	      <td align="right"> 整改处理状态 </td>
	      <td><%=clbz%>          </td>
      </tr>


      <tr bgcolor="#FFFFFF">
	<td height="36" colspan="4" align="center" > 
		<input type="hidden" name="ysjlh" value="<%=ysjlh%>">
		<input type=button value='存盘' onClick="f_xg(editform)">	</td>
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
	ls_sql+=" and (crm_heyszp.zpshbz='N' or crm_heyszp.zpshbz='C' or crm_heyszp.zpshbz is null) ";//Y：合格；B：不合格；C：不合格重拍；N：未审核
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
					<BR>文件名称：<%=yszpmc%>
					<BR>对应项目：<%=zpxm%>
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
						<BR>文件名称：<%=yszpmc%>
						<BR>对应项目：<%=zpxm%>
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
						<BR>文件名称：<%=yszpmc%>
						<BR>对应项目：<%=zpxm%>
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
						<BR>文件名称：<%=yszpmc%>
						<BR>对应项目：<%=zpxm%>
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
	if (<%=js%>>1)
	{
		for (var i=1;i<= <%=js%> ;i++ )
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


	FormName.action="SaveEditCrm_heyszpAll.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>