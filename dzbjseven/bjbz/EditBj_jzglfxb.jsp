<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT xmmc,dqmc,xmdlmc,xmxlmc";
	ls_sql+=" FROM bj_jzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_jzbjb.bjbbh='"+bjbbh+"' and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and bj_jzbjb.dqbm=dm_dqbm.dqbm and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
	}
	else{
		out.println("������Ŀ������");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>��װ���Ϸ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" >
  <div align="center">�޸ļ�װ���Ϸ�����
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr> 
        <td width="19%">������<%=dqmc%></td>
        <td width="47%">��Ŀ���ࣺ<%=xmdlbm%></td>
        <td width="34%">��ĿС�ࣺ<%=xmxlbm%></td>
      </tr>
      <tr> 
        <td width="19%">��Ŀ��ţ�<%=xmbh%></td>
        <td width="47%">��Ŀ���ƣ�<%=xmmc%></td>
        <td width="34%">���ۼ��� <%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%>��&nbsp;&nbsp;&nbsp;���۰汾�ţ�<%=bjbbh%></td>
      </tr>
    </table>
  </div>
  <table border="1" cellspacing="0" cellpadding="1" width="125%" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="12" > 
        <div align="center"> 
          <input type="hidden" name="bjbbh"  value="<%=bjbbh%>" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="button"  value="����" onClick="f_do(editform)" name="savebutton">
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="button"  value="ɾ��" onClick="f_sc(editform)" >
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="reset"  value="����">
        </div>
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="2%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="5%">���Ϸ���</td>
	  <td width="5%">�Ƿ���Ҫ��������</td>
	  <td width="5%">����</td>
      <td width="8%">���ϱ���</td>
      <td width="12%">��������</td>
      <td width="5%">����</td>
      <td width="5%">������λ</td>
      <td width="5%">����</td>
      <td width="5%">��ȩ�ͷ���</td>
      <td width="5%">���ͷ���</td>
      <td width="5%">TVOC�ͷ���</td>
      <td width="31%" align="left">��ע</td>
    </tr>
    <%
	String bgcolor=null;
	String glbxh=null;
	String glflbm=null;
	String glfxclmc=null;
	String pp=null;
	String xh=null;
	String gg=null;
	String xl=null;
	String jldwbm=null;
	String bjjb=null;
	String glfxclbm="";
	double xhl=0;
	double dj=0;
	String lx=null;
	String wlllbz=null;
	String bz=null;
	double jqsfl=0;
	double bsfl=0;
	double tvocsfl=0;

	int row=0;
	ls_sql="select glbxh,dqmc,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,bz ";
	ls_sql+=" FROM bj_jzglfxb,dm_dqbm ";
	ls_sql+=" where bj_jzglfxb.bjbbh='"+bjbbh+"' and bj_jzglfxb.dqbm='"+dqbm+"' and bj_jzglfxb.xmbh='"+xmbh+"' and bj_jzglfxb.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and bj_jzglfxb.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" order by glflbm,glbxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		glbxh=rs.getString("glbxh");
		dqmc=rs.getString("dqmc");

		glfxclmc=rs.getString("glfxclmc");
		glfxclbm=cf.fillNull(rs.getString("glfxclbm"));
		glflbm=rs.getString("glflbm");
//		pp=cf.fillNull(rs.getString("pp"));
//		xh=cf.fillNull(rs.getString("xh"));
//		gg=cf.fillNull(rs.getString("gg"));
		dj=rs.getDouble("dj");
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		jqsfl=rs.getDouble("jqsfl");
		bsfl=rs.getDouble("bsfl");
		tvocsfl=rs.getDouble("tvocsfl");
		lx=cf.fillNull(rs.getString("lx"));
		wlllbz=rs.getString("wlllbz");
		bz=cf.fillNull(rs.getString("bz"));


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
      <td><%=(row+1)%> </td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glfxclbm[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm",glflbm);
					%> 
        </select>
      </td>
		<td>
			<select name="wlllbz" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glfxclmc[<%=row%>])">
			  <option value=""></option>
			  <%
cf.selectToken(out,"Y+��Ҫ&N+��",wlllbz);
				%> 
			</select>
		</td>
		<td>
			<select name="lx" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glfxclmc[<%=row%>])">
			  <option value=""></option>
			  <%
cf.selectToken(out,"1+��ӡ&2+����ӡ",lx);
				%> 
			</select>
		</td>
      <td> 
        <input type="text" name="glfxclbm" value="<%=glfxclbm%>" size="12" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glfxclmc[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="glfxclmc" value="<%=glfxclmc%>" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="dj" value="<%=dj%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(bz[<%=(row+1)%>])">
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
        <input type="text" name="jqsfl" value="<%=jqsfl%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="bsfl" value="<%=bsfl%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="tvocsfl" value="<%=tvocsfl%>" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="bz" value="<%=bz%>" size="53" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])">
      </td>
    </tr>
    <%
		row++;
	}
	rs.close();
	ps.close();

	for (;row<40 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td> &nbsp; 
        <input type="hidden" name="glbxh"  value="" >
      </td>
      <td><%=(row+1)%> </td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glfxclbm[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
					%> 
        </select>
      </td>
		<td>
			<select name="wlllbz" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glfxclmc[<%=row%>])">
			  <option value=""></option>
			  <%
cf.selectToken(out,"Y+��Ҫ&N+��","");
				%> 
			</select>
		</td>
		<td>
			<select name="lx" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(glfxclmc[<%=row%>])">
			  <option value=""></option>
			  <%
cf.selectToken(out,"1+��ӡ&2+����ӡ","");
				%> 
			</select>
		</td>
      <td> 
        <input type="text" name="glfxclbm" value="" size="12" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glfxclmc[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="glfxclmc" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="dj" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(bz[<%=(row+1)%>])"">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(xhl[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="xhl" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="jqsfl" value="" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="bsfl" value="" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="tvocsfl" value="" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="bz" size="53" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])"">
      </td>
    </tr>
    <%

	}
%> 
    <tr> 
      <td colspan="9" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)" name="savebutton">
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	FormName.action="SaveEditBj_jzglfxb.jsp";
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
//-->
</SCRIPT>
