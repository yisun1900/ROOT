<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��װ���Ϸ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dqbm=request.getParameter("bj_jzglfxb_dqbm");
	String dqmc=cf.executeQuery("select dqmc from dm_dqbm where dqbm='"+dqbm+"'");
%>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" target="_blank">
<div align="center">�޸ļ�װ���Ϸ�����������<%=dqmc%>��</div>
<table border="1" cellspacing="0" cellpadding="1" width="300%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="1%">&nbsp;</td>
		<td width="2%">���</td>
		<td width="4%">��Ŀ���</td>
		<td width="8%">��Ŀ����</td>
		<td width="3%">���ۼ���</td>
		<td width="3%">���Ϸ���</td>
		<td width="3%">�Ƿ���Ҫ��������</td>
		<td width="3%">������λ</td>
		<td width="3%">����</td>
		<td width="3%">����</td>
		<td width="5%">���ϱ���</td>
		<td width="9%">��������</td>
		<td width="6%">Ʒ��</td>
		<td width="6%">�ͺ�</td>
		<td width="6%">���</td>
		<td width="9%">ϵ��</td>
		<td width="36%">��ע</td>
	</tr>
<%
	String wheresql="";
	String bj_jzglfxb_glbxh=null;

	String bj_jzglfxb_xmbh=null;
	String bj_jzglfxb_xmmc=null;
	String bj_jzglfxb_xmdlbm=null;
	String bj_jzglfxb_xmxlbm=null;
	String bj_jzglfxb_glflbm=null;
	String bj_jzglfxb_glmc=null;
	String bj_jzglfxb_pp=null;
	String bj_jzglfxb_xh=null;
	String bj_jzglfxb_jldwbm=null;
	String bj_jzglfxb_xhl=null;
	String bj_jzglfxb_dj=null;
	String bj_jzglfxb_lrr=null;
	String bj_jzglfxb_lrsj=null;


	String inwlbm=null;
	inwlbm=request.getParameter("wlbm");
	if (inwlbm!=null)
	{
		if (!(inwlbm.equals("")))	wheresql+=" and (bj_jzglfxb.wlbm='"+inwlbm+"') ";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		if (!(bjjbbm.equals("")))	wheresql+=" and (bj_jzglfxb.bjjbbm='"+bjjbbm+"') ";
	}

	bj_jzglfxb_glbxh=request.getParameter("bj_jzglfxb_glbxh");
	if (bj_jzglfxb_glbxh!=null)
	{
		bj_jzglfxb_glbxh=bj_jzglfxb_glbxh.trim();
		if (!(bj_jzglfxb_glbxh.equals("")))	wheresql+=" and (bj_jzglfxb.glbxh="+bj_jzglfxb_glbxh+") ";
	}

	bj_jzglfxb_xmbh=request.getParameter("bj_jzglfxb_xmbh");
	if (bj_jzglfxb_xmbh!=null)
	{
		bj_jzglfxb_xmbh=cf.GB2Uni(bj_jzglfxb_xmbh);
		if (!(bj_jzglfxb_xmbh.equals("")))	wheresql+=" and  (bj_jzglfxb.xmbh='"+bj_jzglfxb_xmbh+"')";
	}
	bj_jzglfxb_xmmc=request.getParameter("bj_jzglfxb_xmmc");
	if (bj_jzglfxb_xmmc!=null)
	{
		bj_jzglfxb_xmmc=cf.GB2Uni(bj_jzglfxb_xmmc);
		if (!(bj_jzglfxb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc='"+bj_jzglfxb_xmmc+"')";
	}
	bj_jzglfxb_xmdlbm=request.getParameter("bj_jzglfxb_xmdlbm");
	if (bj_jzglfxb_xmdlbm!=null)
	{
		bj_jzglfxb_xmdlbm=cf.GB2Uni(bj_jzglfxb_xmdlbm);
		if (!(bj_jzglfxb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+bj_jzglfxb_xmdlbm+"')";
	}
	bj_jzglfxb_xmxlbm=request.getParameter("bj_jzglfxb_xmxlbm");
	if (bj_jzglfxb_xmxlbm!=null)
	{
		bj_jzglfxb_xmxlbm=cf.GB2Uni(bj_jzglfxb_xmxlbm);
		if (!(bj_jzglfxb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+bj_jzglfxb_xmxlbm+"')";
	}
	bj_jzglfxb_glflbm=request.getParameter("bj_jzglfxb_glflbm");
	if (bj_jzglfxb_glflbm!=null)
	{
		bj_jzglfxb_glflbm=cf.GB2Uni(bj_jzglfxb_glflbm);
		if (!(bj_jzglfxb_glflbm.equals("")))	wheresql+=" and  (bj_jzglfxb.glflbm='"+bj_jzglfxb_glflbm+"')";
	}
	bj_jzglfxb_glmc=request.getParameter("bj_jzglfxb_glmc");
	if (bj_jzglfxb_glmc!=null)
	{
		bj_jzglfxb_glmc=cf.GB2Uni(bj_jzglfxb_glmc);
		if (!(bj_jzglfxb_glmc.equals("")))	wheresql+=" and  (bj_jzglfxb.glmc='"+bj_jzglfxb_glmc+"')";
	}
	bj_jzglfxb_pp=request.getParameter("bj_jzglfxb_pp");
	if (bj_jzglfxb_pp!=null)
	{
		bj_jzglfxb_pp=cf.GB2Uni(bj_jzglfxb_pp);
		if (!(bj_jzglfxb_pp.equals("")))	wheresql+=" and  (bj_jzglfxb.pp='"+bj_jzglfxb_pp+"')";
	}
	bj_jzglfxb_xh=request.getParameter("bj_jzglfxb_xh");
	if (bj_jzglfxb_xh!=null)
	{
		bj_jzglfxb_xh=cf.GB2Uni(bj_jzglfxb_xh);
		if (!(bj_jzglfxb_xh.equals("")))	wheresql+=" and  (bj_jzglfxb.xh='"+bj_jzglfxb_xh+"')";
	}
	bj_jzglfxb_jldwbm=request.getParameter("bj_jzglfxb_jldwbm");
	if (bj_jzglfxb_jldwbm!=null)
	{
		bj_jzglfxb_jldwbm=cf.GB2Uni(bj_jzglfxb_jldwbm);
		if (!(bj_jzglfxb_jldwbm.equals("")))	wheresql+=" and  (bj_jzglfxb.jldwbm='"+bj_jzglfxb_jldwbm+"')";
	}
	bj_jzglfxb_xhl=request.getParameter("bj_jzglfxb_xhl");
	if (bj_jzglfxb_xhl!=null)
	{
		bj_jzglfxb_xhl=bj_jzglfxb_xhl.trim();
		if (!(bj_jzglfxb_xhl.equals("")))	wheresql+=" and  (bj_jzglfxb.xhl="+bj_jzglfxb_xhl+") ";
	}
	bj_jzglfxb_dj=request.getParameter("bj_jzglfxb_dj");
	if (bj_jzglfxb_dj!=null)
	{
		bj_jzglfxb_dj=bj_jzglfxb_dj.trim();
		if (!(bj_jzglfxb_dj.equals("")))	wheresql+=" and  (bj_jzglfxb.dj="+bj_jzglfxb_dj+") ";
	}
	bj_jzglfxb_lrr=request.getParameter("bj_jzglfxb_lrr");
	if (bj_jzglfxb_lrr!=null)
	{
		bj_jzglfxb_lrr=cf.GB2Uni(bj_jzglfxb_lrr);
		if (!(bj_jzglfxb_lrr.equals("")))	wheresql+=" and  (bj_jzglfxb.lrr='"+bj_jzglfxb_lrr+"')";
	}
	bj_jzglfxb_lrsj=request.getParameter("bj_jzglfxb_lrsj");
	if (bj_jzglfxb_lrsj!=null)
	{
		bj_jzglfxb_lrsj=bj_jzglfxb_lrsj.trim();
		if (!(bj_jzglfxb_lrsj.equals("")))	wheresql+="  and (bj_jzglfxb.lrsj=TO_DATE('"+bj_jzglfxb_lrsj+"','YYYY/MM/DD'))";
	}


String xsxmbh=null;
String xmbh=null;
String oldxmbh="";
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;

String bgcolor=null;
String glbxh=null;
String glflbm=null;
String glmc=null;
String pp=null;
String xh=null;
String gg=null;
String xl=null;
String jldwbm=null;
double xhl=0;
double dj=0;
String wlbm=null;
String wlllbz=null;
String bz=null;

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

	ls_sql="SELECT glbxh,bj_jzglfxb.xmbh,xmmc,dqmc,xmdlmc,xmxlmc,glflbm,wlllbz,glmc,pp,bj_jzglfxb.xh,bj_jzglfxb.gg,bj_jzglfxb.xl,bj_jzglfxb.jldwbm,xhl,dj,bj_jzglfxb.bjjbbm,bj_jzglfxb.wlbm,bj_jzglfxb.bz";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_jzglfxb.dqbm=bj_jzbjb.dqbm(+) and bj_jzglfxb.xmbh=bj_jzbjb.xmbh(+) and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm(+)";
    ls_sql+=" and bj_jzglfxb.dqbm=dm_dqbm.dqbm and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ls_sql+=" and  (bj_jzglfxb.dqbm='"+dqbm+"')";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzglfxb.bjjbbm,bj_jzglfxb.glflbm,bj_jzglfxb.glbxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		if (rownum>500)
		{
			out.println("���󣡽�����ܴ���500��");
			return;
		}

		glbxh=rs.getString("glbxh");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");

		glflbm=rs.getString("glflbm");
		wlllbz=rs.getString("wlllbz");
		glmc=rs.getString("glmc");
		pp=cf.fillNull(rs.getString("pp"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		xl=cf.fillNull(rs.getString("xl"));
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		dj=rs.getDouble("dj");
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		wlbm=cf.fillNull(rs.getString("wlbm"));
		bz=cf.fillNull(rs.getString("bz"));

		if (xmbh.equals(oldxmbh))
		{
			xsxmbh="<font color='#0000FF'>ͬ��</font>";
			xmmc="<font color='#0000FF'>ͬ��</font>";
			xmdlbm="<font color='#0000FF'>ͬ��</font>";
			xmxlbm="<font color='#0000FF'>ͬ��</font>";
			dqmc="<font color='#0000FF'>ͬ��</font>";
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
			<td><%=xsxmbh%>
				<input type="hidden" name="xmbh"  value="<%=xmbh%>" >
			</td>
			<td><%=xmmc%></td>
		  <td>
			<select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:62PX" onKeyUp="keyGo(glflbm[<%=row%>])">
			  <option value=""></option>
			  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
						%> 
			</select>
		  </td>
			<td>
				<select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(wlllbz[<%=row%>])">
				  <option value=""></option>
				  <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm",glflbm);
					%> 
				</select>
			</td>
			<td>
				<select name="wlllbz" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glmc[<%=row%>])">
				  <option value=""></option>
				  <%
	cf.selectToken(out,"Y+��Ҫ&N+��",wlllbz);
					%> 
				</select>
			</td>
			<td>
				<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(xhl[<%=row%>])">
				  <option value=""></option>
				  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc",jldwbm);
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
				<input type="text" name="wlbm" value="<%=wlbm%>" size="12" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])">
			  </td>
			<td>
				<input type="text" name="glmc" value="<%=glmc%>" size="25" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[<%=row%>])">
			</td>
			<td>
				<input type="text" name="pp" value="<%=pp%>" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xh[<%=row%>])">
			</td>
			<td>
				<input type="text" name="xh" value="<%=xh%>" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gg[<%=row%>])">
			</td>
			<td>
				<input type="text" name="gg" value="<%=gg%>" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xl[<%=row%>])">
			</td>
			<td>
				<input type="text" name="xl" value="<%=xl%>" size="25" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bz" value="<%=bz%>" size="78" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wlbm[<%=row%>])">
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr> 
  <td colspan="16" > 
	<div align="center"> 
	<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)" name="savebutton">
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button"  value="ȫѡ" onClick="cf_checkAll(editform)" name="savebutton">
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button"  value="ɾ��" onClick="f_sc(editform)" >
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset"  value="����">
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
function f_do(FormName)//����FormName:Form������
{

	FormName.action="SaveAllEditBj_jzglfxb.jsp";
	FormName.submit();
	return true;
}
function f_sc(FormName)//����FormName:Form������
{
	var choo=0;
	if ( confirm("ȷʵҪ������?") )	{
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
			alert("��ѡ����Ҫ����������");
			return false;
		}
		else{
			FormName.action="DeleteBj_jzglfxb.jsp";
			FormName.submit();
			return true;
		}
	}
} 

var mark=1;
function cf_checkAll(formName)//ת���ַ���
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


