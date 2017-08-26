<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>公装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" target="_blank">
<div align="center">修改公装工料分析表</div>
<table border="1" cellspacing="0" cellpadding="1" width="160%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="2%">&nbsp;</td>
		<td width="3%">序号</td>
		<td width="4%">地区</td>
		<td width="6%">项目大类</td>
		<td width="8%">项目小类</td>
		<td width="13%">项目名称</td>
		<td width="7%">项目编号</td>

		  <td width="7%">报价级别</td>
		<td width="5%">工料分类</td>
		<td width="13%">工料名称</td>
		<td width="5%">计量单位</td>
		<td width="6%">消耗量</td>
		<td width="6%">单价</td>
		<td width="10%">品牌</td>
		<td width="12%">型号规格</td>
	</tr>
<%
	String wheresql="";
	String bj_gzglfxb_glbxh=null;
	String bj_gzglfxb_dqbm=null;
	String bj_gzglfxb_xmbh=null;
	String bj_gzglfxb_xmmc=null;
	String bj_gzglfxb_xmdlbm=null;
	String bj_gzglfxb_xmxlbm=null;
	String bj_gzglfxb_glflbm=null;
	String bj_gzglfxb_glmc=null;
	String bj_gzglfxb_pp=null;
	String bj_gzglfxb_xhgg=null;
	String bj_gzglfxb_jldwbm=null;
	String bj_gzglfxb_xhl=null;
	String bj_gzglfxb_dj=null;
	String bj_gzglfxb_lrr=null;
	String bj_gzglfxb_lrsj=null;

	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and (bj_gzglfxb.bjjb='"+bjjb+"') ";
	}

	bj_gzglfxb_glbxh=request.getParameter("bj_gzglfxb_glbxh");
	if (bj_gzglfxb_glbxh!=null)
	{
		bj_gzglfxb_glbxh=bj_gzglfxb_glbxh.trim();
		if (!(bj_gzglfxb_glbxh.equals("")))	wheresql+=" and (bj_gzglfxb.glbxh="+bj_gzglfxb_glbxh+") ";
	}
	bj_gzglfxb_dqbm=request.getParameter("bj_gzglfxb_dqbm");
	if (bj_gzglfxb_dqbm!=null)
	{
		bj_gzglfxb_dqbm=cf.GB2Uni(bj_gzglfxb_dqbm);
		if (!(bj_gzglfxb_dqbm.equals("")))	wheresql+=" and  (bj_gzglfxb.dqbm='"+bj_gzglfxb_dqbm+"')";
	}
	bj_gzglfxb_xmbh=request.getParameter("bj_gzglfxb_xmbh");
	if (bj_gzglfxb_xmbh!=null)
	{
		bj_gzglfxb_xmbh=cf.GB2Uni(bj_gzglfxb_xmbh);
		if (!(bj_gzglfxb_xmbh.equals("")))	wheresql+=" and  (bj_gzglfxb.xmbh='"+bj_gzglfxb_xmbh+"')";
	}
	bj_gzglfxb_xmmc=request.getParameter("bj_gzglfxb_xmmc");
	if (bj_gzglfxb_xmmc!=null)
	{
		bj_gzglfxb_xmmc=cf.GB2Uni(bj_gzglfxb_xmmc);
		if (!(bj_gzglfxb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc='"+bj_gzglfxb_xmmc+"')";
	}
	bj_gzglfxb_xmdlbm=request.getParameter("bj_gzglfxb_xmdlbm");
	if (bj_gzglfxb_xmdlbm!=null)
	{
		bj_gzglfxb_xmdlbm=cf.GB2Uni(bj_gzglfxb_xmdlbm);
		if (!(bj_gzglfxb_xmdlbm.equals("")))	wheresql+=" and  (bj_gzbjb.xmdlbm='"+bj_gzglfxb_xmdlbm+"')";
	}
	bj_gzglfxb_xmxlbm=request.getParameter("bj_gzglfxb_xmxlbm");
	if (bj_gzglfxb_xmxlbm!=null)
	{
		bj_gzglfxb_xmxlbm=cf.GB2Uni(bj_gzglfxb_xmxlbm);
		if (!(bj_gzglfxb_xmxlbm.equals("")))	wheresql+=" and  (bj_gzbjb.xmxlbm='"+bj_gzglfxb_xmxlbm+"')";
	}
	bj_gzglfxb_glflbm=request.getParameter("bj_gzglfxb_glflbm");
	if (bj_gzglfxb_glflbm!=null)
	{
		bj_gzglfxb_glflbm=cf.GB2Uni(bj_gzglfxb_glflbm);
		if (!(bj_gzglfxb_glflbm.equals("")))	wheresql+=" and  (bj_gzglfxb.glflbm='"+bj_gzglfxb_glflbm+"')";
	}
	bj_gzglfxb_glmc=request.getParameter("bj_gzglfxb_glmc");
	if (bj_gzglfxb_glmc!=null)
	{
		bj_gzglfxb_glmc=cf.GB2Uni(bj_gzglfxb_glmc);
		if (!(bj_gzglfxb_glmc.equals("")))	wheresql+=" and  (bj_gzglfxb.glmc='"+bj_gzglfxb_glmc+"')";
	}
	bj_gzglfxb_pp=request.getParameter("bj_gzglfxb_pp");
	if (bj_gzglfxb_pp!=null)
	{
		bj_gzglfxb_pp=cf.GB2Uni(bj_gzglfxb_pp);
		if (!(bj_gzglfxb_pp.equals("")))	wheresql+=" and  (bj_gzglfxb.pp='"+bj_gzglfxb_pp+"')";
	}
	bj_gzglfxb_xhgg=request.getParameter("bj_gzglfxb_xhgg");
	if (bj_gzglfxb_xhgg!=null)
	{
		bj_gzglfxb_xhgg=cf.GB2Uni(bj_gzglfxb_xhgg);
		if (!(bj_gzglfxb_xhgg.equals("")))	wheresql+=" and  (bj_gzglfxb.xhgg='"+bj_gzglfxb_xhgg+"')";
	}
	bj_gzglfxb_jldwbm=request.getParameter("bj_gzglfxb_jldwbm");
	if (bj_gzglfxb_jldwbm!=null)
	{
		bj_gzglfxb_jldwbm=cf.GB2Uni(bj_gzglfxb_jldwbm);
		if (!(bj_gzglfxb_jldwbm.equals("")))	wheresql+=" and  (bj_gzglfxb.jldwbm='"+bj_gzglfxb_jldwbm+"')";
	}
	bj_gzglfxb_xhl=request.getParameter("bj_gzglfxb_xhl");
	if (bj_gzglfxb_xhl!=null)
	{
		bj_gzglfxb_xhl=bj_gzglfxb_xhl.trim();
		if (!(bj_gzglfxb_xhl.equals("")))	wheresql+=" and  (bj_gzglfxb.xhl="+bj_gzglfxb_xhl+") ";
	}
	bj_gzglfxb_dj=request.getParameter("bj_gzglfxb_dj");
	if (bj_gzglfxb_dj!=null)
	{
		bj_gzglfxb_dj=bj_gzglfxb_dj.trim();
		if (!(bj_gzglfxb_dj.equals("")))	wheresql+=" and  (bj_gzglfxb.dj="+bj_gzglfxb_dj+") ";
	}
	bj_gzglfxb_lrr=request.getParameter("bj_gzglfxb_lrr");
	if (bj_gzglfxb_lrr!=null)
	{
		bj_gzglfxb_lrr=cf.GB2Uni(bj_gzglfxb_lrr);
		if (!(bj_gzglfxb_lrr.equals("")))	wheresql+=" and  (bj_gzglfxb.lrr='"+bj_gzglfxb_lrr+"')";
	}
	bj_gzglfxb_lrsj=request.getParameter("bj_gzglfxb_lrsj");
	if (bj_gzglfxb_lrsj!=null)
	{
		bj_gzglfxb_lrsj=bj_gzglfxb_lrsj.trim();
		if (!(bj_gzglfxb_lrsj.equals("")))	wheresql+="  and (bj_gzglfxb.lrsj=TO_DATE('"+bj_gzglfxb_lrsj+"','YYYY/MM/DD'))";
	}


String dqbm=null;
String xsxmbh=null;
String xmbh=null;
String oldxmbh="";
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;

String bgcolor=null;
String glbxh=null;
String glflbm=null;
String glmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
double xhl=0;
double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();

	int row=0;


	ls_sql="SELECT glbxh,bj_gzglfxb.xmbh,xmmc,bj_gzglfxb.dqbm,dqmc,xmdlmc,xmxlmc,glflbm,glmc,pp,xhgg,bj_gzglfxb.jldwbm,xhl,dj,bjjb";
	ls_sql+=" FROM bj_gzglfxb,bj_gzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_gzglfxb.dqbm=bj_gzbjb.dqbm(+) and bj_gzglfxb.xmbh=bj_gzbjb.xmbh(+) ";
	ls_sql+=" and bj_gzglfxb.dqbm=dm_dqbm.dqbm and bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xmbh,bj_gzglfxb.glflbm,bj_gzglfxb.glbxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;

		glbxh=rs.getString("glbxh");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		dqbm=rs.getString("dqbm");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");

		glflbm=rs.getString("glflbm");
		glmc=rs.getString("glmc");
		pp=cf.fillNull(rs.getString("pp"));
		xhgg=cf.fillNull(rs.getString("xhgg"));
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));

		if (xmbh.equals(oldxmbh))
		{
			xsxmbh="<font color='#0000FF'>同上</font>";
			xmmc="<font color='#0000FF'>同上</font>";
			xmdlbm="<font color='#0000FF'>同上</font>";
			xmxlbm="<font color='#0000FF'>同上</font>";
			dqmc="<font color='#0000FF'>同上</font>";
		}
		else{
			oldxmbh=xmbh;
			xsxmbh=xmbh;
		}

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td>
				<input name="scglbxh" type=checkbox value="<%=glbxh%>">
				<input type="hidden" name="glbxh"  value="<%=glbxh%>" >
			</td>
			<td><%=(row+1)%>
			</td>
			<td><%=dqmc%>
				<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
			</td>
			<td><%=xmdlbm%></td>
			<td><%=xmxlbm%></td>
			<td><%=xmmc%></td>
			<td><%=xsxmbh%>
				<input type="hidden" name="xmbh"  value="<%=xmbh%>" >
			</td>
		  <td>
			<select name="bjjb" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(glflbm[<%=row%>])">
			  <option value=""></option>
			  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjb);
						%> 
			</select>
		  </td>
			<td>
				<select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glmc[<%=row%>])">
				  <option value=""></option>
				  <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm",glflbm);
					%> 
				</select>
			</td>
			<td>
				<input type="text" name="glmc" value="<%=glmc%>" size="18" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[<%=row%>])">
			</td>
			<td>
				<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(xhl[<%=row%>])">
				  <option value=""></option>
				  <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc",jldwbm);
					%> 
				</select>
			</td>
			<td>
				<input type="text" name="xhl" value="<%=xhl%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
			</td>
			<td>
				<input type="text" name="dj" value="<%=dj%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=row%>])">
			</td>
			<td>
				<input type="text" name="pp" value="<%=pp%>" size="14" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xhgg[<%=row%>])">
			</td>
			<td>
				<input type="text" name="xhgg" value="<%=xhgg%>" size="18" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])">
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr> 
  <td colspan="13" > 
	<div align="center"> 
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button"  value="全选" onClick="cf_checkAll(editform)" name="savebutton">
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button"  value="删除" onClick="f_sc(editform)" >
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset"  value="重输">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.action="SaveAllEditBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}
function f_sc(FormName)//参数FormName:Form的名称
{
	var choo=0;
	if ( confirm("确实要继续吗?") )	{
		var i = 0;
		if (100==1){
			if( FormName.scglbxh.checked ){
				choo=1;
			}
		} 
		else{ 
			for (i=0;i <<%=rownum%>;i++ ){
				if( FormName.scglbxh[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			FormName.action="DeleteBj_gzglfxb.jsp";
			FormName.submit();
			return true;
		}
	}
} 

var mark=1;
function cf_checkAll(formName)//转换字符串
{
	var i = 0;
	if (100==1){
		if (mark==0)
		{
			formName.scglbxh.checked =false
		}
		else{
			formName.scglbxh.checked =true
		}
	}
	else{ 
		for (i=0;i <<%=rownum%>;i++ ){
			if (mark==0)
			{
				formName.scglbxh[i].checked =false
			}
			else{
				formName.scglbxh[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}
//-->
</SCRIPT>


